<%@page import="bean.BasketDAO"%>
<%@page import="java.util.List"%>
<%@page import="bean.BarlyDAO"%>
<%@page import="bean.BasketVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="vo2" class="bean.BasketVO" />
<jsp:setProperty name="vo2" property="*" />
<%
	BasketVO vo = null;
	BasketDAO dao = new BasketDAO();
	String sessionId = (String) session.getAttribute("sessionId");
	List<BasketVO> list = dao.all(sessionId);
	boolean result = true;
	if (vo2.getProductid() != null) {
	result = dao.create(vo2);
}
%><%=result%>
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
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<!-- Template Main CSS File -->
<link href="assets/css/basket.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: BizLand - v1.1.0
  * Template URL: https://bootstrapmade.com/bizland-bootstrap-business-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<script type="text/javascript" src="assets/js/jquery-3.5.1.js"></script>
<script type="text/javascript">

$(function(){
$("#allcheck").click(function(){
	console.log('클림됨.!!!!!!!!!!!!!!!!!!!!!!!!')
	//만약 전체 선택 체크박스가 체크된상태일경우
	if($("#allcheck").is(":checked")) {
		//해당화면에 전체 checkbox들을 체크해준다 
		 $("input[type=checkbox]").prop("checked", true);
    } else {
        $("input[type=checkbox]").prop("checked", false);
    } 
	})
})
	/* $('.select').on('change', function(){
		console.log('111111111111111111111')
		selectValue = this.value
		idValue = $(this).attr('id')
		console.log(selectValue + ", " + idValue)
		spanId = '#span'+ idValue
		console.log('spanId>> ' + spanId)
		
		
		var fmt =$(spanId).html()
		console.log('------------' + fmt)
		var sub1 = fmt.substring(11,12)//스트링추출
		var sub2 = fmt.substring(13,16)//스트링추출
		var sub = sub1+ sub2 
		
		var arrModel = sub.split(",");// split
		console.log(arrModel[0])
		
		var price = parseInt(arrModel[0])
		console.log(price)
		var amount = price*selectValue
		console.log(amount)
		$(spanId).text(amount+'원')
	}) */
	
	
	


function order(){
	alert('주문완료')
}




</script>
</head>

