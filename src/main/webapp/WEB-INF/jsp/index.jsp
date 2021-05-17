<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 2020/12/20
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>sqBlog</title>
    <%@include file="BT.jsp" %>
    <style type="text/css">
        #jum {
            /*background-image: url("./img/bcg.jpg");*/
            /*background-repeat: no-repeat;*/
            /*background-size: 100% 100%;*/
            /*background-position: center center;*/
            background-color: RGB(117, 79, 174);
            /*height: ;*/
        }
    </style>
</head>
<body>
<div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">
    <%@include file="nav.jsp" %>
    <div class="jumbotron masthead" id="jum" style="padding: 2rem 2rem;">
        <div class="container" style="text-align: center; color: white;">
            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                 class="bi bi-suit-diamond" viewBox="0 0 16 16">
                <path d="M8.384 1.226a.463.463 0 0 0-.768 0l-4.56 6.468a.537.537 0 0 0 0 .612l4.56 6.469a.463.463 0 0 0 .768 0l4.56-6.469a.537.537 0 0 0 0-.612l-4.56-6.468zM6.848.613a1.39 1.39 0 0 1 2.304 0l4.56 6.468a1.61 1.61 0 0 1 0 1.838l-4.56 6.468a1.39 1.39 0 0 1-2.304 0L2.288 8.92a1.61 1.61 0 0 1 0-1.838L6.848.613z"/>
            </svg>
            <br/>
            <br/>
            <%--            <br/>--%>
            <%--            <br/>--%>
            <h1 class="display-4" style="font-size: 40px; font-family: Courier New;">The SQ Blog</h1>
            <p class="lead" style="font-family: 华文行楷;">I always rip out the last page of a book. Then it does not have
                to end. I hate endings.</p>
        </div>
    </div>
    <div class="row" style="margin-left: 0px; margin-right: 0px;">
        <%--      <%@include file="lf.jsp"%>--%>
        <div class="col-sm-4" style="margin-left: 0px; margin-right: 0px;">
            <div class="card text-center" style=" width: 300px;  margin-left: 50px;">
                <div class="card-header">
                    <a href="${pageContext.request.contextPath}/Album">Album</a>
                </div>
                <div class="card-body" style="height: 180px;">
                    <h5 class="card-title">相册</h5>
                    <p class="card-text">时光在不知不觉中流走,<br/>往事在星星念念中停留</p>
                    <%--                    <p class="card-text">记忆留存</p>--%>
                    <%--                    <a href="#" class="btn btn-primary">Go somewhere</a>--%>
                </div>
            </div>
        </div>
        <div class="col-sm-4" style="margin-left: 0px; margin-right: 0px;">

            <div class="card text-center" style=" width: 300px; margin-left: 50px;">
                <div class="card-header">
                    <a href="${pageContext.request.contextPath}/blogList">Blog</a>
                </div>
                <div class="card-body" style="height: 180px;">
                    <h5 class="card-title">博文</h5>
                    <p class="card-text">没有那么多过不去的事，只有一颗不够勇敢的心，最终使你脱颖而出的，不是天赋异禀，而是持之以恒。</p>
                    <%--                    <a href="#" class="btn btn-primary">Go somewhere</a>--%>
                </div>
            </div>
        </div>
        <div class="col-sm-4" style="margin-left: 0px; margin-right: 0px;">
            <div class="card text-center" style=" width: 300px; margin-left: 50px;">
                <div class="card-header">
                    <a href="${pageContext.request.contextPath}/messageBoard">Message</a>
                </div>
                <div class="card-body" style="height: 180px;">
                    <h5 class="card-title">留言板</h5>
                    <p class="card-text">走过，经过，尝过，还是平淡最美；听过，看过，想过，还是简单最好。</p>
                    <%--                    <a href="#" class="btn btn-primary">Go somewhere</a>--%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
