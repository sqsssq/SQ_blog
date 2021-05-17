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
    <script type="text/javascript">
        var testEditor;
        $(function () {
            Date.prototype.format = function (format) {
                var o = {
                    "M+": this.getMonth() + 1, //month
                    "d+": this.getDate(), //day
                    "h+": this.getHours(), //hour
                    "m+": this.getMinutes(), //minute
                    "s+": this.getSeconds(), //second
                    "q+": Math.floor((this.getMonth() + 3) / 3), //quarter
                    "S": this.getMilliseconds() //millisecond
                }
                if (/(y+)/.test(format)) format = format.replace(RegExp.$1,
                    (this.getFullYear() + "").substr(4 - RegExp.$1.length));
                for (var k in o) if (new RegExp("(" + k + ")").test(format))
                    format = format.replace(RegExp.$1,
                        RegExp.$1.length == 1 ? o[k] :
                            ("00" + o[k]).substr(("" + o[k]).length));
                return format;
            }

            $("#commitBtn").click(function () {
                console.log(1);
                var data = $("#commit").val();
                var time = (new Date).format('yyyy-MM-dd hh:mm:ss');

                $.get('http://localhost:8080/sqblog_war_exploded/addBlogMessage', {
                    info: data,
                    time: time,
                    userID: ${user.id},
                    blogID: ${b.id}
                }, function () {
                    $("#tab").append('<div class="media text-muted pt-3">\n' +
                        '<img class="bd-placeholder-img mr-2 rounded" width="32" height="32" src="${pageContext.request.contextPath}/photo/${item.head}"/>\n' +
                        '                        <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">\n' +
                        '                            <strong class="d-block text-gray-dark">${user.username}</strong>\n' +
                        '                            ' + data + '\n' +
                        '                        </p>\n' +
                        '                    </div>')
                    $("#commit").val("");
                });
            });

            $("#edit").click(function () {
               window.location.href = "${pageContext.request.contextPath}/editor?id=${b.id}"
            });
            $("#yes").click(function () {
                window.location.href = "${pageContext.request.contextPath}/deleteBlog?id=${b.id}"
            });

            testEditor = editormd.markdownToHTML("doc-content", {//注意：这里是上面DIV的id
                htmlDecode: "style,script,iframe",
                emoji: true,
                taskList: true,
                tex: true, // 默认不解析
                flowChart: true, // 默认不解析
                sequenceDiagram: true, // 默认不解析
                codeFold: true
            });

        });
    </script>
</head>
<body>
<%@include file="nav.jsp" %>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">确定删除</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                确定要删除&nbsp;<span style="color: red;">${b.title}</span>&nbsp;吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">No&nbsp;</button>
                <button type="button" class="btn btn-primary" id="yes">Yes</button>
            </div>
        </div>
    </div>
</div>
<div class="row" style="margin-left: 0px; margin-right: 0px;">
    <%@include file="lf.jsp" %>
    <div class="col-sm-9" style="padding-left: 0px; margin-top: 10px; padding-right: 20px;">
        <div class="card">
            <div class="card-body">
                <div id="doc-content">
                    <h1>${b.title}
                        <c:if test="${user.username == 'sq'}">
                            <button id="edit" type="button" class="btn btn-outline-success">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-box-arrow-up-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                          d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                    <path fill-rule="evenodd"
                                          d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
                                </svg>
                            </button>
                            <%--                            &nbsp;--%>
                            <button type="button" class="btn btn-outline-danger"  data-toggle="modal" data-target="#exampleModal">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-trash" viewBox="0 0 16 16">
                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                    <path fill-rule="evenodd"
                                          d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                </svg>
                            </button>
                        </c:if>
                    </h1>
                    <textarea style="display: none;">${b.information}</textarea>
                </div>
                <%--                <div class="input-group mb-3" style="width: 600px; margin: 0 auto;">--%>
                <%--&lt;%&ndash;                    <input type="text" class="form-control" placeholder="Recipient's username"&ndash;%&gt;--%>
                <%--&lt;%&ndash;                           aria-label="Recipient's username" aria-describedby="button-addon2">&ndash;%&gt;--%>
                <%--&lt;%&ndash;                    <div class="input-group-append">&ndash;%&gt;--%>
                <%--&lt;%&ndash;                        <button class="btn btn-outline-success" type="button" id="commit">评论</button>&ndash;%&gt;--%>
                <%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
                <%--                    <textarea cols="100" id="commit"></textarea>--%>
                <%--    <br>--%>
                <%--    <button type="button" class="btn btn-success">评论</button>--%>
                <%--                </div>--%>
                <div class="input-group mb-3" style="width: 700px; margin: 0 auto;">
                    <input id="commit" type="text" class="form-control" placeholder="" aria-label="Recipient's username"
                           aria-describedby="button-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="commitBtn">评论</button>
                    </div>
                </div>
                <div class="my-3 p-3 bg-white rounded shadow-sm" id="tab">
                    <h6 class="border-bottom border-gray pb-2 mb-0">评论</h6>

                    <c:forEach items="${blogMessages}" var="item">
                        <div class="media text-muted pt-3">
<%--                            <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32"--%>
<%--                                 xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice"--%>
<%--                                 focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title>--%>
<%--                                <rect width="100%" height="100%" fill="${item.color}"/>--%>
<%--                            </svg>--%>
                            <img class="bd-placeholder-img mr-2 rounded" width="32" height="32" src="${pageContext.request.contextPath}/photo/${item.head}"/>

                            <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                                <strong class="d-block text-gray-dark">${item.username}</strong>
                                    ${item.information}
                            </p>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>

    </div>
</div>
</body>
</html>
