<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="bean.BbsDAO"%>
<%@page import="bean.Bbs"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<title>Market Barly</title>

<style type="text/css">
body {
   background-color: #DADADA;
   padding-top: 300px;
   padding-bottom: 300px;
}
.column {
   width: 1000px;
   margin-left: 500px;
}

body>.grid {
   height: 100%;
}

.image {
   margin-top: -100px;
}

.column {
   max-width: 1000px;
}

.view_btn {
   cursor: pointer;
}

.paging {
   display: inline-block;
   margin: 0 auto;
   margin-left: 200px;
}
</style>

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
<!--   <link href="assets/vendor/venobox/venobox.css" rel="stylesheet"> ------------------------------------------------------------무언가가 작동안하면 주석을 풀어야함---------->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: BizLand - v1.1.0
  * Template URL: https://bootstrapmade.com/bizland-bootstrap-business-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
   <!-- 버튼을 위한 css link  -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
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
   <jsp:include page="header.jsp"></jsp:include>

   <%
   	int bbsID = 1;
                  if (request.getParameter("bbsID") != null) {
                  bbsID = Integer.parseInt(request.getParameter("bbsID"));
                  }
                  BbsDAO dao = new BbsDAO();
                  Bbs bbs = dao.getBbs(bbsID);
   %>

   <!-- <table border="1">
         <tr id="firstRow" onclick="javascript:clickTrEvent(this)"
            onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')"
            style="cursor:hand">
            <td>first row - 1</td>
            <td>first row - 2</td>
         </tr>
         <tr id="secondRow" onclick="javascript:clickTrEvent(this)"
            onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')"
            style="cursor:hand">
            <td>second row - 1</td>
            <td>second row - 2</td>
         </tr>
         <tr id="thirdRow" onclick="javascript:clickTrEvent(this)"
            onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')"
            style="cursor:hand">
            <td>third row - 1</td>
            <td>third row - 2</td>
         </tr>
      </table> -->




   <div class="ui middle aligned center aligned grid">
      <div class="column">
         <h2 class="ui teal image header">게시판 글보기</h2>
         <div class="container">
            <div class="rows">
               <!-- <a href="/coco/write_bbs"><button class="ui fluid large teal submit button">게시글 작성하기</button></a> -->
               <table class="table table-striped" style = "border: 2px solid #dddddd;" >
               
                  <thead>
                     <tr>
                        <%-- <th style="width: 10px; background-color: #DADADA; text-align: center;">NO</th>
                        <th style="width: 10px;"><%= bbs.getBbsID() %></th> --%>
                        <!--read메소드dao만들어서 뿌리기  -->
                        <th style="width: 30px; background-color: #DADADA; text-align: center;">제목</th>
                        <th style="width: 250px;"><%= bbs.getBbsTitle() %></th>
                     </tr>
                  </thead>
               <tbody>
                     
                     <tr>
                        <td style="width: 30px; background-color: #DADADA; text-align: center; line-height : 300px;"><%= bbs.getBbsID() %></td>
                        <td class ="content" style ="width : 300px;  background-color : #ffffff;  line-height : 300px;"><%= bbs.getBbsContent() %></td>
                     </tr>
                  </tbody>
               </table>

               <button>
                  <a href="boardform.jsp">목록돌아가기</a>
               </button>


            </div>

         </div>
      </div>
   </div>

   <jsp:include page="footer.jsp"></jsp:include>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="assets/vendor/counterup/counterup.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<!--   <script src="assets/vendor/venobox/venobox.min.js"></script> ----------------------------------------------------------------무언가가 작동안하면 주석을 풀어야함-------------->
  <script src="assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  
<!-- 배송지역검색 외부 api 신규 버전 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 유효성 검사를 위한 제이쿼리  -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

  <!-- 주소 검색 및 팝업 js -->
<script src="member/js/popUp.js"></script>

  <!-- null 검사를 및 주소 검색 js -->
<script src="member/js/nullCheck.js"></script>

<!-- ajax를 위한 제이쿼리  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 체크박스 js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>



</body>

</html>