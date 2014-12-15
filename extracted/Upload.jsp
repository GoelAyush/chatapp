<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>




<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Start A Chat</title>
<link href="Style.css" rel="stylesheet" type="text/css">
<link href="bootstrap.css" rel="stylesheet" type="text/css">
</head>

<body>

<label class="lbl" id="Wait" >Uploading File .... Please Wait </label>
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
	

		<li ><a href="#" onclick="window.open('tablet.jpg', 'newwindow', 'width=400, height=300'); return false;">Find Help</a></li>
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
HttpSession session2=request.getSession(false);
Integer id=((Integer)session2.getAttribute("id"));
if(id==null)
{
	response.sendRedirect("Login.jsp");
}
   File file ;
   int maxFileSize = 10000 * 1024;
   int maxMemSize = 10000 * 1024;
   String filePath = "D:\\LiveChatFiles\\"+id+"\\";
   

   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath + 
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath + 
            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
            %>
            <script>
            onload=function() {
            alert("Uploaded Successfully")
            window.location="FileList.jsp";
            }
            </script>
            <% 
            }
         }
         out.println("</body>");
         out.println("</html>");
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
      out.println("0");
   }
%>


</body>
</html>


