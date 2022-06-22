<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row text-light">
	<div class="row fs-2 fw-bold">Cảm ơn quý khách đã mua hàng! Mã đơn hàng của quý khách là: ${mdh}</div>
	<div class="row mt-3" >
		<a href="/game" class="col-2"><button class="btn btn-outline-light">Back home</button></a>
		<a href="/order/detail?mdh=${mdh}" class="col-2"><button class="btn btn-light">Show detail</button></a>
	</div>
</div>
