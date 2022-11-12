<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.CartDAO"%>
<%@page import="dao.ProductDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
        	if(request.getParameterNames().hasMoreElements()) {
				String name = (String)session.getAttribute("name");
				if(name == null) {
		      		response.sendRedirect("./formPage.jsp");
				}
				else {
		        	long productId = Long.parseLong(request.getParameter("id"));
		        	String email = (String)session.getAttribute("email"); 
		        	if(CartDAO.addToCart(productId, email) == false) {
	    %>
	    <script type="text/javascript">
	    	alert('something went wrong, please try again...');
	    	window.history.go(-1);
	    </script>
	    <%
		        	}
		        	else {
	    %>
	    <script type="text/javascript">
	    	alert('Item added to cart.')
	    	window.history.go(-1);
	    </script>
	    <%
					}
				}
			}
        	else {
        		response.sendRedirect("../index.jsp");
        	}
        %>
    </body>
</html>
