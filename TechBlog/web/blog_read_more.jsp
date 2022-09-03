<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.categories"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.postdao"%>
<%@page import="com.tech.blog.entities.User"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("Login.jsp");
    }

%>

<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    postdao d = new postdao(ConnectionProvider.getConnection());
    post p1 = d.getPostById(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page errorPage="error_page.jsp" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p1.getpTitle()%></title>
        <!--javascrpt-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script><!-- comment -->
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystayle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }

            .post-date{
                font-style: italic;
                font-weight: bold;

            }
            .post-user-info{
                font-size: 20px;
                font-weight: 300;
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px; 
            }

            body{
                background: url(img/bg.png);
                background-size:cover;
                background-attachment: fixed;
            }

            
        </style>

        </head>



<body>




    <!--navbar-starting-->
    <nav class="navbar navbar-expand-lg navbar-dark ">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-certificate"></span>TechBlog</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
<!--                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="Profile.jsp"><span class="fa fa-child"></span>Vaibhav</a>
                    </li>-->

<!--                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span>Category
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Programming knowledge</a></li>
                            <li><a class="dropdown-item" href="#">Project implementation</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Data Structure</a></li>
                        </ul>
                    </li>-->
                    <li class="nav-item">
                        <a class="nav-link" href="Contact.jsp"><span class="fa fa-address-book-o"></span>Contact</a>
                    </li>



                    <li class="nav-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-asterisk" ></span>Do post</a>
                    </li>

                </ul>


                <ul class="navbar-nav mr-right">
                    <li class="nl̥av-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user-circle-o"></span><%=user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Log Out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!--navbar-ending-->



    <!--main content of body-->
    <div class="container">
        <div class="row my-4">
            <div class="col-md-8 offset-md-2" >
                <div class="card">
                    <div class="card-header primary-background text-white">
                        <h4 class="post-title"><%= p1.getpTitle()%></h4>
                    </div>

                    <div class="card-body">

                        <img class="card-img-top my-2" src="blog_pics/<%=p1.getpPic()%>" alt="Card image cap">

                        <div class="row my-3 row-user">
                            <div class="col-md-8">

                                <%
                                    UserDao ud = new UserDao(ConnectionProvider.getConnection());
                                %>
                                <p class="post-user-info"> <a href="#" ><%= ud.getUserByUserId(p1.getUserId()).getName()%></a> has posted </p>
                            </div>
                            <div class="col-md-4">
                                <p class="post-date"> <%= DateFormat.getDateTimeInstance().format(p1.getpDate())%> </p>
                            </div>
                        </div>


                        <p class="post-content"><%=p1.getpContent()%></p>

                        <br>
                        <br>
                        <div class="post-code">
                            <pre><%= p1.getpCode()%></pre>
                        </div>

                    </div>
                    <div class="card-footer primary-background">

                        <%
                            LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                        %>

                        <a href="#!" onclick="doLike(<%= p1.getPid()%>, <%= user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p1.getPid())%></span></a>
<!--                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>-->
                        
                    </div>
                    
                        
                        
                        
                        

                </div>
            </div>
        </div>
    </div>
    <!--end of main content body-->








    <!--modal-start-->




    <!-- Modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header primary-background text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <img src="pics/<%=user.getProfile()%>" alt="default pic" class="img-fluid" style="border-radius: 50%; max-width:150px"/>
                        <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>


                        <!--details-->
                        <div id="profile-details">
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID</th>
                                        <td><%=user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Name</th>
                                        <td><%=user.getName()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender</th>
                                        <td><%=user.getGender()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">About</th>
                                        <td><%=user.getAbout()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Registered Date</th>
                                        <td><%=user.getDateTime().toString()%></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>


                        <!--profile-edit-->

                        <div id="profile-edit" style="display: none">

                            <h3>Please Edit Carefully</h3>
                            <form action="EditServlet" Method="POST" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>ID</td>
                                        <td><%=user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"/></td>
                                    </tr>
                                    <tr>
                                        <td>Name</td>
                                        <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"/></td>
                                    </tr>
                                    <tr>
                                        <td>Password</td>
                                        <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"/></td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td><%= user.getGender().toUpperCase()%></td>
                                    </tr>
                                    <tr>
                                        <td>About</td>
                                        <td><textarea rows="4" class="form-control" name="user_about"><%= user.getAbout()%></textarea></td>
                                    </tr>
                                    <tr>
                                        <td>New Profile Pic:</td>
                                        <td><input type="file" name="image" class="form-control"</td>
                                    </tr>
                                </table>

                                <div class="container">
                                    <button class="btn btn-outline-primary" type="submit">Save</button>
                                </div>
                            </form>


                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>


    <!--modal-end-->


    <!--post modal-->

    <!-- Button trigger modal -->


    <!-- Modal -->
    <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide the Blog Details:</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="add-post-form" action="addPostServlet" method="post">


                        <div class="form-group">

                            <select class="form-control" name="cid">
                                <option selected disabled>---Select Category---</option>
                                <%
                                    postdao ps = new postdao(ConnectionProvider.getConnection());
                                    ArrayList<categories> list = ps.getAllCategories();
                                    for (categories c : list) {
                                        System.out.println("c");
                                %>


                                <option value="<%=c.getCid()%>"><%=c.getName()%></option>


                                <%
                                    }
                                %>
                            </select>

                        </div>


                        <div class="form-group">
                            <input name="pTitle" type="text" placeholder="Enter Your title" class="form-control" />
                        </div>
                        <div class="form-group">
                            <textarea name="pContent" class="form-control" placeholder="Enter your Content" style="height:300px"></textarea>
                        </div>
                        <div class="form-group">
                            <textarea name="pCode" class="form-control" placeholder="Enter your Code(if any)" style="height:300px"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Select Your Pic:</label><br>
                            <input name="pic" type="file">
                        </div>
                        <div class="container text-center">
                            <button type="submit" class="btn-outline-primary">post</button>
                        </div>

                    </form>




                </div>

            </div>
        </div>
    </div>

    <!--post modal end-->

    <script>

        $(document).ready(function () {
            let editStatus = false;
            $('#edit-profile-button').click(function () {
                if (editStatus === false) {
                    $('#profile-details').hide();

                    $('#profile-edit').show();

                    $(this).text("Back");
                    editStatus = true;
                } else {
                    $('#profile-details').show();

                    $('#profile-edit').hide();

                    $(this).text("Edit");
                    editStatus = false;
                }

            })
        })
    </script>

    <!--now add post js-->
    <script>
        $(document).ready(function (e) {
            $("#add-post-form").on("submit", function (event) {
                event.preventDefault();//synchronise stop karva mate chhe
                console.log("you have clicked")
                let form = new FormData(this);

                //                 now requesting to server
                $.ajax({
                    url: "AddPostServlet",
                    type: 'post',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        //success
                        console.log(data);
                        if (data.trim() == 'done') {
                            swal("Good job!", "saved successfully", "success");
                        } else {
                            swal("Error!!", "Something went wrong", "error");

                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //error
                        swal("Error!!", "Something went wrong", "error");

                    },
                    processData: false,
                    contentType: false
                })
            })
        })
    </script>


</body>
</html>
