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



<script>

function redirect()
{
	<%
	try{
		
		Thread.sleep(2000);
	}
	catch(Exception e)
	{
		
		
	}
	RequestDispatcher rd2=request.getRequestDispatcher("ChatWithUser");
	rd2.forward(request, response);
	%>
}



</script>



<header>
<img src="logo.png" width="188" height="91" alt="logo">

<div id="orangebar">

</div>
</header>

<article>


<label id="Notify" class="lead">Request Sent , Wait for 15s if request is Approved you will be Automatically be taken to chat page </label>



</article>





<footer>


</footer>
</body>
</html>
