package days06.mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days06.mvc.command.CommandHandler;

// @WebServlet("/DispatcherServlet")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DispatcherServlet() {
        super();
        
    }
    
    //		/board/list.do new ListHandler()
    public Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
    
    @Override
	public void init(ServletConfig config) throws ServletException {
    	super.init(config);
    	// System.out.println("> DispatcherServlet.init()...");
    	// web.xml <servlet><init-param><param-name>path</servlet>
    	String path = this.getInitParameter("path");
    	String realPath = this.getServletContext().getRealPath(path);
    	// C:\E\Class\Workspace\JSPClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro\WEB-INF\commandHandler.properties
    	// System.out.println(realPath);
    	
    	Properties prop = new Properties();
    	try (FileReader reader = new FileReader(realPath);){
			prop.load(reader);
		} catch (Exception e) {
			throw new ServletException();
		}
    	
    	// .properties -load() ->  prop<key, value>	  -> 	Map<url, 실제객체>
    	Set<Entry<Object, Object>> set = prop.entrySet();
    	Iterator<Entry<Object, Object>> ir = set.iterator();
    	while (ir.hasNext()) {
			Entry<Object, Object> entry = ir.next();
			String url = (String) entry.getKey();	// Map<key>
			String className = (String) entry.getValue();
			
			Class<?> commandHandlerClass = null;
			
			try {
				commandHandlerClass = Class.forName(className);
				try {
					CommandHandler handler = (CommandHandler) commandHandlerClass.newInstance();
					this.commandHandlerMap.put(url, handler);	// 맵 추가
				} catch (InstantiationException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}
    	
    	
	}
    
	@Override
	public void destroy() {
		super.destroy();
		// System.out.println("> DispatcherServlet.destroy()...");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// request.getRequestURI();
		// String requestURL = request.getRequestURL().toString();
		// System.out.println(requestURL);	// http://localhost/jspPro/*.do
		
		String requestURI = request.getRequestURI().toString();
		// System.out.println(requestURI);	// /jspPro/*.do
		
		// "/jspPro"
		// 7
		int beginIndex = request.getContextPath().length();
		requestURI = requestURI.substring(beginIndex);
		// System.out.println(requestURI); // /*.do
		
		CommandHandler handler = this.commandHandlerMap.get(requestURI);
		
		String view = null; // M[V]C
		try {
			view = handler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 리다이렉트 또는 포워딩
		if(view != null) {
			// 포워딩 
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
