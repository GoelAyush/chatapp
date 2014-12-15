<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Reset/Update Password</title>
<link href="Style.css" rel="stylesheet" type="text/css">
<link href="bootstrap.css" rel="stylesheet" type="text/css">

<script>

function loadXMLDoc()
{

var1=document.getElementById("email").value;
var2=document.getElementById("contact").value;
var3=document.getElementById("lname").value;
	if(var1=="" || var2=="" || var3=="")
	{
		alert("One of the Fileld is Empty ");
		return false;
	}
var xmlhttp;
xmlhttp=new XMLHttpRequest();
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	  if(xmlhttp.responseText==0)
	  {
			alert("E-mail ID not Registered");
			window.location(Login.jsp);
	
	  }
		


	  
	  else if(xmlhttp.responseText==-1)
	  {
		 alert("Invalid Credentials");
		  
	  }
	  else
	  {
		  document.getElementById("newpassword").style.visibility="visible";
		  document.getElementById("contact").style.visibility="hidden";
		  document.getElementById("email").style.visibility="hidden";
		  document.getElementById("lname").style.visibility="hidden";
		  document.getElementById("btn1").style.visibility="hidden";
		  document.getElementById("btn2").style.visibility="visible";
		  document.getElementById("iduser").value=xmlhttp.responseText;
	  }
	  
    }
  };
xmlhttp.open("GET","ForgotPassword?email="+var1+"&contact="+var2+"&lname="+var3,true);
xmlhttp.send();

}

function Updatepassword()
{
	var5=document.getElementById("newpassword").value;
	if(var5.length < 6)
	{
		alert("Minimum 6 characters for Password ");
		return false;
	}
	var6=document.getElementById("iduser").value;
	var xmlhttp;
	xmlhttp=new XMLHttpRequest();
		xmlhttp.onreadystatechange=function()
	 	 {
	 		 if (xmlhttp.readyState==4 && xmlhttp.status==200)
	  		  {
				  if(xmlhttp.responseText==1)
					  {
					  	alert("Updated Successfully");
						window.location="Login.jsp";
						
		  			  }	  
				  else
					{
						alert("Try Later");
						window.location="Login.jsp";
					}
	   		  }
		};
		xmlhttp.open("GET","ForgotPassword2?id="+var6+"&newpassword="+var5,true);
		xmlhttp.send();

}



</script>
</head>

<body>

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
	<li ><a  href="LandingPage.jsp" >Home </a></li> 
	<li ><a target="blank" href="http://www.google.com" >What is LiveChat </a></li>  
            <li ><a target="blank"  href="http://www.google.com" >Find Help </a></li>  
            
            
            
          
	</ul> 
</div> 

</div>
</header>

<div id="register2">

<label class="lead"> Give the following details to Reset/Update your Password </label>

<br />

<input id ="email" name="email" type="email" placeholder="Your E-mail"  REQUIRED="REQUIRED" size="18px"  ></input>
<br />

<input id ="contact"  name="contact" type="number" placeholder="Your Contact Number"  REQUIRED="REQUIRED" size="18px" ></input>

<br />

<input id ="lname" name="lname" type="text" placeholder="Your Last name"  REQUIRED="REQUIRED" size="18px" ></input>
<br />

<input class="btn btn-inverse" id ="btn1" onclick="return loadXMLDoc()"; type="button"  value="Proceed" ></input>
<br />
<input id ="newpassword" name="newpassword" type="password" placeholder="Choose a new Password"  REQUIRED="REQUIRED" size="18px" ></input>
<br />
<input class="btn btn-inverse" id ="btn2" onclick="return Updatepassword()"; type="button"  value="Reset" ></input>
<input type="hidden" id ="iduser"></input>

</div>







</body>
</html>
    