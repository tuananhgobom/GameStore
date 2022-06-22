
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="section-title">
	<h2>Detail Game</h2>
	<p>${game.name }</p>
	<div class="row mt-3">
		<div class="col-4">
			<img alt="" src="/images/${game.img }" class="w-100" height="200px">
		</div>
		<div class="col-4">
		<br>
		Thể loại: ${game.type }<br><br>
		Giá tiền: <fmt:formatNumber type="number" pattern="###,### VNĐ" value="${game.price}" /><br>
		Nhà phát hành: ${game.publisher }
		<br>		
		<div class="pt-5" >
		<a href="/cart/buynow?id=${game.id }" type="button" class="btn btn-primary">Mua ngay</a>
		<a href="/cart/add?id=${game.id }" type="button" class="btn btn-warning">Thêm vào giỏ hàng</a>
		</div>									
		</div>
		<div class="col-4 mt-2">
		Thông tin: ${game.info}
		
		</div>
	</div>


</div>
