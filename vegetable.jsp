<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="bean.BasketDAO"%>
<%@page import="bean.BasketVO"%>
<%@page import="java.util.List"%>
<%@page import="bean.BarlyDAO"%>
<%@page import="bean.BarlyVO2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BarlyDAO dao = new BarlyDAO();
	List<BarlyVO2> list = dao.all2("veg");
	BarlyVO2 vo = null;
	
	SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월dd일 HH시mm분ss초");
			
	Date time = new Date();
			
	String time1 = format1.format(time);
			
	System.out.println(time1);
%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Market Barly</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<!-- <link href="assets/vendor/venobox/venobox.css" rel="stylesheet"> -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/vegetableCSS.css" rel="stylesheet">
<%
	String sessionId = (String) session.getAttribute("sessionId");
	System.out.println(sessionId);
%>
<script type="text/javascript" src="assets/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function() {
	$('button').click(function() {
		idValue = $(this).attr('id')
		console.log("id>> " +  idValue)
		console.log('<%=sessionId%>')
		console.log('productidValue>> ' + $('#productid' + idValue).val())
	    if('<%=sessionId%>' == 'null'){
		   alert('로그인후 이용해주세요.')
	   }else{
			$.ajax({
				url: "basket.jsp",
				data :{
					title:  $('#title' + idValue).val(),
					content: $('#content' + idValue).val(),
					price: $('#price' + idValue).val(),
					img: $('#img' + idValue).attr('src'),
					userid: '<%=sessionId%>',
					productid: $('#productid' + idValue).val() 
				}, 
				error : function(){
			        alert('이미 장바구니에 담겨있습니다.'); // 실패 시 처리
			       },

				success: function() {
					alert('장바구니에 담겼습니다.')
				}
			})
	   } 
	})
	
})//function
		
		
		
	
</script>
<!-- =======================================================
  * Template Name: BizLand - v1.1.0
  * Template URL: https://bootstrapmade.com/bizland-bootstrap-business-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>


<body>

<header>
  <%if(session.getAttribute("sessionId") == null){ %>
  <!-- ======= Top Bar ======= -->
  <div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <!-- <i class="icofont-envelope"></i> <a href="mailto:contact@example.com">contact@example.com</a>
        <i class="icofont-phone"></i> +1 5589 55488 55-->
      </div> 
      
      <div class="social-links">
         
         <a href="member/userControl/signUp.jsp">회원가입</a>
         <a href="member/loginAndOut/login.jsp">로그인</a>
         <a href="boardform.jsp">공지사항</a>
         <!-- <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
         <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
         <a href="#" class="skype"><i class="icofont-skype"></i></a>
         <a href="#" class="linkedin"><i class="icofont-linkedin"></i></i></a> -->
      </div>
    </div>
  </div>
<%}else if(session.getAttribute("sessionId") != null){ %>
<div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <!-- <i class="icofont-envelope"></i> <a href="mailto:contact@example.com">contact@example.com</a>
        <i class="icofont-phone"></i> +1 5589 55488 55-->
      </div> 
      
      <div class="social-links">
         
         <a href="member/userControl/userUpdate.jsp"><%=session.getAttribute("sessionId") %>님을 환영합니다.</a>
         <a href="boardform.jsp">공지사항</a>
         <a href="member/loginAndOut/logout.jsp">로그아웃 </a>
         <!-- <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
         <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
         <a href="#" class="skype"><i class="icofont-skype"></i></a>
         <a href="#" class="linkedin"><i class="icofont-linkedin"></i></i></a> -->
      </div>
    </div>
  </div>
<%}else%>

