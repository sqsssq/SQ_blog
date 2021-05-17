<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 2020/10/21
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-sm-3" style="padding-left: 20px; padding-right: 5px;">
    <%--    <div class="list-group" id="lf">--%>
    <%--        <a href="${pageContext.request.contextPath}/Index" class="list-group-item list-group-item-action">--%>
    <%--            首页--%>
    <%--        </a>--%>
    <%--        <a href="${pageContext.request.contextPath}/Login" class="list-group-item list-group-item-action">登陆</a>--%>
    <%--        <a href="${pageContext.request.contextPath}/Register" class="list-group-item list-group-item-action">注册</a>--%>
    <%--        <a href="${pageContext.request.contextPath}/QR" class="list-group-item list-group-item-action">二维码生成</a>--%>
    <%--&lt;%&ndash;        <a href="#" class="list-group-item list-group-item-action disabled" tabindex="-1" aria-disabled="true">Vestibulum at eros</a>&ndash;%&gt;--%>
    <%--        <a href="${pageContext.request.contextPath}/admin/UserList" class="list-group-item list-group-item-action">用户列表</a>--%>
    <%--        <a href="${pageContext.request.contextPath}/admin/userInfo" class="list-group-item list-group-item-action">用户1</a>--%>
    <%--    </div>--%>


    <div class="card" style="margin-top: 10px;">
        <div class="card-header">
            <div style="float: left">
                <%--                <div>--%>
                <img src="./img/head.jpg" style="width:50px; height:50px; border-radius:50%; ">
            </div>
            <div>
                <p style="font-weight: bolder; margin-bottom: 5px;">&nbsp;&nbsp;&nbsp;Brant</p>
                <p style="font-size: 14px; margin-bottom: 0px;">&nbsp;&nbsp;&nbsp;&nbsp;码龄：2年</p>
            </div>
        </div>
        <div class="card-body">
            <%--            <h5 class="card-title">Special title treatment</h5>--%>
            <p class="card-text">年龄：21 &nbsp;&nbsp;&nbsp;生日：1999年12月7日</p>

            <p class="card-text">学校：浙江财经大学</p>
            <p class="card-text">年级：大三</p>
            <p class="card-text" id="time">
                <script>time1();</script>
            </p>
            <%--            <a href="#" class="btn btn-primary">Go somewhere</a>--%>
        </div>
    </div>
    <div class="card" style="margin-top: 10px;">
        <div class="card-body"
             style="padding-left: 10px; padding-top: 10px; padding-right: 10px; padding-bottom: 10px;">
<%--            <div class="input-group" style="margin-bottom: 0;">--%>
                <form action="${pageContext.request.contextPath}/Search" class="input-group" style="margin-bottom: 0;">
                    <input type="text" class="form-control" placeholder="博文搜索" aria-label="博文搜索"
                           aria-describedby="button-addon2" name="likeName">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit" id="button-addon2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                            <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                        </svg></button>
                    </div>
                </form>
<%--            </div>--%>
        </div>
    </div>
</div>