package com.example.demo.controllers;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.entities.Game;
import com.example.demo.entities.OrderDetail;
import com.example.demo.entities.OrderGame;
import com.example.demo.services.CartService;
import com.example.demo.services.GameService;
import com.example.demo.services.OrderDetailService;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private CartService ser;
	@Autowired
	private GameService Gser;
	@Autowired
	private OrderDetailService Ods;

	@GetMapping("/add")
	public String add(Long id, HttpServletRequest http) {
		try {
			Game g = Gser.findId(id);
			if (g.getStatus()==false) {
				OrderGame cd = ser.findByGameId(g.getId() + "");
				if (cd == null) {
					OrderGame c = new OrderGame();
					c.setCreatedDate(new Date());
					c.setGameId(g.getId() + "");
					c.setImg(g.getImg());
					c.setNameGame(g.getName());
					c.setPrice(g.getPrice());
					c.setPublisher(g.getPublisher());
					c.setType(g.getType());
					c.setSoLuong(1);
					c.setUserId("TuanAnhdeptrai");
					ser.addCart(c);
				} else {
					http.getSession().setAttribute("error", "Đã có trong giỏ hàng");
				}
			} else {
				http.getSession().setAttribute("error", "Đã mua game này rồi");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/game";
	}

	@GetMapping("/buynow")
	public String buynow(Long id, HttpServletRequest http) {
		try {
		Game g = Gser.findId(id);
			if (g.getStatus()==false) {
				
				OrderGame cd = ser.findByGameId(g.getId() + "");
				if (cd == null) {
					OrderGame c = new OrderGame();
					c.setCreatedDate(new Date());
					c.setGameId(g.getId() + "");
					c.setImg(g.getImg());
					c.setNameGame(g.getName());
					c.setPrice(g.getPrice());
					c.setPublisher(g.getPublisher());
					c.setType(g.getType());
					c.setSoLuong(1);
					c.setUserId("TuanAnhdeptrai");
					ser.addCart(c);
				} else {
					http.getSession().setAttribute("error", "Đã có trong giỏ hàng");
				}
			} else {
				http.getSession().setAttribute("error", "Đã mua game này rồi");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/cart/index";
	}

	@GetMapping("/index")
	public String index(ModelMap map) {
		List<OrderGame> list = ser.getAll();
		map.addAttribute("list", list);
		int tongsp = 0;
		BigDecimal tongth = new BigDecimal(0);
		for (OrderGame o : list) {
			tongsp += o.getSoLuong();
			tongth = tongth.add(o.getPrice().multiply(new BigDecimal(o.getSoLuong())));
		}
		map.addAttribute("tongsp", tongsp);
		map.addAttribute("tongth", tongth);
		map.addAttribute("tamtinh", tongth);
		map.addAttribute("view", "/WEB-INF/views/cart/index.jsp");
		return "layout";
	}

	@GetMapping("/delete")
	public String delete(ModelMap map, Long id) {
		try {
			ser.deleteCart(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/cart/index";
	}
}
