<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
          <a href="../index.jsp#home"><i class="bi bi-house-door-fill nav-item">Home</i></a>
          <a href="../index.jsp#contact"><i class="bi bi-telephone-fill nav-item">Contact</i></a>
          <a href="../index.jsp#about"><i class="bi bi-info-circle-fill nav-item">About</i></a>
          <% 
			String name = (String)session.getAttribute("name");
			if(name == null) {
          		out.println("<a href='./formPage.jsp'><i class='bi bi-person-fill nav-item'>Signin</i></a>");
			}
			else {
				out.println("<a href='./logout.jsp'><i class='bi bi-power nav-item'>logout</i></a>");
			}
		  %>
        </div>
      </nav>
      <!-- Navbar ends here -->

	  <!-- privacy section starts -->
	  <section class="instruction">
	  	<h1>Trendz Privacy Policy</h1>
	  	<p>We know that you care how information about you is used and shared, and we appreciate your trust that we will do so carefully and sensibly. This Privacy Notice describes how Trendz Seller Services Private Limited and its affiliates including Trendz.com, Inc.  collectively "Trendz") collect and process your personal information through Trendz websites, devices, products, services, online marketplace and applications that reference this Privacy Notice (together "Trendz Services").</p><br/>
		<p>By using Trendz Services you agree to our use of your personal information (including sensitive personal information) in accordance with this Privacy Notice, as may be amended from time to time by us at our discretion. You also agree and consent to us collecting, storing, processing, transferring, and sharing your personal information (including sensitive personal information) with third parties or service providers for the purposes set out in this Privacy Notice.</p><br/><br/>
		
		<h1>What Personal Information About Customers Does Trendz Collect?</h1>
		<p>We collect your personal information in order to provide and continually improve our products and services.</p><br/>
		<p>Here are the types of personal information we collect:</p><br/>
		<ul>
		  <li><p><b>Information You Give Us:</b> We receive and store any information you provide in relation to Trendz Services. Click here to see examples of what we collect. You can choose not to provide certain information, but then you might not be able to take advantage of many of our Trendz Services.</p><br/></li>
		  <li><p><b>Automatic Information:</b> We automatically collect and store certain types of information about your use of Trendz Services, including information about your interaction with content and services available through Trendz Services. Like many websites, we use cookies and other unique identifiers, and we obtain certain types of information when your web browser or device accesses Trendz Services and other content served by or on behalf of Trendz on other websites. Click here to see examples of what we collect.</p><br/></li>
		  <li><p><b>Information from Other Sources:</b> We might receive information about you from other sources, such as updated delivery and address information from our carriers, which we use to correct our records and deliver your next purchase more easily. Click here to see additional examples of the information we receive</p><br/></li>
		</ul><br/><br/>
	
		<h1>For What Purposes Does Trendz Use Your Personal Information?</h1>
		<p>We use your personal information to operate, provide, develop, and improve the products and services that we offer our customers. These purposes include:</p><br/>
		<ul>
		  <li><p><b>Purchase and delivery of products and services.</b> We use your personal information to take and fulfill orders, deliver products and services, process payments, and communicate with you about orders, products and services, and promotional offers.</p><br/></li>
		  <li><p><b>Provide, troubleshoot, and improve Trendz Services.</b> We use your personal information to provide functionality, analyze performance, fix errors, and improve the usability and effectiveness of the Trendz Services.</p><br/></li>
		  <li><p><b>Recommendations and personalization.</b> We use your personal information to recommend features, products, and services that might be of interest to you, identify your preferences, and personalize your experience with Trendz Services.</p><br/></li>
		  <li><p><b>Provide voice, image and camera services.</b> When you use our voice, image and camera services, we use your voice input, images, videos, and other personal information to respond to your requests, provide the requested service to you, and improve our services. For more information about Alexa voice services, click here.</p><br/></li>
		  <li><p><b>Comply with legal obligations.</b> In certain cases, we collect and use your personal information to comply with laws. For instance, we collect from sellers information regarding place of establishment and bank account information for identity verification and other purposes.</p><br/></li>
		  <li><p><b>Communicate with you.</b> We use your personal information to communicate with you in relation to Trendz Services via different channels (e.g., by phone, e-mail, chat).</p><br/></li>
		  <li><p><b>Advertising.</b> We use your personal information to display interest-based ads for features, products, and services that might be of interest to you. We do not use information that personally identifies you to display interest-based ads. To learn more, please read our Interest-Based Ads notice.</p><br/></li>
		  <li><p><b>Fraud Prevention and Credit Risks.</b> We use personal information to prevent and detect fraud and abuse in order to protect the security of our customers, Trendz, and others. We may also use scoring methods to assess and manage credit risks.</p></li>
		</ul><br/><br/>
		
		<h1>What About Cookies and Other Identifiers?</h1>
		<p>To enable our systems to recognize your browser or device and to provide and improve Trendz Services, we use cookies and other identifiers. For more information about cookies and how we use them, please read our Cookies Notice.</p><br/><br/>

		<h1>Does Trendz Share Your Personal Information?</h1>
		<p>Information about our customers is an important part of our business and we are not in the business of selling our customers’ personal information to others. We share customers’ personal information only as described below and with Trendz.com, Inc. and subsidiaries that Trendz.com, Inc. controls that either are subject to this Privacy Notice or follow practices at least as protective as those described in this Privacy Notice.</p><br/>
		<ul>
		  <li><p><b>Transactions involving Third Parties:</b> We make available to you services, products, applications, or skills provided by third parties for use on or through Trendz Services. For example, the products you order through our marketplace are from third parties, you can download applications from third-party application providers from our App Store, and enable third-party skills through our Alexa services. We also offer services or sell product lines jointly with third-party businesses, such as sellers on the marketplace, restaurants registered on Trendz.in, merchants providing mobile recharges and bill-payment assistance. You can tell when a third party is involved in your transactions, and we share customers’ personal information related to those transactions with that third party.</p><br/></li>
		  <li><p><b>Third-Party Service Providers:</b> We employ other companies and individuals to perform functions on our behalf. Examples include fulfilling orders for products or services, delivering packages, sending postal mail and e-mail, removing repetitive information from customer lists, analyzing data, providing marketing assistance, providing search results and links (including paid listings and links), processing payments, transmitting content, scoring, assessing and managing credit risk, and providing customer service. These third-party service providers have access to personal information needed to perform their functions, but may not use it for other purposes. Further, they must process the personal information in accordance with applicable law.</p><br/></li>
		  <li><p><b>Business Transfers:</b> As we continue to develop our business, we might sell or buy other businesses or services. In such transactions, customer information generally is one of the transferred business assets but remains subject to the promises made in any pre-existing Privacy Notice (unless, of course, the customer consents otherwise). Also, in the unlikely event that Trendz.com, Inc. or Trendz Seller Services Private Limited or any of its affiliates, or substantially all of their assets are acquired, customer information will of course be one of the transferred assets.</p><br/></li>
		  <li><p><b>Protection of Trendz and Others:</b>We release account and other personal information when we believe release is appropriate to comply with the law; enforce or apply our Conditions of Use and other agreements; or protect the rights, property, or safety of Trendz, our users, or others. This includes exchanging information with other companies and organizations for fraud protection and credit risk reduction.</p><br/></li>
		</ul>
		<p>Other than as set out above, you will receive notice when personal information about you might be shared with third parties, and you will have an opportunity to choose not to share the information.</p><br/><br/>
		
		<h1>How Secure Is Information About Me?</h1>
		<p>We design our systems with your security and privacy in mind.</p><br/>
		<ul>
		  <li><p>We work to protect the security of your personal information during transmission by using encryption protocols and software.</p><br/></li>
		  <li><p>We follow the Payment Card Industry Data Security Standard (PCI DSS) when handling payment card data.</p><br/></li>
		  <li><p>We maintain physical, electronic, and procedural safeguards in connection with the collection, storage, processing, and disclosure of personal customer information. Our security procedures mean that we may occasionally request proof of identity before we disclose personal information to you.</p><br/></li>
		  <li><p>Our devices offer security features to protect them against unauthorized access and loss of data. You can control these features and configure them based on your needs. Click here for more information on how to manage the security settings of your device.</p><br/></li>
		  <li><p>It is important for you to protect against unauthorized access to your password and to your computers, devices and applications. Be sure to sign off when finished using a shared computer. Click here for more information on how to sign off.</p><br/></li>
		</ul><br/><br/>
		

		<h1>What About Advertising?</h1>
		<p><b>Third-Party Advertisers and Links to Other Websites:</b> Trendz Services may include third-party advertising and links to other websites and apps. Third-party advertising partners may collect information about you when you interact with their content, advertising, and services. For more information about third-party advertising at Trendz, including interest-based ads, please read our Interest-Based Ads policy. To adjust your advertising preferences, please go to the Advertising Preferences page.</p><br/>
		<p><b>Use of Third-Party Advertising Services:</b> We provide ad companies with information that allows them to serve you with more useful and relevant Trendz ads and to measure their effectiveness. We never share your name or other information that directly identifies you when we do this. Instead, we use an advertising identifier like a cookie or other device identifier. For example, if you have already downloaded one of our apps, we will share your advertising identifier and data about that event so that you will not be served an ad to download the app again. Some ad companies also use this information to serve you relevant ads from other advertisers. You can learn more about how to opt-out of interest-based advertising by going to the Advertising Preferences page.</p><br/><br/>

		<h1>What Information Can I Access?</h1>
		<p>You can access your information, including your name, address, payment options, profile information, Prime membership, household settings, and purchase history in the "Your Account" section of the website or mobile application. Click here for a list of examples that you can access. To request access to personal information that is not available through Your Account you can submit a request here.</p><br/><br/>

		<h1>What Choices Do I Have?</h1>
		<p>If you have any questions as to how we collect and use your personal information, please contact our Grievance Officer. Many of our Trendz Services also include settings that provide you with options as to how your information is being used</p><br/>
		<ul>
		  <li><p>As described above, you can always choose not to provide certain information, but then you might not be able to take advantage of many of the Trendz Services.</p></li>
		  <li><p>You can add or update certain information on pages such as those referenced in What Information Can I Access?. When you update information, we usually keep a copy of the prior version for our records</p></li>
		  <li><p>If you do not want to receive e-mail or other communications from us, please adjust your Customer Communication Preferences. If you don’t want to receive in-app notifications from us, please adjust your notification settings in the app or device</p></li>
		  <li><p>If you do not want to see interest-based ads, please adjust your Advertising Preferences.</p></li>
		  <li><p>The Help feature on most browsers and devices will tell you how to prevent your browser or device from accepting new cookies or other identifiers, how to have the browser notify you when you receive a new cookie or how to block cookies altogether. Because cookies and identifiers allow you to take advantage of some essential features of Trendz Services, we recommend that you leave them turned on. For instance, if you block or otherwise reject our cookies, you will not be able to add items to your Shopping Cart, proceed to Checkout, or use any Services that require you to Sign in. For more information about cookies and other identifiers, see our Cookies Notice.</p></li>
		  <li><p>If you want to browse our websites without linking the browsing history to your account, you may do so by logging out of your account here and blocking cookies on your browser.</p></li>
		  <li><p>You will also be able to opt out of certain other types of data usage by updating your settings on the applicable Trendz website (e.g., in "Manage Your Content and Devices"), device, or application. For more information click here. Most non-Trendz devices also provide users with the ability to change device permissions (e.g., disable/access location services, contacts). For most devices, these controls are located in the device's settings menu. If you have questions about how to change your device permissions on devices manufactured by third parties, we recommend you contact your mobile service carrier or your device manufacturer.</p></li>
		  <li><p>If you are a seller, you can add or update certain information in Seller Central , update your account information by accessing your Seller Account Information, and adjust your e-mail or other communications you receive from us by updating your Notification Preferences.</p></li>
		</ul><br/><br/>

		<h1>Are Children Allowed to Use Trendz Services ?</h1>
		<p>Trendz does not sell products for purchase by children. We sell children's products for purchase by adults. If you are under the age of 18 years, you may use Trendz Services only with the involvement of a parent or guardian.</p><br/><br/>

		<h1>Conditions of Use, Notices , and Revisions</h1>
		<p>If you choose to use Trendz Services, your use and any dispute over privacy is subject to this Notice and our Conditions of Use, including limitations on damages, resolution of disputes, and application of the prevailing law in India. If you have any concern about privacy at Trendz, please contact us with a thorough description, and we will try to resolve it. Our business changes constantly, and our Privacy Notice will change also. You should check our websites frequently to see recent changes.</p><br/>
		<p>Unless stated otherwise, our current Privacy Notice applies to all information that we have about you and your account. We stand behind the promises we make, however, and will never materially change our policies and practices to make them less protective of customer information collected in the past without the consent of affected customers.</p><br/><br/>

		<h1>Related Practices and Information</h1>
		<ul>
		  <li><p>Conditions of Use</p></li>
		  <li><p>Seller Program Policies</p></li>
		  <li><p>Help Department</p></li>
		  <li><p>Most Recent Purchases</p></li>
		  <li><p>Your Profile and Community Guidelines</p></li>
		</ul><br/><br/>
	  </section>
	  <!-- privacy section ends -->

	  <!-- Footer starts here -->
      <footer id="about">
      	<div class="left">
	      	<h1>Know More...</h1>
	      	<br/>
			<a href="./terms.jsp"><i class="bi bi-box-arrow-up-right"></i> terms &amp; condition</a><br/>
			<a href="#"><i class="bi bi-card-text"></i> privacy policy</a><br/>
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