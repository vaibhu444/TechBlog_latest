<%-- 
    Document   : error_page
    Created on : 20-Mar-2022, 7:21:31 pm
    Author     : Vaibhav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry !Something went Wrong</title>
        
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystayle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        
        <div class="container text-center">
            <img src="img/error.png" alt="error" class="img-fluid"/>
            <h3 class="display-3">Sorry ! Something went wrong</h3>
            <a href="index.jsp" class="btn primary-background text-white mt-2">Home</a>
            <%--<%= %>--%>
        </div>
        
        
    </body>
</html>
