package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Order;
import com.example.demo.entities.OrderDetail;

public interface IOrderDetailRepository extends JpaRepository<OrderDetail, Long>{
	List<OrderDetail> findByMadonhang(Long madonhang);
	OrderDetail findByGameId(String gameId);
}
