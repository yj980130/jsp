package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
// @WebFilter({ "/LoginCheckFilter", "/days07/admin/*", "/days07/board/write.jsp" })
public class LoginCheckFilter implements Filter {


    public LoginCheckFilter() {
        // TODO Auto-generated constructor stub
    }


	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		System.out.println("> LoginCheckFilter.doFilter()");
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String auth = null;	// 인증 ID
		boolean isAuth = false;
		
		// req.getSession() == req.getSession(true);
		HttpSession session = req.getSession(false);
		if(session != null && (auth = (String)session.getAttribute("auth")) != null) {
			isAuth = true; // 인증
			
		}
		if(isAuth) { // 인증 O
			// if admin 폴더 안의 요청 auth="admin" (할일)
				
			chain.doFilter(request, response);
		}
		else { // 인증 X

			String referer = req.getRequestURI();
			System.out.println("> 가고자한 URL : " + referer);
			session.setAttribute("referer", referer);
			
			String location = "/jspPro/days07/member/logon.jsp";	// 메인페이지
			res.sendRedirect(location);
		}
		
	}


	public void init(FilterConfig fConfig) throws ServletException {

	}

}
