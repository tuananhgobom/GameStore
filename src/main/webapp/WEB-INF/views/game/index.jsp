<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Danh sách</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
a.hidden {
	pointer-events: none;
	background-color: gray;
}
</style>
</head>
<body onload="changeSelect()">
	<div class="container">
		<form action="/game/deleteList" method="get">
			<div class="card">
				<div class="card-header">
					<div class="row d-flex justify-content-between">
						<div class="col-3 fs-5">Game</div>
						<div class="col-7">
						</div>
						<div class="col-2">
							
							<a class="btn btn-success" href="/game/add">Add</a>
							<!-- Modal -->
							<div class="modal fade" id="delete" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Warning</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">Are you sure that you want to
											delete all game are choosed?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-danger">Yes</button>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="card-body">
					<table class="table table-hover m-0 p-0">
						<thead>
							<th>Name Game</th>
							<th>Ngày Tạo</th>
							<th>Price</th>
							<th>Thể Loại</th>
							<th>Nhà Phát Hành</th>
							<th>Cấu Hình</th>

							<th colspan="2">Activity</th>
						</thead>
						<tbody>
							<c:forEach items="${listGame.getContent()}" var="lg">
								<tr>
									<td>${lg.name}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${lg.createdDate}" /></td>
									<td><fmt:formatNumber type="number" pattern="###,### VNĐ"
											value="${lg.price}" /></td>
									<td>${lg.type}</td>
									<td>${lg.publisher}</td>
									<td>${lg.configuration}</td>
									<td><a class="btn" href="/game/edit?id=${lg.id}"><i
											class="fa-solid fa-pencil"></i></a></td>
									<td><a class="btn" href="/game/delete/${lg.id}"><i
											class="fa-solid fa-trash"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				 <div class="card-footer">
					<div class="d-flex justify-content-center">
						<a class="btn btn-primary me-1" href="/game/index?PageNumber=0"
							${listGame.getNumber()==0?"hidden":"" }> <span
							class="fas fa-backward"></span>
						</a> <a class="btn btn-primary me-1" 
							${listGame.getNumber()==0?"hidden":"" }
							href="/game/index?PageNumber=${listGame.getNumber() - 1 }"> <span
							class="fas fa-backward-step"></span>
						</a>
						<h3>${listGame.getNumber() + 1 }</h3>
						<a class="btn btn-primary me-1"
							href="/game/index?PageNumber=${listGame.getNumber() + 1 }"
							${listGame.getNumber()==listGame.getTotalPages() - 1?"hidden":"" }>
							<span class="fas fa-forward-step"></span>
						</a> <a class="btn btn-primary"
							href="/game/index?PageNumber=${listGame.getTotalPages() -1 }"
							${listGame.getNumber()==listGame.getTotalPages() - 1?"hidden":"" }>
							<span class="fas fa-forward"></span>
						</a>
					</div>
				</div> 
			</div>
		</form>
	</div>


	<!-- script -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>