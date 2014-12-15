<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title> LiveChat</title>
<link href="Style.css" rel="stylesheet" type="text/css">
<link href="bootstrap.css" rel="stylesheet" type="text/css">
<script>
</script>

</head>

<body>

<%
int delaytime=2000;
String url=(String)request.getAttribute("url");
String msg=(String)request.getAttribute("msg");
String delay=(String)request.getAttribute("delay");
if(delay!=null)
{
	delaytime=Integer.parseInt((String)request.getAttribute("delay"));
	
}
%>

<script>

function redirect()
{
	window.location.href="<%= url %>";
	
}
setTimeout(redirect,<%= delaytime%>);


</script>



<header>
<img src="logo.png" width="188" height="91" alt="logo">

<div id="orangebar">

</div>
</header>

<article>


<label id="Notify" class="lead"><%=msg %> </label>



</article>





<footer>


</footer>
</body>
</html>
