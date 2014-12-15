<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<link href="Style.css" rel="stylesheet" type="text/css">
<link href="bootstrap.css" rel="stylesheet" type="text/css">
<script>
setInterval ( loadXMLDoc , 6000  );
function playaudio()
{
	 	
         var audioEl = document.getElementById("audioTag");
         audioEl.load();
         audioEl.play();
}
function pushmessage()
{
	
	varuid2=document.getElementById("user2id").value;
	var msg=document.getElementById("chatboxinput").value;
	var xmlhttp3;
	xmlhttp3=new XMLHttpRequest();
	xmlhttp3.onreadystatechange=function()
	  {
	  if (xmlhttp3.readyState==4 && xmlhttp3.status==200)
	    {
		  if(xmlhttp3.responseText!=null)
		  {	
			  
			 document.getElementById("box1").innerHTML=xmlhttp3.responseText;
			 var textarea = document.getElementById('box1');
			 textarea.scrollTop = textarea.scrollHeight;
			 document.getElementById("chatboxinput").value="";
		  }
	    }
	  }
	xmlhttp3.open("GET","PushMessage?text="+msg+"&uid2="+varuid2,true);
	xmlhttp3.send();
		
	
}






function loadXMLDoc()
{
var xmlhttp;
var xmlhttp2;
xmlhttp=new XMLHttpRequest();
xmlhttp2=new XMLHttpRequest();
varuid2=document.getElementById("user2id").value;

xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	  if(xmlhttp.responseText==1)
	  {	
		  xmlhttp2.open("GET","RetrieveText?id2="+varuid2,true);
		  xmlhttp2.send();
	  }
	  else if(xmlhttp.responseText==-1)
	  {	
		 alert("Chat Session has been dissolved by The other User");
		 window.location="ChatUserDisplayServlet";
	  }
	  
	
    }
  };
xmlhttp.open("GET","CheckFlag?id2="+varuid2,true);
xmlhttp.send();
xmlhttp2.onreadystatechange=function()
{
if (xmlhttp.readyState==4 && xmlhttp.status==200)
  {
	playaudio();
 	document.getElementById("box2").innerHTML=xmlhttp2.responseText;  
 	var textarea = document.getElementById('box2');
 	textarea.scrollTop = textarea.scrollHeight;
  }
}





}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
HttpSession session2=request.getSession(false);
Integer id=((Integer)session2.getAttribute("id")); 
if(id==null)
{
	response.sendRedirect("Login.jsp");
}
%>


<body>


<header>
 
 <input type="hidden" id="user2id" value="<%=request.getAttribute("user2id") %>"></input>
 
 <div id="audiofile">
    <audio id="audioTag" controls>
            <source src="newmsgaudio.mp3">
    </audio>
</div>

  <img src="logo.png" width="188" height="91" alt="logo">
 <div id="social">
<img src="twitter.png" width="30" onclick="window.open('http://www.twitter.com', 'newwindow', 'width=400, height=300'); return false;" height="30" >
<img src="gplus.png" width="30" onclick="window.open('http://www.plus.google.com', 'newwindow', 'width=400, height=300'); return false;" height="30" >
<img src="fb.jpg"  width="30" onclick="window.open('http://www.facebook.com', 'newwindow', 'width=400, height=300'); return false;" height="30" >

</div>

  <div id="orangebar">
  
<div id = "headernav">
	<ul>
           
	<li ><a href="#" onclick="window.open('tablet.jpg', 'newwindow', 'width=400, height=300'); return false;">Find Help</a></li>
		<li ><a href="LogoutServlet" >Logout</a></li>
        
	</ul> 
</div> 

</div>
</header>

  <div id="dissolve">
<form action="DissolveChat">
<input type="submit"  class="btn btn-block  btn-inverse" id="userid8" value="Dissolve Chat" name="userid8" ></input>
<input type="hidden" name="uid2" value=<%=request.getAttribute("user2id") %>></input>
</form>
</div>

  <div id = "chatpanel">
  <img id="usr1" src="<%="dp/"+id+".jpg"%>" height=50 width=50>
  <textarea name="chatbox" id="box1" readonly rows="6"></textarea>
  <textarea name="chatboxinput" id="chatboxinput" rows="2"></textarea>
  <input type="button" onclick="pushmessage();"; class="btn btn-large  btn-inverse" id="userid7" value="Send" name="userid7" ></input>
  <textarea  name="chatbox1" id="box2" rows="12" readonly ></textarea>
  <img id="usr2" src="<%="dp/"+request.getAttribute("user2id")+".jpg" %>" height=50 width=50>
  </div>
  


<div id = "chatbackground">
<img src="back2.jpg" width="60%" height="60%" >  </img>
</div >


</body>


</html>