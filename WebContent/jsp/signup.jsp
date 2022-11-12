<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>

<!DOCTYPE html>
<html>
    <body>
        <%
        	if(request.getParameterNames().hasMoreElements()) {
	        	String name = request.getParameter("uname");   
	           	String email = request.getParameter("ueml");
	           	String pass = request.getParameter("sup_upwd");
	           	Long mob = Long.parseLong(request.getParameter("umob"));
	           	String address = request.getParameter("uadd");
	           	String state = request.getParameter("state");
	           	String dist = request.getParameter("dist");
	           	
	           	User user = new User();
	           	user.setName(name);
	           	user.setEmail(email);
	           	user.setPass(pass);
	           	user.setMobile(mob);
	           	user.setAddress(address);
	           	user.setState(state);
	           	user.setDistrict(dist);
	           	user.setType("U");
	           	
	            if(UserDAO.newUser(user) == true) {
	            	out.print("<script> document.alert('Account Created Successfully...') </script>");
	       			response.sendRedirect("../index.jsp");
	            }
	            else {
		           	out.print("<script> document.alert('Please try again...') </script>");
		           	response.sendRedirect("./formPage.jsp");
	            }
        	}
        	else {
        		response.sendRedirect("./formPage.jsp");
        	}
        %>
    </body>
</html>
