<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Cnoober Shop</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/assets/img/controller.svg" rel="icon">
<link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/assets/css/style.css" rel="stylesheet">

</head>

<body>
<c:if test="${!empty sessionScope.error }">
	<div class="alert alert-danger">${sessionScope.error }</div>
	<c:remove var="error" scope="session"></c:remove>
</c:if>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top d-flex align-items-cente">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

			<h1 class="logo me-auto me-lg-0">
				<a href="/game">Cnoober Shop</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="/assets/img/logo.png" alt="" class="img-fluid"></a>-->

			<nav id="navbar" class="navbar order-last order-lg-0">
				<ul>
					<li><a class="nav-link scrollto active" href="/game">Home</a></li>
					<li><a class="nav-link scrollto" href="#menu">Menu</a></li>
					<li class="dropdown"><a href="#"><span>Manager</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="/game/mygame">My Game</a></li>
							<li class="dropdown"><a href=""><span>Manager</span> <i
									class="bi bi-chevron-right"></i></a>
								<ul>
									<li><a href="/game/add">Create new game</a></li>
									<li><a href="/game/index">List game</a></li>
									<li><a href="#">Create new user</a></li>
									<li><a href="#">List user</a></li>
								</ul></li>
							<li><a href="#">Forgot password</a></li>
							<li><a href="#">Register</a></li>
							<li><a href="#">Login</a></li>
						</ul></li>
					<li><a class="nav-link scrollto" href="/login">Login</a></li>
					<li><a class="nav-link scrollto" href="/signin">Sign In</a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
			<a href="/cart/index">
				<i class="bi bi-cart"></i></a>

		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">
		<div class="container position-relative text-center text-lg-start"
			data-aos="zoom-in" data-aos-delay="100">
			<div class="row">
				<div class="col-lg-8">
					<h1>
						Welcome to <span>Cnoober Shop!</span>
					</h1>
					<h2>Cnoober Shop được sinh ra với mong muốn mang cung cấp cho game thủ Việt Nam những game bản quyền chất lượng nhất trên thế giới với một phương thức thanh toán đơn giản nhất, giá tốt nhất cùng với đó là dịch vụ chăm sóc khách hàng tuyệt vời.</h2>

					<div class="btns">
						<a href="#menu" class="btn-menu animated fadeInUp scrollto">Menu
							Game</a>
					</div>
				</div>
				<div
					class="col-lg-4 d-flex align-items-center justify-content-center position-relative"
					data-aos="zoom-in" data-aos-delay="200">
					<a href="https://www.youtube.com/channel/UCzHz-0eynZ6u070JIf1z-oQ"
						class="glightbox play-btn"></a>
				</div>

			</div>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main">
		<!-- ======= Chefs Section ======= -->
		<section id="menu" class="chefs">
			<div class="container" data-aos="fade-up">

				<jsp:include page="${view}"></jsp:include>
			</div>
		</section>
		<!-- End Chefs Section -->

		<!-- ======= Contact Section ======= -->
		
		<!-- End Contact Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6">
						<div class="footer-info">
							<h3>Cnoober Shop</h3>
							<p>
								<strong>Phone:</strong>
								0343630598<br> <strong>Email:</strong>
								tuananhgobom@gmail.com<br>
							</p>
							<div class="social-links mt-3">
								<a href="https://www.facebook.com/tuananh532002/" class="facebook"><i class="bx bxl-facebook"></i></a> <a
									href="https://www.instagram.com/cnoober/" class="instagram"><i class="bx bxl-instagram"></i></a>
								<a href="https://www.youtube.com/channel/UCzHz-0eynZ6u070JIf1z-oQ" class="youtube"><i class="bi bi-youtube"></i></a>	
								
							</div>
						</div>
					</div>

					<div class="col-lg-2 col-md-6 footer-links">
						<h4>Thông Tin</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="/game">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="https://www.youtube.com/channel/UCzHz-0eynZ6u070JIf1z-oQ">Youtube</a></li>
						</ul>
					</div>			
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="/assets/vendor/aos/aos.js"></script>
	<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/assets/js/main.js"></script>

</body>

</html>