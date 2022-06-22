package com.example.demo.controllers;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.entities.Game;
import com.example.demo.entities.Order;
import com.example.demo.entities.OrderDetail;
import com.example.demo.entities.OrderGame;
import com.example.demo.services.CartService;
import com.example.demo.services.GameService;
import com.example.demo.services.OrderDetailService;
import com.example.demo.services.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService ser;
	@Autowired
	private OrderDetailService detailService;
	@Autowired
	private CartService Cser;
	@Autowired
	private GameService Gser;
	@Autowired
	private OrderDetailService Odser;
	@GetMapping("/index")
	public String index(ModelMap map) {
		List<OrderGame> list = Cser.getAll();
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
		map.addAttribute("view", "/WEB-INF/views/order/index.jsp");
		return "layout";
	}
	
	@PostMapping("/add")
	public String add(ModelMap map, Order o) {
		o.setCreatedDate(new Date());
		o.setStatus("Chờ xác nhận");
		Long oid = ser.addOrder(o).getId();
		List<OrderGame> list = Cser.getAll();
		for (OrderGame oo : list) {
			OrderDetail od = new OrderDetail();
			Long idgame = Long.parseLong(oo.getGameId());
			try {
				Game g = Gser.findId(idgame);
				g.setStatus(true);
				Gser.updateGame(g);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			od.setGameId(oo.getGameId());
			od.setGameName(oo.getNameGame());
			od.setImg(oo.getImg());
			od.setMadonhang(oid);
			od.setPrice(oo.getPrice());
			od.setPublisher(oo.getPublisher());
			od.setType(oo.getType());
			od.setSoLuong(oo.getSoLuong());
			Odser.add(od);
			
			try {
				Cser.deleteCart(oo.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		map.addAttribute("mdh", oid);
		map.addAttribute("view", "/WEB-INF/views/order/done.jsp");
		return "layout";
	}
	@GetMapping("/detail")
	public String detail(ModelMap map,Long mdh) {
		Order order=ser.findId(mdh);
		List<OrderDetail> list=detailService.getByMaDonHang(mdh);
		int tongsp = 0;
		BigDecimal tongth = new BigDecimal(0);
		for (OrderDetail o : list) {
			tongsp += o.getSoLuong();
			tongth = tongth.add(o.getPrice().multiply(new BigDecimal(o.getSoLuong())));
		}
		map.addAttribute("tongsp", tongsp);
		map.addAttribute("tongth", tongth);
		map.addAttribute("tamtinh", tongth);
		map.addAttribute("order", order);
		map.addAttribute("list", list);
		map.addAttribute("view", "/WEB-INF/views/order/detail.jsp");
		return "layout";
	}

}
