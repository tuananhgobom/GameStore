<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
a.disabled {
	pointer-events: none;
	background-color: gray;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row mt-4">
			<div class="col-8 d-flex justify-content-center">
				<form action="/game/update?id=${game.id }" method="post" enctype="multipart/form-data">
					<div class="card">
						<h5 class="card-header">Update Game</h5>
						<div class="card-body">
							<div class="mt-2">
								<label>Game</label> <input type="text" name="name"
									class="form-control" value="${game.name }" required="required">
							</div>
							<div class="mt-2">
								<div class="row">
									<div class="col-4">
										<label>Type</label> <select class="form-select" name="type">
											<c:forEach items="${type }" var="t">
												<option value="${t }" ${t==game.type?'selected':'' }>${t }</option>
											</c:forEach>
										</select>
									</div>


								</div>
							</div>
							<div class="mt-2">
								<div class="row">
									<div class="col-6">
										<label>Nhà Phát Hành</label> <select class="form-select"
											name="publisher">
											<c:forEach items="${publisher}" var="p">
												<option value="${p }" ${p==game.publisher?'selected':'' }>${p }</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-6">
										<label>Price</label>
										<div class="input-group">
											<input type="number" name="price" min="0"
												class="form-control" value="${game.price }"> <span
												class="input-group-text">vnđ</span>
										</div>
									</div>
									<div class="col-6">
										<label>Cấu Hình</label>
										<div class="input-group">
											<input type="text" name="configuration" min="0"
												class="form-control" value="${game.configuration }">
										</div>
									</div>
									<div class="mt-2">
										<input type="file" name="image">

									</div>
									<div class="col-12">
										<label>Info</label> 
										<textarea name="info" rows="3" class="form-control" >${game.info}</textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<div>
							<button class="btn btn-success">Update</button>
							<button type="reset" class="btn btn-secondary">Reset</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
</body>
</html>