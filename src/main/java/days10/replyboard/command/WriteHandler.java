package days10.replyboard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days10.replyboard.domain.ReplyBoardDTO;
import days10.replyboard.service.WriteService;

public class WriteHandler implements CommandHandler{

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      String method = request.getMethod(); // GET, POST
      if (method.equals("GET")) {
         // 2. 포워딩. 
         return "/days10/replyboard/write.jsp";
      } else { // POST
         
         String writer = request.getParameter("writer");
         String email = request.getParameter("email");
         String subject = request.getParameter("subject");
         String content = request.getParameter("content");
         String pass = request.getParameter("pass");         

         ReplyBoardDTO dto = new ReplyBoardDTO();
            dto.setWriter(writer);
            dto.setEmail(email);
            dto.setSubject(subject);
            dto.setContent(content);
            dto.setPass(pass);  
         // PC ip 주소
         dto.setIp(   request.getRemoteAddr()  );
         
         // 새글 ,  답글
         // 새글           write.do
         // 답글일 경우    write.do?num=2&ref=2&step=1&depth=0 ( 부모글 정보)
          String parentNum = request.getParameter("num");
          if (parentNum == null) { // 새글
             dto.setStep(1);
            dto.setDepth(0);
         } else { // 답글
            // ref, step, depth
            int parentRef = Integer.parseInt( request.getParameter("ref") );  // 부모 그룹
            int parentStep = Integer.parseInt( request.getParameter("step") ); // 부모 그룹순서
            int parentDepth = Integer.parseInt( request.getParameter("depth") ); // 부모 깊이
            
            dto.setRef(parentRef);
            dto.setStep(parentStep + 1);
            dto.setDepth(parentDepth + 1); 
         }
          
          WriteService writeService = WriteService.getInstance();
          int rowCount = writeService.write(dto);
          if (rowCount == 1) {
            String location = "list.do";
            response.sendRedirect(location); 
         }
         
      } // if
      
      return null;
   }

}