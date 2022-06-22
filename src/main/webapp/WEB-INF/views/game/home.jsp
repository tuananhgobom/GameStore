
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="section-title">
	<h2>Menu Game</h2>
	<p>Game</p>
	<div>
		<form action="/game">
			<div class="col-4">
				<div class="input-group">
					<input name="name" class="form-control" type="text"
						placeholder="Nhập tên Game">
					<button class="btn btn-dark">Tìm kiếm</button>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="row">

	<c:forEach items="${listGame}" var="g">
		<c:if test="${g.status==false }">
			<div class="col-lg-4 col-md-6">
				<div class="member" style="height: 200px" data-aos="zoom-in"
					data-aos-delay="100">
					<img src="/images/${g.img }" class="img-fluid" alt="">
					<div class="member-info">
						<div class="member-info-content">
							<h4>${g.name }</h4>
							<span><fmt:formatNumber type="number"
									pattern="###,### VNĐ" value="${g.price}" /></span>
						</div>
						<div class="social">
							<a href="/cart/add?id=${g.id }"><i
								class="bi bi-cart-plus-fill"></i></a> <a
								href="/game/detail?id=${g.id }"> <i
								class="bi bi-info-square-fill"></i></a> <a href=""><i
								class="bi bi-bag-check-fill"></i></a>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>


</div>