<!-- 카카오 id로 로그인 하면 보여지는 버튼들 -->
<%if(session.getAttribute("kakao_sessionToken") != null){ %>
<div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <!-- <i class="icofont-envelope"></i> <a href="mailto:contact@example.com">contact@example.com</a>
        <i class="icofont-phone"></i> +1 5589 55488 55-->
      </div> 
      
      <div class="social-links">
         
         <a href="member/userControl/signUp.jsp">카카오로 로그인하여 사용하시는 이용자는 '회원가입'을 해야합니다.</a>
         <a href="boardform.jsp">공지사항</a>
         <a href="member/loginAndOut/kakaoLogout.jsp">로그아웃 </a>
         <!-- <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
         <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
         <a href="#" class="skype"><i class="icofont-skype"></i></a>
         <a href="#" class="linkedin"><i class="icofont-linkedin"></i></i></a> -->
      </div>
    </div>
  </div>
<%}else if(session.getAttribute("kakao_sessionId") != null){ %>
<div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <!-- <i class="icofont-envelope"></i> <a href="mailto:contact@example.com">contact@example.com</a>
        <i class="icofont-phone"></i> +1 5589 55488 55-->
      </div> 
      
      <div class="social-links">
         
         <a href="boardform.jsp">공지사항</a>
         <!-- <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
         <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
         <a href="#" class="skype"><i class="icofont-skype"></i></a>
         <a href="#" class="linkedin"><i class="icofont-linkedin"></i></i></a> -->
      </div>
    </div>
  </div>
<%}else%>
  </header>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
		<div class="container d-flex align-items-center">

			<h1 class="logo mr-auto">
				<a href="index.jsp">Market Barly<span>.</span></a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt=""></a>-->

			<nav class="nav-menu d-none d-lg-block">
				<ul>

					<li class="drop-down"><a href="">전체 카테고리</a>
						<ul>
							<li><a href="vegetable.jsp">채소 과일(견과류, 쌀)</a></li>
							<!--
                <li class="drop-down"><a href="#">Deep Drop Down</a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              -->
							<li><a href="fish.jsp">수산물</a></li>
							<li><a href="meat.jsp">정육</a></li>
							<li><a href="seasoning.jsp">양념</a></li>
						</ul></li>

					<li class="active"><a href="index.html">Home</a></li>
					<li><a href="newproduct.jsp">신상품</a></li>
					<li><a href="shopping.jsp">알뜰쇼핑</a></li>
					<li><a href="basket.jsp">장바구니</a></li>
					<li class="search"><input type="text"
						placeholder="상품명을 입력해주세요."></li>
					<li><div class="button">
							<input type="button" value="검색">
						</div>
					<li>
						<!-- <li><a href="#contact">Contact</a></li>  -->
				</ul>
			</nav>
			<!-- .nav-menu -->

		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Portfolio Details Section ======= -->
	<section class="portfolio-details"></section>
	<!-- End Portfolio Details Section -->
	<!-- ======= Hero Section ======= -->
	<!-- <section id="hero" class="d-flex align-items-center">
    <div class="container" data-aos="zoom-out" data-aos-delay="100">
      <h1>Welcome to <span>Market Barly</spa>
      </h1>
      <h2>We are team of talanted designers making websites with Bootstrap</h2>
      <div class="d-flex">
        <a href="#about" class="btn-get-started scrollto">Get Started</a>
        <a href="https://www.youtube.com/watch?v=jDDaplaOz7Q" class="venobox btn-watch-video" data-vbtype="video" data-autoplay="true"> Watch Video <i class="icofont-play-alt-2"></i></a>
      </div>
    </div>
  </section><!-- End Hero -->

	<div id="main" style="height:auto;overflow:hidden;">
		<div class="main_frame" style="height:auto;overflow:hidden;">
			<div class="ico_cate">
				<h3>채소 과일(견과류,쌀)</h3>
			</div>
			<div class="dlist_goos">
				<ul class="list">
					<%
					for (int i = 0; i < list.size(); i++) {
						vo = list.get(i);
					%>
					<c:set var="price" value="<%=vo.getPrice()%>" />

					<li><div class="item">
							<div class="thumb" style="position: relative;">
								<img src="<%=vo.getImg()%>" alt="My Image" id="img<%=i%>">
								<div class="group_btn"
									style="position: relative; right: -240px; top: -70px;">
									
									<button id="<%=i%>">
										<img src="assets/img/basket.png" alt="basket">
									</button>
									<input type="hidden" value="<%=vo.getTitle()%>" id="title<%=i%>"> 
									<input type="hidden" value="<%=vo.getContent()%>" id="content<%=i%>">
									<input type="hidden" value="<%=vo.getPrice()%>" id="price<%=i%>"> 
									<input type="hidden" value="<%=vo.getProductid()%>"	id="productid<%=i%>"> 
								</div>
							</div>

							<a class="info" href="#"><br><span class="name"><%=vo.getTitle()%></span><br>
								<br> <span class="cost">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"
										var="commaPrice" /> ${commaPrice} 원 </span><br> <br>
										 <span	class="desc"><%=vo.getContent()%></span><br> <br> </a>
						</div></li>
					<%
						}
					%>
				</ul>
			</div>
			<div></div>
			<div></div>
		</div>

	</div>


	<!-- ======= Portfolio Section ======= -->
	<section id="portfolio" class="portfolio"></section>
	<!-- End Portfolio Section -->

	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">

		<!-- <div class="footer-newsletter">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6">
            <h4>Join Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>
          </div>
        </div>
      </div>
    </div>-->



		<div class="container py-4">
			<div class="copyright">
				&copy; Copyright <strong><span>Market Barly</span></strong>. All
				Rights Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/bizland-bootstrap-business-template/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<div id="preloader"></div>
	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/jquery/jquery.min.js">
		
	</script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/vendor/counterup/counterup.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<!-- <script src="assets/vendor/venobox/venobox.min.js"></script> -->
	<script src="assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>


</body>

</html>