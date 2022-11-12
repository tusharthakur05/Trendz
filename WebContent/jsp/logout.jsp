<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>

<!DOCTYPE html>
<html>
    <body>
        <%     
        	if(session.getAttribute("name") != null) {
        		session.setAttribute("name", null);
        		session.setAttribute("email", null);
        		session.setAttribute("address", null);
        		session.setAttribute("mobile", 0);
        	}
        	response.sendRedirect("../index.jsp");
        %>
    </body>
</html>
