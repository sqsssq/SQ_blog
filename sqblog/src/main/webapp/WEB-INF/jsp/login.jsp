<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 2020/12/26
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>sqBlog</title>
    <%@include file="BT.jsp" %>

    <style>

        .custom-file-label::after {
            content: "头像";
        }

        body {
            background-image: url("img/bcg2.jpg");
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-position: center center;
        }
    </style>
    <script>
        function showFilename2(file) {
            $("#filename_label2").html(file.name);
        }
    </script>
</head>
<body>
<div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">

    <%@include file="nav.jsp" %>
    <div class="row" style="margin-left: 0px; margin-right: 0px;opacity: 0.8;">
        <%--        <%@include file="lf.jsp" %>--%>
        <div class="col-sm-80" style="margin-left: 300px; margin-top: 50px; padding-right: 20px;">
            <div class="card">
                <div class="card-body">
                    <%--                登陆表单--%>
                    <div class="row row-col-2">
                        <div class="col" style="border-right: 1px solid gray;">
                            <form method="post" action="LoginAction">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">用户名</span>
                                    </div>
                                    <input type="text" class="form-control" value="${wrongname}"
                                           aria-describedby="basic-addon1" name="username">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">密码&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    </div>
                                    <input type="password" class="form-control" aria-describedby="basic-addon1"
                                           name="password">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">验证码</span>
                                    </div>

                                    <div class="input-group-prepend">
                                        <%--                                    <span class="input-group-text">验证码</span>--%>
                                        <img id="codeImg" src="${pageContext.request.contextPath}/Code">
                                    </div>
                                    <input type="text" class="form-control" aria-describedby="basic-addon1"
                                           name="tcode">
                                </div>
                                <div>${info}</div>

                                <div style="text-align: center;">
                                    <button class="btn btn-primary">登陆</button>
                                </div>
                            </form>

                        </div>
                        <div class="col">
                            <form method="post" action="RegisterAction" enctype="multipart/form-data">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">用户名</span>
                                    </div>
                                    <input type="text" class="form-control" value="${wrongname}"
                                           aria-describedby="basic-addon1" name="regUsername">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">密码&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    </div>
                                    <input type="password" class="form-control" aria-describedby="basic-addon1"
                                           name="regPassword">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">邮箱&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    </div>

                                    <input type="text" class="form-control" aria-describedby="basic-addon1" name="regEmail">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="custom-file">
                                        <input onchange="showFilename2(this.files[0])" type="file" class="custom-file-input"
                                               id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" name="photo"
                                               accept="image/jpeg">
                                        <label id="filename_label2" class="custom-file-label" for="inputGroupFile04">Choose
                                            file</label>
                                    </div>
                                </div>
                                <div>${infox}</div>
<%--                                <br>--%>
                                <div style="text-align: center;">
                                    <button class="btn btn-primary">注册</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
