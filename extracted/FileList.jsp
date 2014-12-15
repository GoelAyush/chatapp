<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.io.*" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Start A Chat</title>
<link href="Style.css" rel="stylesheet" type="text/css">
<link href="bootstrap.css" rel="stylesheet" type="text/css">
</head>

<body>
<%
HttpSession session2=request.getSession(false);
Integer id=((Integer)session2.getAttribute("id")); 
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

<%
int check=0;
try{

	Object ob=request.getAttribute("del");
	String temp=(String)ob.toString();
	check=Integer.parseInt(temp);
}catch(Exception e)
{
	
}
if(check==1)
{
%>
<label class="label label-inverse" id="deleted" > 1 File Deleted </label>
<script>
function f(){
	document.getElementById("deleted").style.display = 'none';
	};
	setTimeout(f, 2000);


</script>
<%} %>

<label class="label label-inverse" id="deletedownload" > Download/Delete Files </label>
<label class="label label-inverse" id="upload" > Upload File </label>

 <table id="filedisplay">

<%


File directory = new File("D:\\LiveChatFiles\\" + id);  
File[] files = directory.listFiles();  
Object ob= (Object)files;
request.setAttribute("FileArray",ob);
 if(files!=null)
{
	for (int index = 0; index < files.length; index++)  

{ 
	String Filepath=files[index].getName().toString();
	

   %> 
  
  <tr >
  
      <td><img src="FileLogo.png" height=50 width=50></td>
      <form method="get">
 	  <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      <td ><p><%= Filepath %></p> </td>
     <input type="hidden" name="url" value="<%=files[index].toString() %>"/>
      <td ><button class="btn btn-inverse" type="submit" onclick="Servlet:form.action='DownloadFileServlet'" value=<%=Filepath %> name="Download">Download</input></td>
      <td><button class="btn btn-inverse" type="submit"  onclick="Servlet:form.action='DeleteFileServlet'" value=<%= Filepath %> name="Delete">Delete</input></td>
</form>  
  </tr>
      <%
}  
}
 else
 {
	 %> <label class="label label-inverse" > No Files</label> <% 
 }
      %>
      </table>
  
<div class="fileupload fileupload-new" data-provides="fileupload" id="FileUpload">
<form  action="Upload.jsp"  method="post"  enctype="multipart/form-data">
<label class="lbl">Select File Max (10MB)</label> 
<input type="file" name="file1">
</br>
</br>

<input class="btn btn-inverse btn-large" type=submit value="Upload">
</form>
</div>

</body>
</html>


    