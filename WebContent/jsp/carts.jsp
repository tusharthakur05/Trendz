<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="dao.CategoryDAO" %>
<%@page import="dao.ProductDAO" %>
<%@page import="dao.CartDAO" %>
<%@page import="model.Product" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Shop for electronics, apparels &amp; more using our Trendz app Free shipping &amp; COD.">
        <title>
          Trendz : A Online Shopping Site for Mobiles, Electronics, Furniture, Grocery, Lifestyle, Books &amp; More. Best Offers!
        </title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
        <link href="../css/style.css" rel="stylesheet" type="text/css">
       	<link href="../css/productPage.css" rel="stylesheet" type="text/css">
        <link rel="apple-touch-icon" sizes="180x180" href="../logos/favicon_io/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../logos/favicon_io/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../logos/favicon_io/favicon-16x16.png">
        <link rel="manifest" href="../logos/favicon_io/site.webmanifest">
        <script src="../js/MyScript.js" type="text/javascript"></script>
        <style>
        	.card-box {
        		width: 100%;
    			height: auto;
			    margin-bottom: 0.2rem;
			    background-color: blanchedalmond;
			    display: block;
        	}
        	.card-box::after {
        		content: "";
        		clear: both;
        		display: block;
        	}
        	.card-description {
        		width: 78%;
        		box-sizing: border-box;
        		padding: 2%;
        		height: 40vh;
        		overflow-y: auto;
        	}
        	.card-item {
        		height: 40vh;
        	}
        	.card-item img {
        		height: 70%;
        	}
        	@media only screen and (max-width: 768px) {
				.card-description {
			    	width: 67%;
			  	}
			}
			
        </style>
        <script type="text/javascript">
        	function addCart(name, id) {
        		window.location.href = "./addCart.jsp?product="+name+"&id="+id;
        	}
        </script>
    </head>
    <body>

      <!-- Navbar start here -->
      <nav class="navbar">
        <form action="" method="get" id="search-form" class="nav-item">
            <img class="nav-brand" src="../logos/trendz.jpg"/>
            <!--  <input type="search" placeholder="Search Products" name="product" required/> -->
            <select class="categories" name="product" required>
	            <option value="" selected disabled>Choose Categories</option>
	            <%
	            	ArrayList<String> category = CategoryDAO.getAllCategories();
   	            	int n = category.size();
   	            	for(int itr = 0; itr < n; itr++) {
	            %>
	            <option value=<%= category.get(itr) %> ><% out.print(category.get(itr)); } %></option>
            </select>
            
            <button type="submit"><i class="bi bi-search"></i></button>
        </form>
        <div id="nav-menu">
          <a href="#home"><i class="bi bi-house-door-fill nav-item">Home</i></a>
          <a href="#contact"><i class="bi bi-telephone-fill nav-item">Contact</i></a>
          <a href="#about"><i class="bi bi-info-circle-fill nav-item">About</i></a>
          <% 
			String name = (String)session.getAttribute("name");
			if(name == null) {
          		out.println("<a href='./formPage.jsp'><i class='bi bi-person-fill nav-item'>Signin</i></a>");
			}
			else {
				out.println("<a href='./carts.jsp'><i class='bi bi-cart nav-item'>Cart</i></a>");
				out.println("<a href='./logout.jsp'><i class='bi bi-power nav-item'>logout</i></a>");
			}
		  %>
        </div>
      </nav>
      <!-- Navbar ends here -->

      <!-- Products -->
      <section class="card">
        <% 
        	String productName = request.getParameter("product");
        	ArrayList<Product> products = ProductDAO.getProductsByCategory(productName);
        	ArrayList<Long> id = new ArrayList<Long>();
        	int itr = 0;
        	String email = (String)session.getAttribute("email");
        	for(Product pr : products) {
        		id.add(pr.getProductId());
        %>
        
        <div class="card-box">
        	<div class="card-item" id="<%= pr.getProductId()%>">
        		<b class="bi bi-cart-plus" onclick='addCart("<%= pr.getName() %>", "<%= pr.getProductId() %>" )'><p><%= pr.getName() %> </p></b>
        		<img src="../products/<%= pr.getProductImage()%>" />
        		<b><p>M.R.P: &#8377; <%= pr.getPrice() %></p></b>
        		<b class="bi bi-coin"><p>buy</p></b>
        	</div>
        	<div class="card-description">
        		<% 
        			String []description = pr.getDescription().split(";");
        			for (String desc : description) {
        		%>
            			<b><%= desc %></b><br/>
            	<%
        			}
        		%>
        	</div>
        </div>
        <%		
        	itr++;
        	}
        %>
      </section>
      <!-- Products -->

      <!-- Footer starts here -->
      <footer id="about">
      	<div class="left">
	      	<h1>Know More...</h1>
	      	<br/>
			<a href="./terms.jsp"><i class="bi bi-box-arrow-up-right"></i> terms &amp; condition</a><br/>
			<a href="./privacy.jsp"><i class="bi bi-card-text"></i> privacy policy</a><br/>
			<a href="./help.jsp"><i class="bi bi-info-circle"></i> help</a><br/>
		</div>
		<div class="right">
	      	<h1>Connect with us </h1>
	      	<br/>
			<a href="https://www.facebook.com/trendzsupport"><i class="bi bi-facebook"></i> facebook</a><br/>
			<a href="https://www.instagram.com/trendzsupport"><i class="bi bi-instagram"></i> Instagram</a><br/>
			<a href="https://twitter.com/trendzsupport"><i class="bi bi-twitter"></i> twitter</a><br/>
		</div>
      </footer>
      <!-- Footer ends here -->

    </body>
</html>