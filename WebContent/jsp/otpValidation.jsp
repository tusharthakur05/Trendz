<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mail.SendMail"%>

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
        <link href="../css/formPage.css" rel="stylesheet" type="text/css">
        <link rel="apple-touch-icon" sizes="180x180" href="../logos/favicon_io/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../logos/favicon_io/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../logos/favicon_io/favicon-16x16.png">
        <link rel="manifest" href="../logos/favicon_io/site.webmanifest">
        <script src="../js/MyScript.js" type="text/javascript"></script>
    </head>
    <body>
		
	  <%
	  	if(session.getAttribute("name") != null) {
	  		response.sendRedirect("../index.jsp");
	  	}
	  %>
	  
      <!-- Navbar start here -->
      <nav class="navbar">
        <form action="./product.jsp" method="get" id="search-form" class="nav-item" style="border: none;">
            <img class="nav-brand" src="../logos/trendz.jpg"/>
            <!--  <input type="search" placeholder="Search Products" name="product" required/> -->
            <select class="categories" name="product" required>
	            <option value="" selected disabled>Choose Categories</option>
	            <option value="Mobile">Mobile</option>
	            <option value="Laptop">Laptop</option>
            </select>
            
            <button type="submit"><i class="bi bi-search"></i></button>
        </form>
        <div id="nav-menu">
          <a href="../index.jsp"><i class="bi bi-house-door-fill nav-item">Home</i></a>
          <a href="../index.jsp"><i class="bi bi-telephone-fill nav-item">Contact</i></a>
          <a href="../index.jsp"><i class="bi bi-info-circle-fill nav-item">About</i></a>
        </div>
      </nav>
      <!-- Navbar ends here -->

      <section class="details">
      	<form class="signin" method="POST" action="./signup.jsp">
            <input type="button" class="btn-active" value="OTP" disabled/>
            <input type="button" class="cancel" onclick="homePage()" value="X">
            <br/><br/><br/>
            
            <i class="bi bi-envelope-fill"></i>
            <input type="number" placeholder="Enter OTP" name="otp" onchange="validateOTP('otp')" required/><br/><br/>
            <button type="submit" name="resend">Resend OTP</button><br/><br/>
            <button type="submit">Continue</button><br/><br/>
          </form>
      </section>      
      
      <!-- Footer starts here -->
      <footer>
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