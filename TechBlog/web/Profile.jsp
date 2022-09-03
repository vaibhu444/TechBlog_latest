
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.postdao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("Login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile | TechBlog</title>


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
            body{
                background: url(img/bg.png);
                background-size:cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <!--navbar-starting-->
        <nav class="navbar navbar-expand-lg navbar-dark light-background">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><span class="fa fa-certificate"></span>TechBlog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
<!--                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-child"></span>Vaibhav</a>
                        </li>-->

<!--                        <li class="nav-item dropdown">
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
                        <li class="nav-item">
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



        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");

            }
        %>


        <!--main body of the page-->

        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first column-->
                    <div class="col-md-4">
                        <div class="list-group">
                            <a href="#" onclick="getPost(0,this)" class=" c-link list-group-item list-group-item-action active" aria-current="true">
                                All Posts
                            </a>

                            <!--categories-->
                            <%
                                postdao d = new postdao(ConnectionProvider.getConnection());
                                ArrayList<categories> list1 = d.getAllCategories();
                                for (categories cc : list1) {

                            %>
                            <a href="#" onclick="getPost(<%=cc.getCid() %>,this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>

                            <%

                                }


                            %>

                        </div>
                    </div>

                    <!--second column-->
                    <div class="col-md-8" >
                        <!--post-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading..</h3>
                        </div>
                        
                        <div class="container-fluid" id="post-container">
                            
                        </div>


                    </div>


                </div>
            </div>
        </main>



        <!--end of main body of the page-->






        <!--modal-start-->


        <!--         Button trigger modal 
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#profile-modal">
                    Launch demo modal
                </button>-->

        <!-- profile Modal -->
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


                            <div class="form-group mt-3">
                                <input name="pTitle" type="text" placeholder="Enter Your title" class="form-control" />
                            </div>
                            <div class="form-group mt-3">
                                <textarea  name="pContent" oninput="myFun()" id="txt_finder" class="form-control" placeholder="Enter your Content" style="height:300px"></textarea>
                            </div>
                            <div class="form-group mt-3">
                                <textarea name="pCode" class="form-control" placeholder="Enter your Code(if any)" style="height:300px"></textarea>
                            </div>
                            <div class="form-group mt-3">
                                <label>Select Your Pic:</label><br>
                                <input name="pic" type="file">
                            </div>
                            <div class="container text-center mt-3">
                                <button type="submit" class="btn btn-outline-primary">post</button>
                            </div>

                        </form>




                    </div>

                </div>
            </div>
        </div>
                                
        <!--text finding entered by user-->
        <script>
            function text_finder_fun(keyword){
                if(keyword){
                    var content=document.getElementById("txt_finder").value;
//                    console.log("content"+content);
                    var search_txt=new RegExp(keyword,"ig");//i mean case insensitive and g mean global search
                    var matches=content.match(search_txt);
//                    console.log(matches,keyword);
                    if(matches){                        
                        swal("use of violent word"," ");                        
                        document.getElementById("txt_finder").value=" "
                                        
                        
                    }
                    
                }
            }
            function myFun(){
                
                let txt=["go to hell","hell india"]
                txt.forEach((curEle)=>{
                    text_finder_fun(curEle);
                });
                
            }
         </script>

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

        <!--loading post using ajax-->
        <script>
            
            function getPost(catId,temp){
                $('.c-link').removeClass('active')
                
                 $.ajax({
                    url:"load_post.jsp",
                    data:{cid:catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        
                        $("#post-container").html(data);
                        $(temp).addClass('active')
                    }
                })
            }
            
            $(document).ready(function(e){
                let allPostRef=$('.c-link')[0]
               getPost(0,allPostRef)
            })
        </script>

    </body>
</html>
