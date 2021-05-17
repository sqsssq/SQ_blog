<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 2020/12/29
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>sqBlog</title>
    <%@include file="BT.jsp" %>
    <style>
        .jumbotron {
            padding-top: 3rem;
            padding-bottom: 3rem;
            margin-bottom: 0;
            background-color: #fff;
        }

        @media (min-width: 768px) {
            .jumbotron {
                padding-top: 6rem;
                padding-bottom: 6rem;
            }
        }

        .jumbotron p:last-child {
            margin-bottom: 0;
        }

        .jumbotron h1 {
            font-weight: 300;
        }

        .jumbotron .container {
            max-width: 40rem;
        }

        footer {
            padding-top: 3rem;
            padding-bottom: 3rem;
        }

        footer p {
            margin-bottom: .25rem;
        }

        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
</head>
<body>
<div class="modal fade" id="pic" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">上传图片</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="addAlbum" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="modal-body">
                        <div class="input-group">
                            <div class="custom-file">
                                <input onchange="showFilename(this.files[0])" type="file" class="custom-file-input"
                                       id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" name="filename"
                                       accept="image/jpeg">
                                <label id="filename_label" class="custom-file-label" for="inputGroupFile04">Choose
                                    file</label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Message:</label>
                            <input type="text" class="form-control" id="message-text" name="infox">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="nav.jsp" %>
<!-- Modal -->
<div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">
    <br>
    <c:if test="${ user.username == 'sq' }">
        <button type="button" class="btn btn-outline-primary" style="margin-left: calc(50% - 48px);" data-toggle="modal"
                data-target="#pic">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder-plus"
                 viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                      d="M9.828 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91H9v1H2.826a2 2 0 0 1-1.991-1.819l-.637-7a1.99 1.99 0 0 1 .342-1.31L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3h3.982a2 2 0 0 1 1.992 2.181L15.546 8H14.54l.265-2.91A1 1 0 0 0 13.81 4H9.828zm-2.95-1.707L7.587 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672a1 1 0 0 1 .707.293z"/>
                <path fill-rule="evenodd"
                      d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
            </svg>
            添加相片
        </button>
        <br>
    </c:if>
    <div class="row  row-cols-4" style="margin-left: 0px; margin-right: 0px;">

        <c:forEach items="${albums}" var="item">
        <div class="col" style="padding: 5px;">
            <div class="card shadow-sm" style="margin-bottom: 5px;">
                <img src="${pageContext.request.contextPath}/picture/${item.picture}" width="100%" height="225"
                     class="rounded"
                     alt="...">
                <div class="card-body">
                    <p class="card-text">${item.information}</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <small>${item.time}</small>

                        <c:if test="${ user.username == 'sq' }">
                            <small class="text-muted">

                                <a href="${pageContext.request.contextPath}/deleteAlbum?id=${item.id}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-trash" viewBox="0 0 16 16">
                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                        <path fill-rule="evenodd"
                                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                    </svg>
                                </a>
                            </small>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>

</div>
</body>
</html>
