<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
import ="javax.servlet.http.HttpServlet"
import ="javax.servlet.http.HttpServletRequest"
import ="javax.servlet.http.HttpServletResponse"
import ="java.sql.*"
import ="java.util.*"
import="pack.*"
 %>
<!doctype html>
<html>

<head>
<%
HttpSession session2=request.getSession(false);
Integer id=((Integer)session2.getAttribute("id")); 
if(id==null)
{
	response.sendRedirect("Login.jsp");
}

%>
<meta charset="utf-8">
<title>Start A Chat</title>
<link href="Style.css" rel="stylesheet" type="text/css">
<link href="bootstrap.css" rel="stylesheet" type="text/css">




<script >




setInterval(loadXMLDoc, 3000);
function loadXMLDoc()
{
var xmlhttp;
var xmlhttp2;
xmlhttp=new XMLHttpRequest();
xmlhttp2=new XMLHttpRequest();

xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	  if(xmlhttp.responseText!=-1)
	  { 
		  var id = parseInt(xmlhttp.responseText);
		  xmlhttp2.open("GET","GetNamebyId?user2id="+id,true);
		  xmlhttp2.send();
		  document.getElementById("chatrequest").style.visibility='visible';
		  document.getElementById("userid6").value=id;
		  document.getElementById("userid5").value=id;
		  
	  }
	  if(xmlhttp.responseText==-1)
	  {   
		  document.getElementById("chatrequest").style.visibility='hidden';
  
	  }
	  
	  
    }
  };
xmlhttp.open("GET","CheckFlag2",true);
xmlhttp.send();


xmlhttp2.onreadystatechange=function()
{
if (xmlhttp2.readyState==4 && xmlhttp2.status==200)
  {
	  if(xmlhttp2.responseText!=-1)
	  {
		  var res = xmlhttp2.responseText;
		  document.getElementById("lb2").innerHTML="Chat Request From <br/>" + res;
		 
	  }
	  
  }
};


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
	
	
		<li ><a href="#" onclick="window.open('Help.html', 'newwindow', 'width=400, height=300'); return false;">Find Help</a></li>
		<li ><a href="LogoutServlet" >Logout</a></li>
		<li ><a href="Resetonnavigation?navval=3" >Settings </a></li>
		<li ><a href="Resetonnavigation?navval=2" >Customize </a></li>
		<li ><a href="Resetonnavigation?navval=1" >File Manager</a></li>
   		<li ><a href="ChatUserDisplayServlet" >Start Chat </a></li>
                
	</ul> 
</div> 
</div>
</header>

<div id = "dp">
<img src="<%="dp/"+id+".jpg" %>" height=200 width=120> 
</div >


<label class="lbl" id="chooseone" > Choose one of your AVAILABLE friends to initiate a chat </label>


<div id ="chatrequest" style="visibility:hidden;" >
<form method="get" >
<label class="lbl" id="lb2" > </label>
<button  onclick="Servlet:form.action='ProcessRequestAccept'" class="label  label-inverse" id="userid5" name="userid"   >Click to Chat</button>
<button  onclick="Servlet:form.action='ProcessRequestIgnore'" class="label  label-inverse" id="userid6" name="userid"  >Click to Ignore</button>
</form> 
</div>

<div id = "onlinelist">
  <ul  id="double">
   
    <% 
    ArrayList <UserPOJO> al=null;
    al=(ArrayList)request.getAttribute("onlineuser");
    	Iterator <UserPOJO> i = al.iterator(); 
		UserPOJO temp=null;
		while(i.hasNext())
		{
			temp=i.next();	
			if(temp.getUser_Id()!=id)
			{
	%>
	
	
	<form  method="get" >
	
	
		<li>
			
			<img src="<%="dp/"+temp.getUser_Id()+".jpg" %>" height=80 width=80>
     		 <h3><%=temp.getUser_Fname()+" "+temp.getUser_Lname()+"  ("+ temp.getUser_Nickname() +")"%></h3>
        
        <button  onclick="Servlet:form.action='RegisterRequest'" class="label  label-inverse" id="userid" name="userid2"   value="<%=""+temp.getUser_Id()%>">Click to Chat</button>
   </li>
    </form>
    
      
      <%}}%>

  </ul>
</div>




</body>
</html>


