package days06;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import days05.MemberInfo;

@WebServlet("/days06/session.htm")
public class SesseionTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SesseionTest() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// [서블릿.doGet() 세션을 사용...]
		// (1)
		// request.getSession(); - 세션이 존재하면 존재하는 세션객체를 반환하고
		//								  존재하지 않으면 세션객체를 생성해서 반환
		// == request.getSession(true);
		
		// request.getSession(false); - 세션이 존재하면 존재하는 세션객체를 반환하고
		//									   존재하지 않으면 null을 반환
		
		/*
		HttpSession session = request.getSession();
		if(session == null) {
			// 
		}
		불가능 */
		
		
		/*
		HttpSession session = request.getSession(false);
		if(session == null) {
			// 
		}
		가능
		*/
		
		// [가정] 로그인 인증 회원 정보를 세션 저장
		MemberInfo member = new MemberInfo();
		member.setId("admin");
		member.setName("홍길동");
		member.setPasswd("1234");
		member.setEmail("admin@naver.com");
		member.setRegisterDate(new Date());
		
		HttpSession session = request.getSession();
		session.setAttribute("auth", member);
		
		MemberInfo authMember = (MemberInfo) session.getAttribute("auth");
		if(authMember != null) {	// 로그인 했다면
			String longonID = authMember.getId();
			// 다른 정보를 얻어와서 사용..
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
