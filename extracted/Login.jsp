<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Welcome to LiveChat</title>
<link href="Style.css" rel="stylesheet" type="text/css">
<link href="bootstrap.css" rel="stylesheet" type="text/css">
<script>
function ContactValidate()
{
    var x = document.getElementById("contact").value;
    var y = document.getElementById("pwd2").value;
    if (x.length < 10||x.length > 10)
	{
     	alert("Enter 10 characters Exactly in the phone Field."); 
		return false;
    }
    if (y.length < 6)
	{
     	alert("Minimum 6 character Password "); 
		return false;
    }

    
       
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
           
            <li ><a href="#" onclick="window.open('tablet.jpg', 'newwindow', 'width=400, height=300'); return false;">What is LiveChat</a></li>  
            <li ><a href="#" onclick="window.open('Help.html', 'newwindow', 'width=400, height=300'); return false;">Find Help</a>
</li>  
	</ul> 
</div> 

</div>
</header>

<article>


<div id="panel">
<div id="login">

<label class="lead"> Returning User, Login here </label>


<form id="form1" action="Login_Check_Servlet" method="post">

</br>
</br>
<input name="email_id" id ="email_id" type="email"  placeholder="Your E-Mail Address" REQUIRED="REQUIRED" size="40px" ></input>

</br>
</br>

<input id ="pwd" name="pwd" type="password" placeholder="Your Password"  REQUIRED="REQUIRED" size="20px" >

</br>
</br></br>

<input class="btn btn-inverse" id ="btn1 " type="submit" value="Login" ></input>

<input class="btn btn-inverse" id ="btn3 " type="button" onclick="location.href='ForgotPassword.jsp'" value="Forgot Password" ></input>



</form>



</div>

<div id="seperator">
<img src="seperator.jpg" ></img>
</div>


<div id="register">

<label class="lead"> New User, Join us in Seconds </label>


<form id="form2" onsubmit="return ContactValidate();" action="NewRegistrationServlet" method="post">

</br>

<input id ="fname" name="fname" type="text" placeholder="First Name"  REQUIRED="REQUIRED"size="18px"  ></input>
</br>

<input id ="lname" name="lname" type="text" placeholder="Last name"  REQUIRED="REQUIRED"size="18px">

</br>


<input id ="email_id2" name="email_id2" type="email" placeholder="Your E-Mail Address"  REQUIRED="REQUIRED"size="40px" ></input>
</br>
<input id ="contact"  name="contact" type="number" placeholder="Contact Number"  REQUIRED="REQUIRED"size="18px">

</br>
<input id ="pwd2" name="pwd2" type="password" placeholder="Choose A Password"  REQUIRED="REQUIRED"size="40px" ></input>
</br>
<input id ="nickname" name="nickname" type="text" placeholder="Pick A Nickname"  REQUIRED="REQUIRED"size="40px" ></input>
</br>

<input class="btn btn-inverse" id ="btn2 "  type="submit" value="Register" ></input>





</form>



</div>
</div>

</article>

</body>
</html>
