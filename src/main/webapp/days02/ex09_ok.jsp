<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String location = "";
	
	// DB 인증처리
	if(id.equals("admin") && passwd.equals("1234")){
		location = "ex09_main.jsp";
		// 인증된 정보 저장 - DB, 쿠키, 세션
	}
	else if(id.equals("hong") && passwd.equals("1234")){
		location = "ex09_main.jsp";
		// 인증된 정보 저장
	}
	else{
		location = "ex09.jsp?error";	
	}
	
	// [1] 리다이렉트 
	// response.sendRedirect(location);
	
	// [2] 포워딩
	// Dispatcher 발송담당자, 급파하는 사람.
	String path = location;
	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
	dispatcher.forward(request, response);
%>