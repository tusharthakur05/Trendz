<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
        	if(request.getParameterNames().hasMoreElements()) {
	        	String email = request.getParameter("eml");
	           	String password = request.getParameter("sin_upwd");
	
	            if(email != null && password != null) {
	            	User user = UserDAO.getUserDetails(email, password);
	                if(user != null) {
	               		session.setAttribute("name", user.getName());
	                   	session.setAttribute("email", email);
	                   	session.setAttribute("address", user.getAddress());
	                   	session.setAttribute("mobile", user.getMobile());
	                   	session.setAttribute("type", user.getType());
	        		   	response.sendRedirect("../index.jsp");
	                }   
	                else {
	                	response.sendRedirect("./formPage.jsp");	           
	                }
	            }  
	            else {
	            	response.sendRedirect("./formPage.jsp");
	            }
        	}
        	else {
        		response.sendRedirect("./formPage.jsp");
        	}
        %>
        
    </body>
</html>
