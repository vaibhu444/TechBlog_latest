<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.postdao"%>

<div class="row">
    <%
        User user=(User)session.getAttribute("currentUser");
        postdao d = new postdao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getPostByCatId(cid);
        }

        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center '>No post Yet</h3>");
        }
        for (post p1 : posts) {

    %>

    <div class="col-md-6 mt-2">

        <div class="card">
            <img class="card-img-top" src="blog_pics/<%=p1.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%= p1.getpTitle()%></b>
                <p><%= p1.getpContent()%></p>

            </div>
            <div class="card-footer text-center primary-background">
                <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>

                <a href="#!" onclick="doLike(<%= p1.getPid()%>, <%= user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span  class="like-counter"><%=ld.countLikeOnPost(p1.getPid())%></span></a>
                <a href="blog_read_more.jsp?post_id=<%= p1.getPid()%>" class="btn btn-outline-light btn-sm"><span>Read More</span></a>
                <!--<a href="#" class="btn btn-outline-light btn-sm del_p"><span>Delete</span></a>-->
                <!--<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>-->
            </div>

        </div>

    </div>


    <%

        }
    %>

</div>

