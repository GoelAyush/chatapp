<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>User DashBoard</title>
<link href="Style.css" rel="stylesheet" type="text/css">
<link href="bootstrap.css" rel="stylesheet" type="text/css">
</head>

<body>

<div id="color">
<%
HttpSession session2=request.getSession(false);
Integer id=((Integer)session2.getAttribute("id"));
String name = (String)session2.getAttribute("name");
String lastvisit = (String)session2.getAttribute("lastvisit");
if(id==null)
{
	response.sendRedirect("Login.jsp");
}
%>

<header>
<img src="logo.png" width="188" height="91" alt="logo">
<div id="social">
<img src="twitter.png" width="30" onclick="window.open('http://www.twitter.com', 'newwindow', 'width=400, height=300'); return false;" height="30" >
<img src="gplus.png" width="30" onclick="window.open('http://www.plus.google.com', 'newwindow', 'width=400, height=300'); return false;" height="30" >
<img src="fb.jpg"  width="30" onclick="window.open('http://www.facebook.com', 'newwindow', 'width=400, height=300'); return false;" height="30" >

</div>
  <div id="orangebar">
  
  
<div id = "headernav">

	<ul> 
	

		<li ><a href="#" onclick="window.open('Help.html', 'newwindow', 'width=400, height=300'); return false;">Find Help</a></li>
		<li ><a href="LogoutServlet" >Logout</a></li>
		<li ><a href="Settings.jsp" >Settings </a></li>
		<li ><a href="Customize.jsp" >Customize </a></li>
		<li ><a href="Resetonnavigation?navval=1" >File Manager</a></li>
   		<li ><a href="ChatUserDisplayServlet" >Start Chat </a></li>
                
         
            
            
            
          
	</ul> 
</div> 

</div>
</header>
<div id = "dp">
<img src="<%="dp/"+id+".jpg" %>" height=200 width=120>  </img>
</div >

<div class="hero-unit" id="welcomemsg">
  <h1>Welcome <%=name %></h1>
  <br />
  <p>You Last visit details -  <%=lastvisit %> </p>
  <p>Click Start Chat to Get Started</p>

</div>

</div>
</body>
</html>
