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
	        	String email = request.getParameter("eml_fp");
	           	String password = request.getParameter("fp_pwd");
	           	String cpassword = request.getParameter("fp_cpwd");
	
	            if(email != null && password != null && cpassword != null) {
	           	   if(UserDAO.updatePassword(email, password, cpassword)) {
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
