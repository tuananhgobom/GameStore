<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
	<div class="row">
		<div class="col-8">
			<table class="table table-light">
				<thead>
					<tr>
						<th>Name</th>
						<th>Giá</th>
						<th>Số Lượng</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="c">
						<tr>
							<td>${c.nameGame }</td>
							<td><fmt:formatNumber type="number" pattern="###,### VNĐ" value="${c.price}" /></td>
							<td>${c.soLuong }</td>
							<td><a href="/cart/delete?id=${c.id}">Xóa</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-4 border-left">
			<div class="d-flex justify-content-between mt-3">
				<div class="col-6">Tổng sản phẩm</div>
				<div class="col-6 text-end">${tongsp }</div>
			</div>
			<div class="d-flex justify-content-between mt-3">
				<div class="col-6">Tổng tiền hàng</div>
				<div class="col-6 text-end"><fmt:formatNumber type="number" pattern="###,### VNĐ" value="${tongth }" /></div>
			</div>
			<hr>
			<div class="d-flex justify-content-between mt-3">
				<div class="col-6">Tạm tính</div>
				<div class="col-6 text-end"><fmt:formatNumber type="number" pattern="###,### VNĐ" value="${tamtinh }" /></div>
			</div>
			<div class="mt-3">
				<a href="/game">
					<button class="btn btn-outline-primary">Back home</button>
				</a> <a href="/order/index" class="ms-2">
					<button class="btn btn-light">Pay</button>
				</a>
			</div>
		</div>
	</div>
</body>

</html>