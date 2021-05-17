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
</head>
<body>
<%@include file="nav.jsp" %>
<div class="row" style="margin-left: 0px; margin-right: 0px;">
    <%@include file="lf.jsp" %>
    <div class="col-sm-9" style="padding-left: 0px; margin-top: 10px; padding-right: 20px;">
        <div class="list-group">
            <c:forEach items="${blogs}" var="item">
                <a href="${pageContext.request.contextPath}/blogInfo?id=${item.id}"
                   class="list-group-item list-group-item-action" style="margin-bottom: 5px;">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">${item.title}</h5>
                        <small>${item.time}</small>
                    </div>
                    <p class="mb-1">
                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor"
                             class="bi bi-bookmark-star-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zM8.16 4.1a.178.178 0 0 0-.32 0l-.634 1.285a.178.178 0 0 1-.134.098l-1.42.206a.178.178 0 0 0-.098.303L6.58 6.993c.042.041.061.1.051.158L6.39 8.565a.178.178 0 0 0 .258.187l1.27-.668a.178.178 0 0 1 .165 0l1.27.668a.178.178 0 0 0 .257-.187L9.368 7.15a.178.178 0 0 1 .05-.158l1.028-1.001a.178.178 0 0 0-.098-.303l-1.42-.206a.178.178 0 0 1-.134-.098L8.16 4.1z"/>
                        </svg>&nbsp;${item.summary}</p>
                        <%--                    <small>Donec id elit non mi porta.</small>--%>
                </a>
            </c:forEach>

        </div>

    </div>
</div>
</body>
</html>
