<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="dao.CategoryDAO" %>

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
        <script type="text/javascript">
        	
        </script>
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
          <a href="../index.jsp#home"><i class="bi bi-house-door-fill nav-item">Home</i></a>
          <a href="../index.jsp#contact"><i class="bi bi-telephone-fill nav-item">Contact</i></a>
          <a href="../index.jsp#about"><i class="bi bi-info-circle-fill nav-item">About</i></a>
        </div>
      </nav>
      <!-- Navbar ends here -->

      <section class="details">
          <!-- Sign In Page Start -->
          <form class="signin" method="POST" action="./signin.jsp">
            <input type="button" class="btn-active" value="Signin" disabled/>
            <input type="button" value="Signup" onclick="signupDisplay()">
            <input type="button" class="cancel" onclick="homePage()" value="X">
            <br/><br/><br/>
            
            <i class="bi bi-envelope-fill"></i>
            <input type="email" placeholder="Enter email" name="eml" onchange="validateEmail('eml', 'eml_wrn_sin')" required/>
            <br/><p class="wrn-msg" id="eml_wrn_sin">Invalid email</p><br/>
            <i class="bi bi-eye-slash-fill" onclick="togglePassword('sin_pwd_icon','sin_pwd')" id="sin_pwd_icon"></i>
            <input type="password" placeholder="Enter password" name="sin_upwd" id="sin_pwd" required/>
            <br/><p class="wrn-msg" id="pwd_wrn_sin">Invalid password</p><br/>
            <button type="submit">Continue</button><br/>
            <a href="#" onclick="forgotpasswordDisplay()">forgot password ?</a>
          </form>
          <!-- Sign In Page End -->

        <!-- Sign Up Page Start -->
        <form class="signup" method="POST" action="./signup.jsp">
            <input type="button" value="Signin" onclick="signinDisplay()"/>
            <input type="button" class="btn-active" value="Signup" disabled>
            <input type="button" class="cancel" onclick="homePage()" value="X">
            <br/><br/><br/>
            
            <i class="bi bi-person-fill"></i>
            <input type="text" placeholder="Name..." name="uname" required/>          
            <br/><br/>
            <i class="bi bi-envelope-fill"></i>
            <input type="email" placeholder="Email..." name="ueml" onchange="validateEmail('ueml', 'eml_wrn_sup')" required/>
            <br/><p class="wrn-msg" id="eml_wrn_sup">Invalid email</p><br/>
            <i class="bi bi-eye-slash-fill" onclick="togglePassword('sup_pwd_icon', 'sup_pwd')" id="sup_pwd_icon"></i>
            <input type="password" placeholder="Password..." name="sup_upwd" id="sup_pwd" required/>
            <br/><p class="wrn-msg" id="pwd_wrn_sup">Invalid password</p><br/>
            <i class="bi bi-telephone-fill"></i>
            <input type="number" placeholder="Mobile..." name="umob" required/>
            <br/><p class="wrn-msg" id="mob_err_sup">Invalid mobile</p><br/>
            <i class="bi bi-geo-alt-fill"></i>
            <textarea placeholder="Address..." name="uadd" required></textarea>
            <br/><br/>
            <i class="bi bi-building"></i>
            <select id="state" size="1" name="state" onchange="makeSubmenu(this.value, 'dist')" required>
                <option value="" disabled selected>Choose State</option>
                <option value="Andhra Pradesh">Andhra Pradesh</option>
                <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                <option value="Assam">Assam</option>
                <option value="Bihar">Bihar</option>
                <option value="Chandigarh">Chandigarh</option>
                <option value="Chhattisgarh">Chhattisgarh</option>
                <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
                <option value="Daman and Diu">Daman and Diu</option>
                <option value="Delhi">Delhi</option>
                <option value="Lakshadweep">Lakshadweep</option>
                <option value="Puducherry">Puducherry</option>
                <option value="Goa">Goa</option>
                <option value="Gujarat">Gujarat</option>
                <option value="Haryana">Haryana</option>
                <option value="Himachal Pradesh">Himachal Pradesh</option>
                <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                <option value="Jharkhand">Jharkhand</option>
                <option value="Karnataka">Karnataka</option>
                <option value="Kerala">Kerala</option>
                <option value="Madhya Pradesh">Madhya Pradesh</option>
                <option value="Maharashtra">Maharashtra</option>
                <option value="Manipur">Manipur</option>
                <option value="Meghalaya">Meghalaya</option>
                <option value="Mizoram">Mizoram</option>
                <option value="Nagaland">Nagaland</option>
                <option value="Odisha">Odisha</option>
                <option value="Punjab">Punjab</option>
                <option value="Rajasthan">Rajasthan</option>
                <option value="Sikkim">Sikkim</option>
                <option value="Tamil Nadu">Tamil Nadu</option>
                <option value="Telangana">Telangana</option>
                <option value="Tripura">Tripura</option>
                <option value="Uttar Pradesh">Uttar Pradesh</option>
                <option value="Uttarakhand">Uttarakhand</option>
                <option value="West Bengal">West Bengal</option>
              </select>
              <br/><br/>
			  <i class="bi bi-globe"></i>
              <select id="dist" name="dist" size="1" required>
                <option value="" disabled selected>Choose City</option>
              </select>
              <br/><br/>
              <span><input type="checkbox" style="margin-right:0.2rem;" />By continuing, you agree to Trendz <a href="#">terms &amp; conditions.</a></span><br/><br/>
            <button type="submit">Create Account</button>
        </form>
        <!-- Sign Up Page End -->
        
        <!-- Forgot Password Page Start -->
         <form class="forgotpassword" method="POST" action="./forgotpassword.jsp">
           <input type="button" class="btn-active" value="Recover Account" disabled/>
           <input type="button" class="cancel" onclick="homePage()" value="X">
           <br/><br/><br/>
           
           <i class="bi bi-envelope-fill"></i>
           <input type="email" placeholder="Enter email" name="eml_fp" onchange="validateEmail('eml_fp', 'eml_wrn_fp')" required/>
           <br/><p class="wrn-msg" id="eml_wrn_fp">Invalid email</p><br/>
           <i class="bi bi-eye-slash-fill" onclick="togglePassword('fp_pwd_icon','fp_pwd')" id="fp_pwd_icon"></i>
           <input type="password" placeholder="Enter password" name="fp_pwd" id="fp_pwd" required/>
           <br/><br/>
           <i class="bi bi-eye-slash-fill"></i>
           <input type="password" placeholder="Confirm password" name="fp_cpwd" required/>
           <br/><br/>
           <button type="submit">Update Password</button><br/>
           <a href="#" onclick="signinDisplay()">wanna go back?</a>
         </form>
         <!-- Forgot Password Page End -->
        
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