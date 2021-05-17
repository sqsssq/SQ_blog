<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 2020/10/21
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Modal -->

<script>
    function showFilename(file){
        $("#filename_label").html(file.name);
    }
</script>
<div class="modal fade" id="pic" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">上传图片</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="modal-body">
                    <form>
                        <%--                        <div class="form-group">--%>
                        <%--                            <label for="recipient-name" class="col-form-label">Recipient:</label>--%>
                        <%--                            <input type="text" class="form-control" id="recipient-name">--%>
                        <%--                        </div>--%>
                            <div class="input-group">
                                <div class="custom-file">
                                    <input onchange="showFilename(this.files[0])" type="file" class="custom-file-input" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04">
                                    <label id="filename_label" class="custom-file-label" for="inputGroupFile04">Choose file</label>
                                </div>
                            </div>

                            <div class="form-group">
                            <label for="message-text" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="message-text"></textarea>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">SQ's BLOG</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/Index">主页 <span
                        class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/Album">相册</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/blogList">博文</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/messageBoard">留言板</a>
            </li>
            <%--            <li class="nav-item">--%>
            <%--                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>--%>
            <%--            </li>--%>

            <%--            <li class="nav-item">--%>
            <%--                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>--%>
            <%--            </li>--%>
        </ul>
        <div class="dropdown" style="padding-right: 50px;">
            <a class="btn btn-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
<%--                <svg class="bd-placeholder-img mr-2 rounded" width="25" height="25" preserveAspectRatio="xMidYMid slice"--%>
<%--                     focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title>--%>
<%--                    <rect width="100%" height="100%" fill="${user == null ? 'none' : user.color}"/>--%>
<%--                </svg>--%>
    <c:if test="${ user != null }">
    <img class="bd-placeholder-img mr-2 rounded" width="32" height="32" src="${pageContext.request.contextPath}/photo/${user.head}"/>
    </c:if>
${ user == null ? "未登录" : user.username}
            </a>

            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink" style="min-width: 1em;">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/Login">登陆</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/Logout">注销</a>
                <c:if test="${ user.username == 'sq' }"><a class="dropdown-item"
                                                           href="${pageContext.request.contextPath}/Writer">创作</a></c:if>
                </div>
        </div>
    </div>
</nav>