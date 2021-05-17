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
        $(function () {
            $("#commitBtn").click(function () {
                console.log(1);
                var data = $("#commit").val();
                var time = (new Date).format('yyyy-MM-dd hh:mm:ss');

                $.get('http://localhost:8080/sqblog_war_exploded/addMessage', {
                    info: data,
                    time: time,
                    userID: ${user.id}
                }, function (d) {
                    $("#tab").append('<div class="media text-muted pt-3">\n' +
                        '<img class="bd-placeholder-img mr-2 rounded" width="32" height="32" src="${pageContext.request.contextPath}/photo/${item.head}"/>\n'+
                        '    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">\n' +
                        '        <div class="d-flex justify-content-between align-items-center w-100">\n' +
                        '            <strong class="text-gray-dark">${user.username}</strong>\n' +
                        '                                       <div> ' + time + ' </div>\n' +
                        '        </div>\n' +
                        '        <span class="d-block" style="font-size: 15px; margin-top: 5px;">' + data + '</span>\n' +
                        '    </div>\n' +
                        '</div>');
                    $("#commit").val("");
                })
            });
        });
    </script>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="row" style="margin-left: 0px; margin-right: 0px;">
    <%@include file="lf.jsp" %>
    <div class="col-sm-9" style="padding-left: 0px; margin-top: 10px; padding-right: 20px;">
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="" aria-label="Recipient's username"
                   aria-describedby="button-addon2" id="commit">
            <div class="input-group-append">
                <button class="btn btn-success" type="button" id="commitBtn">留言</button>
            </div>
        </div>
        <div class="my-3 p-3 bg-white rounded shadow-sm" id="tab">
            <h6 class="border-bottom border-gray pb-2 mb-0">留言板</h6>
            <c:forEach items="${messages}" var="item">
                <div class="media text-muted pt-3">
                        <%--                    <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32"--%>
                        <%--                         xmlns="http://www.w3.org/2000/svg"--%>
                        <%--                         preserveAspectRatio="xMidYMid slice" focusable="false" role="img"--%>
                        <%--                         aria-label="Placeholder: 32x32">--%>

                        <%--                        <rect width="100%" height="100%" fill="${item.color}"/>--%>
                        <%--                    </svg>--%>
                    <img class="bd-placeholder-img mr-2 rounded" width="32" height="32" src="${pageContext.request.contextPath}/photo/${item.head}"/>

                    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <strong class="text-gray-dark">${item.username}</strong>
                            <div>${item.messageTime}</div>

                        </div>
                        <span class="d-block" style="font-size: 15px; margin-top: 5px;">${item.information}</span>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</body>
</html>
