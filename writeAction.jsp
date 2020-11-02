<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bean.BbsDAO"%>
<%@page import="java.io.PrintWriter"%>
<jsp:useBean id="bbs" class="bean.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type" content="text./html; charset utf-8">
</head>
<body>
	<%
		/* String id_user = null;
		if (session.getAttribute("id_user") != null) {
			id_user = (String) session.getAttribute("id_user");
		}
		if (id_user == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else { //로그인시 */
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) { //title 또는 Content 둘중 하나라도 null
		PrintWriter script = response.getWriter(); //response객체.getWriter메서드
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else { //title 와 Content 둘다 not null이다
			}
		BbsDAO bbsDAO = new BbsDAO(); //db처리 [ 객체 가져온다 ]
		int result = bbsDAO.write(bbs.getBbsTitle(),  bbs.getBbsContent());
		if (result == -1) {  /* if (result == -1) dao의 int 반환값확인요함 */ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'boardform.jsp'");
			script.println("</script>");
		}
	%>
</body>

</html>