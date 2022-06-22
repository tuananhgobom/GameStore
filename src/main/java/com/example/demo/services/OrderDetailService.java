package com.example.demo.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.OrderDetail;
import com.example.demo.repositories.IOrderDetailRepository;
@Service
public class OrderDetailService {
	@Autowired
	private IOrderDetailRepository repository;
	
	public OrderDetail add(OrderDetail od) {
		return repository.save(od);
	}
	public List<OrderDetail> getByMaDonHang(Long ma){
		return repository.findByMadonhang(ma); 
	}
	
	public OrderDetail findGame(Long gameid) {
		return repository.findByGameId(gameid+"");
	}
}
