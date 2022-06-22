package com.example.demo.controllers;

import java.io.File;
import java.util.List;


import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entities.Game;
import com.example.demo.entities.GameType;
import com.example.demo.entities.Publisher;
import com.example.demo.services.GameService;

@Controller
@RequestMapping("/game")
public class GameController {
    @Autowired
	private GameService service;
     
    @GetMapping("")
    public String showGame(Model model,@RequestParam(name = "name",defaultValue = "") String name) {
    	GameType[] type = GameType.values();
    	model.addAttribute("type",type);
    	List<Game> listGame = service.getName(name);
    	model.addAttribute("listGame",listGame);
    	model.addAttribute("view", "/WEB-INF/views/game/home.jsp");
    	return "layout";
    }
    
    @GetMapping("/mygame")
    public String myGame(Model model) {
    	List<Game> listGame = service.getAll();
    	model.addAttribute("listGame",listGame);
    	model.addAttribute("view", "/WEB-INF/views/game/mygame.jsp");
    	return "layout";
    }
    
    @GetMapping("/remove")
    public String remove(Model model,Long id) {
    	try {
			Game g = service.findId(id);
			g.setStatus(false);
			service.updateGame(g);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	List<Game> listGame = service.getAll();
    	model.addAttribute("listGame",listGame);
    	model.addAttribute("view", "/WEB-INF/views/game/mygame.jsp");
    	return "layout";
    }
    
    @GetMapping("/index")
    public String index(Model model,@RequestParam(name = "PageNumber", defaultValue = "0")Integer PageNumber) {
    	Page<Game> listGame = service.getPage(PageNumber);
    	model.addAttribute("listGame",listGame);
    	model.addAttribute("view", "/WEB-INF/views/game/index.jsp");
    	return "layout";
    }
    
    @GetMapping("/add")
    public String add(ModelMap modelMap) {
    	GameType[] type = GameType.values();
    	modelMap.addAttribute("type",type);
    	Publisher[] publishers = Publisher.values();
    	modelMap.addAttribute("pus", publishers);
    	modelMap.addAttribute("view", "/WEB-INF/views/game/add.jsp");
    	return "layout";
    }
    
    @PostMapping("/new")
    public String addGame(Model model, Game game) {
    	game.setStatus(false);
    	service.addGame(game);
    	return "redirect:/game/index";
    }
    
    @GetMapping("/delete/{id}")
    public String deleteGame(@PathVariable Long id) throws Exception {
    	service.deleteGame(id);
    	return "redirect:/game/index";
    }
    
    @GetMapping("/detail")
    public String detail(Long id, ModelMap modelMap) {
    	try {
			modelMap.addAttribute("game", service.findId(id));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	modelMap.addAttribute("view", "/WEB-INF/views/game/game.jsp");
    	return "layout";
    }
    
    @GetMapping("/edit")
      public String edit(ModelMap modelMap,Long id){
    	try {
			modelMap.addAttribute("game", service.findId(id));
			modelMap.addAttribute("type", GameType.values());
			modelMap.addAttribute("publisher", Publisher.values());
		} catch (Exception e) {
			e.printStackTrace();
		}
    	modelMap.addAttribute("view", "/WEB-INF/views/game/update.jsp");
    	return "layout";
    }
    
    @Autowired
    ServletContext app;
    
    @PostMapping("/update")
    public String update(Game game, ModelMap map, MultipartFile image) {
    	try {
			Game gamecu = service.findId(game.getId());
			game.setCreatedDate(gamecu.getCreatedDate());
			game.setStatus(gamecu.getStatus());
			String filename = image.getOriginalFilename();
			File file = new File(app.getRealPath("/images/" + filename));
			game.setImg(filename);
			image.transferTo(file);
			service.updateGame(game);
		} catch (Exception e) {
			try {
				Game gamecu = service.findId(game.getId());
				game.setCreatedDate(gamecu.getCreatedDate());
				game.setImg(gamecu.getImg());
				service.updateGame(game);
			} catch (Exception e2) {
				e.printStackTrace();
			}
		}
    	System.out.println(game);
    	return "redirect:/game/index";
   
    }
     
}
