
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="section-title">
	<h2>My Game</h2>
	<p>Game</p>	
</div>

<div class="row">

	<c:forEach items="${listGame}" var="g">
		<c:if test="${g.status==true }">
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
							<a
								href="/game/remove?id=${g.id }"> <i
								class="bi bi-trash-fill"></i></a> 
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>


</div>
