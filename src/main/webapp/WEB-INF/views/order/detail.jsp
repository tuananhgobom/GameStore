<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-6">
		<div class="row">
			Order Id: ${order.id}
		</div>
		<div class="row">
			Name: ${order.name}
		</div>
		<div class="row">
			Email: ${order.email}
		</div>
		<div class="row">
			Phone Number: ${order.phone}
		</div>
		<div class="row">
			Status: ${order.status}
		</div>
	</div>
	<div class="col-6 border-left">
		<table class="table text-white">
				<thead>
					<tr>
						<th>Name</th>
						<th>Quantity</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="c">
						<tr>
							<td>${c.gameName}</td>
							<td>${c.soLuong}</td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
		<div class="justify-content-between d-flex mt-3">
			<div class="col-6">Tổng sản phẩm: </div>
			<div class="col-6 text-end">${tongsp}</div>
		</div>
		<div class="justify-content-between d-flex">
			<div class="col-6">Tổng tiền hàng: </div>
			<div class="col-6 text-end"><fmt:formatNumber type="number" pattern="###,### VNĐ" value="${tongth}" /></div>
		</div>
		<div class="justify-content-between d-flex">
			<div class="col-6">Thành tiền: </div>
			<div class="col-6 text-end"><fmt:formatNumber type="number" pattern="###,### VNĐ" value="${tamtinh}" /></div>
		</div>
		<div class="mt-3">
			<a href="/game">
				<button class="btn btn-outline-light">
					Back home
				</button>
			</a>
		</div>
	</div>
</div>