<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-8">
		<form action="/order/add" method="post">
			<div class="card text-dark">
				<div class="card-body">
					<div class="row mb-3">
						<div class="col-6">
							<label for="name">Họ và tên</label>
							<input type="text" name="name" id="name" class="form-control">
						</div>
						<div class="col-6">
							<Email for="email">Email</label>
							<input type="text" name="email" id="email" class="form-control">
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-12">
							<label for="phone">Phone</label>
							<input type="text" name="phone" id="phone" class="form-control">
						</div>
					</div>
				</div>
			</div>
			<div class="mt-3">
				<a href="/game"><button type="button" class="btn btn-outline-light col-2 ms-2">Back home</button></a>
				<a>	<button onclick="defaultL()"  type="button"  class="btn btn-outline-light col-2 ms-2">Default</button></a>
				<a><button class="btn btn-light col-2 ms-2">Pay now</button></a>
			</div>
		</form>
	</div>
	<div class="col-4">
		<table class="table text-white">
			<thead>
				<tr>
					<td>Name Game</td>
					<td>Quantity</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="c">
					<tr>
						<td>${c.nameGame}</td>
						<td>${c.soLuong}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="mt-3">
			<div class="justify-content-between d-flex mb-3">
				<div class="col-6">
					Tổng sản phẩm
				</div>
				<div class="col-6 text-end">
					${tongsp}
				</div>
			</div>
			<div class="justify-content-between d-flex mb-3">
				<div class="col-6">
					Tổng tiền hàng
				</div>
				<div class="col-6 text-end">
					<fmt:formatNumber type="number" pattern="###,### VNĐ" value="${tongth}" />
				</div>
			</div>
			<hr>
			<div class="justify-content-between d-flex mb-3">
				<div class="col-6">
					Tổng tiền
				</div>
				<div class="col-6 text-end">
					<fmt:formatNumber type="number" pattern="###,### VNĐ" value="${tamtinh}" />
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function defaultL(){
		document.getElementById('name').value = "Trịnh Tuấn Anh";
		document.getElementById('email').value = "tuananhngu@gmail.com";
		document.getElementById('phone').value = "0987777JQK";
	}
</script>