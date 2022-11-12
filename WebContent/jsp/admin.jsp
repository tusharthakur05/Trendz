<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="model.Product" %>
<%@page import="dao.CategoryDAO" %>
<%@page import="dao.ProductDAO" %>

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
        <link rel="apple-touch-icon" sizes="180x180" href="../logos/favicon_io/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../logos/favicon_io/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../logos/favicon_io/favicon-16x16.png">
        <link rel="manifest" href="../logos/favicon_io/site.webmanifest">
        <script src="../js/MyScript.js" type="text/javascript"></script>
    </head>
    <body>

      <!-- Navbar start here -->
      <nav class="navbar">
        <form action="./product.jsp" method="get" id="search-form" class="nav-item">
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

      <!-- Demo section starts here -->
      <section class="demo-section" id="home">
      <% 
        	String productName = "mobile";
        	ArrayList<Product> products = ProductDAO.getProductsByCategory(productName);
        	ArrayList<Long> id = new ArrayList<Long>();
        	int itr = 0;
        	String email = (String)session.getAttribute("email");
        	for(Product pr : products) {
        		id.add(pr.getProductId());
        %>
        <img class="demo-section-item" style="display: block;" src="../products/<%= pr.getProductImage() %>" />
        <%
        	}
        %>
        
        <!-- 
        <img class="demo-section-item" style="display: block;" src="../logos/bg/bg1.jpg" />
        <img class="demo-section-item" style="display: block;" src="../logos/bg/bg2.jpg" />
        <img class="demo-section-item" style="display: block;" src="../logos/bg/bg3.jpg" />
        <img class="demo-section-item" style="display: block;" src="../logos/bg/bg4.jpg" />
        -->
        <div class="nav-arr">
          <i class="bi bi-arrow-left-circle-fill" onclick="demoSection(-2)"></i>
          <i class="bi bi-arrow-right-circle-fill" onclick="demoSection(-1)"></i>
        </div>
        <div class="nav-dot">
        <%
        	itr = 0;
        	for(long i : id) {
       	%>
       	<i class="bi bi-dot nav-dot-item" onclick="demoSection(<%= itr %>)"></i>
       	<%	
       			itr++;
        	}
        %>
          <!-- 
          <i class="bi bi-dot nav-dot-item" style="color: green;" onclick="demoSection(0)"></i>
          <i class="bi bi-dot nav-dot-item" onclick="demoSection(1)"></i>
          <i class="bi bi-dot nav-dot-item" onclick="demoSection(2)"></i>
          <i class="bi bi-dot nav-dot-item" onclick="demoSection(3)"></i>
          -->
        </div>
      </section>
      <!-- Demo section ends here -->

      <!-- Offer section starts here -->
      <section class="offer-section">
        <p>Trending Offers</p>
        <img class="offer-section-item" src="../logos/trendingoffers/offer1.jpeg" />
        <img class="offer-section-item" src="../logos/trendingoffers/offer2.jpeg" />
        <img class="offer-section-item" src="../logos/trendingoffers/offer3.jpeg" />
        <img class="offer-section-item" src="../logos/trendingoffers/offer4.jpeg" />
      </section>
      <!-- Offer section ends here -->

      <!-- Mobiles, smartphones -->
      <section class="offer-section">
        <p>Latest Smart phones from trusted brands</p>
        <article class="offer-section-item">
          <img class="offer-section-img" src="../logos/mobiles/apple.png"/><br/>
          <a class="offer-section-name" href="#">Iphone</a>
        </article>
        <article class="offer-section-item">
          <img class="offer-section-img" src="../logos/mobiles/oneplusnordCE.png" /><br/>
          <a class="offer-section-name" href="#">One Plus</a>
        </article>
        <article class="offer-section-item">
          <img class="offer-section-img" src="../logos/mobiles/realme8i.png" /><br/>
          <a class="offer-section-name" href="#">Realme</a>
        </article>
        <article class="offer-section-item">
          <img class="offer-section-img" src="../logos/mobiles/oppoa53.png" /><br/>
          <a class="offer-section-name" href="#">Oppo</a>
        </article>
      </section>
      <!-- Mobiles, smartphones -->

      <!-- Electronics and other accesories -->
      <section class="offer-section">
        <p>Laptops from trusted brands</p>
        <article class="offer-section-item">
          <img class="offer-section-img" src="../logos/laptops/AppleMacbook.png"/><br/>
          <a class="offer-section-name" href="#">Macbook</a>
        </article>
        <article class="offer-section-item">
          <img class="offer-section-img" src="../logos/laptops/Dell.png" /><br/>
          <a class="offer-section-name" href="#">One Plus</a>
        </article>
        <article class="offer-section-item">
          <img class="offer-section-img" src="../logos/laptops/Hp.png" /><br/>
          <a class="offer-section-name" href="#">Hp pavallion</a>
        </article>
        <article class="offer-section-item">
          <img class="offer-section-img" src="../logos/laptops/Acer.png" /><br/>
          <a class="offer-section-name" href="#">Acer</a>
        </article>
      </section>
      <!-- Electronics and other accesories -->

      <!-- Contact Form Start -->
      <form action="" method="POST" autocomplete="off" class="cnt" id="contact">
        <span>Contact Us</span>
        <i class="bi bi-person-fill"></i>
        <input type="text" name="uname" placeholder="Your Name..." required/>
        <br/><br/>
        <i class="bi bi-envelope-fill"></i>
        <input type="email" name="uemail" placeholder="Your Email..." onchange="validateEmail('uemail')" required/>
        <br/><br/>
        <i class="bi bi-chat-square-fill"></i>
        <textarea name="uquery" placeholder="Type Query..." required></textarea>
        <br/><br/>
        <input type="submit" value="Submit" />
      </form>
      <!-- Contact Form End -->

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