

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration | TechBlog</title>


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
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 83%, 70% 100%, 33% 83%, 0 100%, 0 0);
            }
            body{
                background: no-repeat;
                
                background-image: url('img/reg_img.jpg');
                background-size: cover;
            }
        </style>
    </head>
    <body>


        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>




        <main >
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-5">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle-o"></span>
                            <p>Register Here</p>
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">


                                <div class="mb-3">
                                    <label  for="user_name" class="form-label">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" >

                                </div>


                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>


                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>


                                <div class="mb-3">
                                    <label for="gender" class="form-label">Select Gender</label>
                                    <br>
                                    <input type="radio"  id="gender_1" name="gender" value="Male">Male
                                    <input type="radio"  id="gender_2" name="gender" value="Female">Female
                                </div>

                                <div class="mb-3">
                                    <textarea name="about" class="form-control" placeholder="Enter Something About Yourself"></textarea>
                                </div>

                                <div class="mb-3 form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Term And Condition</label>
                                </div>

                                <div class="container text-center" id="loader" style="display:none">
                                    <span class="fa fa-refresh fa-4x fa-spin"></span>
                                    <h3>Please Wait....</h3>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </main>






        <script>
            $(document).ready(function () {

                console.log("loaded");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);
//                    

                    $("#submit-btn").hide();
                    $("#loader").show();
                    $.ajax({
                        url: 'RegisterServlet',
                        type: 'post',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#submit-btn").show();
                            $("#loader").hide();

                            if (data.trim() === "successfully inserted") {
                                swal({
                                    title: "Successfully Register",
                                    text: "We are redirecting to Log in page",
                                    icon: "success",

                                }).then((value) => {
                                    window.location = "Login.jsp";
                                });
                            } else {
                                swal({
                                    title: data,

                                });
                            }


                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            $("#submit-btn").show();
                            $("#loader").hide();


                            swal({
                                title: "Something went wrong",

                            });
                        },
                        processData: false,
                        contentType: false

                    });
//
                });
//
//
            });
        </script>
    </body>
</html>
