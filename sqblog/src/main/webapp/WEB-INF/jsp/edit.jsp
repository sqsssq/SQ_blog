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

    <%--    <script type="text/javascript">--%>
    <%--        $(function () {--%>
    <%--            // navAddClass('read_write');--%>
    <%--            md_edit = editormd("blog_mdedit", { //注意1：这里的就是上面的DIV的id属性值--%>
    <%--                placeholder: '  欢迎使用' + '${title}' + " 博客",--%>
    <%--                width: "90%",--%>
    <%--                height: 400,--%>
    <%--                syncScrolling: "single",--%>
    <%--                emoji: true,--%>
    <%--                path: "${pageContext.request.contextPath}/lib", //注意2：你的路径--%>
    <%--                saveHTMLToTextarea: true,--%>
    <%--                tocm: true, // Using [TOCM]--%>
    <%--                tex: true, // 开启科学公式TeX语言支持，默认关闭--%>
    <%--                flowChart: true, // 开启流程图支持，默认关闭--%>
    <%--                /* 上传图片配置 */--%>
    <%--                &lt;%&ndash;imageUpload: true,&ndash;%&gt;--%>
    <%--                &lt;%&ndash;imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],&ndash;%&gt;--%>
    <%--                &lt;%&ndash;imageUploadURL: "${proPath }/base/blog/upFile", //注意你后端的上传图片服务地址&ndash;%&gt;--%>
    <%--            });--%>
    <%--        });--%>
    <%--    </script>--%>
    <script type="text/javascript">
        var testEditor;
        $(function () {
            testEditor = editormd("test-editormd", {
                width: "100%",
                height: 440,
                syncScrolling: "single",
                path: "${pageContext.request.contextPath}/Editor/lib/", //依赖lib文件夹路径
                emoji: true,
                taskList: true,
                tocm: true,
                imageUpload: true,
                imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL: "imageUpload"		//上传图片控制器Mapping
            });
            $("#outButton").click(function () {
                // console.log(1);
                let title = $("#title").val();
                let information = $("#content").val();
                let summary = $("#summary").val();
                // console.log(title);
                // console.log(information);
                $.get("http://localhost:8080/sqblog_war_exploded/update", {
                    id: ${b.id},
                    title: title,
                    info: information,
                    summary: summary
                }, function (data) {
                    window.location.href = "${pageContext.request.contextPath}/blogInfo?id=${b.id}";
                })
            })

        });

    </script>

</head>
<body>
<div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">

    <%@include file="nav.jsp" %>
    <div class="row" style="margin-left: 0px; margin-right: 0px;">
        <%@include file="lf.jsp" %>
        <div class="col-sm-9" style="padding-left: 0px; margin-top: 10px; padding-right: 20px;">
            <!-- Editor容器... -->
            <div class="input-group mb-3">
                <input type="text" class="form-control" value="${b.title}" aria-label="Recipient's username"
                       aria-describedby="button-addon2" id="title">
                <input type="text" class="form-control" value="${b.summary}" aria-label="Recipient's username"
                       aria-describedby="button-addon2" id="summary">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="button" id="outButton">&nbsp; 发布 &nbsp;</button>
                </div>
            </div>

            <div id="test-editormd">
                <textarea id="content" name="content" style="display:none;">${b.information}</textarea>
            </div>


        </div>
    </div>
</div>
</body>
</html>
