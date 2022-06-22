package com.example.demo.services;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Game;
import com.example.demo.entities.GameType;
import com.example.demo.repositories.IGameRepository;

@Service
public class GameService {
	@Autowired
	private IGameRepository repository;
	
	public Game addGame(Game game) {
		game.setCreatedDate(new Date());
		return repository.save(game);
	}
	
	public Game updateGame(Game game) throws Exception {
			return repository.save(game);
	}
	
	public Game deleteGame(Long id) throws Exception {
	      Optional<Game> game = repository.findById(id);
	      if(game.isPresent()) {
	    	  repository.delete(game.get());
	    	  return game.get();
	      }else {
			throw new Exception("Không tìm thấy id");
		}
	}
	public Page<Game> getPage(int PageNumber){
		
		return repository.findAll(PageRequest.of(PageNumber,7));
	}
	
	public List<Game> getAll(){
		return repository.findAll();
	}
	
	public Game findId(Long id) throws Exception {
		Optional<Game> game = repository.findById(id);
		if(game.isPresent()) {
			return game.get();
		}else {
			throw new Exception("Không tìm thấy");
		}
	}
	
	public Page<Game> getType(GameType type){
		return repository.findByType(type,PageRequest.of(0, 5));
	}
	
	public List<Game> getName(String name){
		return repository.findByNameLike("%"+name+"%");
	}
	
	public List<Game> getTypeName(GameType type,String name){
		return repository.findByTypeAndNameLike(type, "%"+name+"%");
	}
	
}
