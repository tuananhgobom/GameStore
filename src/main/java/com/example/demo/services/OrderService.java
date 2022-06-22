package com.example.demo.services;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Order;
import com.example.demo.repositories.IOrderRepository;

@Service
public class OrderService {
	@Autowired
	private IOrderRepository repository;
	
	public Order addOrder(Order order) {
		order.setCreatedDate(new Date());
		return repository.save(order);
	}
	

	
	public Order updateCart(Order cart) throws Exception {
			return repository.save(cart);
	}
	
	public Order deleteCart(Long id) throws Exception {
	      Optional<Order> cart = repository.findById(id);
	      if(cart.isPresent()) {
	    	  repository.delete(cart.get());
	    	  return cart.get();
	      }else {
			throw new Exception("Không tìm thấy id");
		}
	}
	
	public List<Order> getAll(){
		return repository.findAll();
	}
	
	public Order findId(Long id) {
		Optional<Order> cart = repository.findById(id);
		return cart.isPresent()?cart.get():null;
	}
}