<body style="height: auto;">

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

	<div id="main" style="height: auto; overflow: hidden;">
		<%-- <c:out value="test"></c:out> --%>
		<div class="main_frame" style="height: auto; overflow: hidden;">
			<h3 class="aaaa" style="font-size: 40px;">장바구니</h3>
			<br>
			<p style="text-align: center; color: #999999; font-size: 16px">주문하실
				상품명 및 수량을 정확하게 확인해 주세요.</p>
			<br>

			<div class="viewCart"
				style="width: 1050px; height: auto; overflow: hidden;">
				<div class="tbl_comm"
					style="width: 1050px; height: auto; overflow: hidden;">
					<table class="tbl_comm tbl_header"
						style="width: 1050px; height: 62px;">
						<colgroup>
							<col style="width: 375px;">
							<col style="width: 380px;">
							<col style="width: 115px;">
							<col style="width: 110px;">
							<col style="width: auto;">
						</colgroup>
						<thead>
							<tr style="padding: 15px; width: 1050px; height: 61px;">
								<th id="thSelect" style="padding: 0px 0px 0px 20px;">
									<!-- <label
									class="label_check"> --> <input type="checkbox"
									class="ico_check" id="allcheck"> <!-- </label> --> <span
									class="tit"> 전체선택 <span class="num_count"></span><span
										class="num_total"></span>
								</span>
								</th>
								<th id="thInfo">상품 정보</th>
								<th id="thCount">수량</th>
								<th id="thCost">상품금액</th>
							</tr>
						</thead>
					</table>
					<div class="view_goods" style="height: auto; overflow: hidden;">
						<!---->
						<%
							int totalPrice = 0;
						
							for (int i = 0; i < list.size(); i++) {
							vo = list.get(i);

							totalPrice += vo.getPrice();
						%>
						<table class="tbl_goods goods"
							style="width: 1048px; height: 219px; border-top: 1px solid black;">
							<c:set var="price" value="<%=vo.getPrice()%>" />
							<c:set var="price1" value="3000" />
							<c:set var="price2" value="<%=totalPrice + 3000%>" />
							<c:set var="price3" value="<%=totalPrice%>" />

							<colgroup>
								<col style="width: 76px;">
								<col style="width: 100px;">
								<col style="width: 488px;">
								<col style="width: 112px;">
								<col style="width: 86px;">
								<col style="width: 110px;">
								<col style="width: auto;">
							</colgroup>

							<tbody>
								<tr>
									<td style="padding: 20px 0px 20px 0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" class="checkbox"></input>
									</td>
									<!-- 선택 체크박스 -->
									<td style="padding: 20px 0px"><img src="<%=vo.getImg()%>"
										style="width: 60px; height: 77px"></td>
									<td style="padding: 20px 0px 18px"><%=vo.getTitle()%><hr><%=vo.getContent()%></td>
									<!-- <td style="padding : 20px 0px">d</td> -->
									<td style="padding: 20px 0px; padding-left: 10px;">
									<select	class="select" id="<%= i %>">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
									</select></td>
									<td style="padding: 20px 0px"><span class="amount" id="span<%=i %>">
									<fmt:formatNumber	type="number" maxFractionDigits="3" value="${price}" var="commaPrice" /> ${commaPrice} 원  
									
									</span></td>

									<%-- <td style="padding : 20px 0px 20px 41px;"><%=vo.getPrice()%></td> --%>
								</tr>
							</tbody>
						</table>
						<%
							}
						%>
						

					</div>
				</div>
				<!--1050 280  -->
				<div class="all_select"
					style="width: 1050px; height: 152px; border: 0px solid black;">
					<div class="all_select select_option"
						style="padding: 30px 0px 80px 20px; border-top: 0px solid black;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn_delete">선택 삭제</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="deleteBasket.jsp">
						 <button type="button" class="btn_delete1" onclick="deleteBasket">장바구니
							전체 비우기</button>
						</a>
					</div>
				</div>
				<!--1050 152  -->
				<div class="car_result"
					style="width: 1050px; height: 273px; border: 0px solid black;">
					<div class="car_amount.cell_except"
						style="width: 1050px; height: 165px; float: left;">
						<!-- 결제 금액 기입.  -->
						<div id="amount1"
							style="width: 165px; height: 165px; border: 1px solid black; margin-left: 110px; float: left; text-align: center">
							<br>
							<br>물건 금액<br>
							<fmt:formatNumber type="number" maxFractionDigits="3"
								value="${price3}" var="commaPrice" />
							${commaPrice} 원
						</div>
						<div id="plus"
							style="width: 165px; height: 165px; float: left; text-align: center">
							<br>
							<br>
							<br>+<br>

						</div>
						<div id="amount1"
							style="width: 165px; height: 165px; border: 1px solid black; float: left; text-align: center">
							<br>
							<br>배송비<br>
							<fmt:formatNumber type="number" maxFractionDigits="3"
								value="${price1}" var="commaPrice" />
							${commaPrice} 원
						</div>
						<div id="equals"
							style="width: 165px; height: 165px; float: left; text-align: center">
							<br>
							<br>
							<br>=<br>


						</div>
						<div id="amount1"
							style="width: 165px; height: 165px; border: 1px solid black; float: left; text-align: center;">
							<br>
							<br>결제 금액<br>
							<fmt:formatNumber type="number" maxFractionDigits="3"
								value="${price2}" var="commaPrice" />
							${commaPrice} 원
						</div>

					</div>
					<div class="notice_cart" style="width: 1050px; height: 60px;"></div>
					<div style="width: 1050px; height: 28px; text-align: center;">

						<a href="deleteBasket.jsp">
						<button type="button" id="btnOrder" class="btn_submit"style="width: 200px; height: 48px; margin-top: 10px;"onclick="order()">
							주문하기 
						</button></a>
					</div>
				</div>
				<!--1050 273  -->
				<!-- 28 -->
			</div>
		</div>
	</div>


	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">




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
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>