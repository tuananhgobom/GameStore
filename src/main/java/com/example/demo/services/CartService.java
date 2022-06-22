package com.example.demo.services;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.OrderGame;
import com.example.demo.repositories.ICartRepository;

@Service
public class CartService {
	@Autowired
	private ICartRepository repository;
	
	public OrderGame addCart(OrderGame cart) {
		cart.setCreatedDate(new Date());
		return repository.save(cart);
	}
	
	public OrderGame findByGameId(String Gid) {
		return repository.findByGameId(Gid);
	}
	
	public OrderGame updateCart(OrderGame cart) throws Exception {
			return repository.save(cart);
	}
	
	public OrderGame deleteCart(Long id) throws Exception {
	      Optional<OrderGame> cart = repository.findById(id);
	      if(cart.isPresent()) {
	    	  repository.delete(cart.get());
	    	  return cart.get();
	      }else {
			throw new Exception("Không tìm thấy id");
		}
	}
	
	public List<OrderGame> getAll(){
		return repository.findAll();
	}
	
	public OrderGame findId(Long id) throws Exception {
		Optional<OrderGame> cart = repository.findById(id);
		if(cart.isPresent()) {
			return cart.get();
		}else {
			throw new Exception("Không tìm thấy");
		}
	}
}
