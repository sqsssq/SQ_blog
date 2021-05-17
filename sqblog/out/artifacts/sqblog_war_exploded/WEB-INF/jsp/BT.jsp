<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 2020/10/21
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
      integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Editor/css/editormd.min.css">
<script src="${pageContext.request.contextPath}/Editor/js/editormd.min.js"></script>
<script src="${pageContext.request.contextPath}/Editor/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/Editor/lib/marked.min.js"></script>
<script src="${pageContext.request.contextPath}/Editor/lib/prettify.min.js"></script>
<script src="${pageContext.request.contextPath}/Editor/lib/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/Editor/lib/underscore.min.js"></script>
<script src="${pageContext.request.contextPath}/Editor/lib/sequence-diagram.min.js"></script>
<script src="${pageContext.request.contextPath}/Editor/lib/flowchart.min.js"></script>
<script src="${pageContext.request.contextPath}/Editor/lib/jquery.flowchart.min.js"></script>

<style>
    body {
        height: 100%;
        /*background-image: url("./img/bcg2.jpg");*/
        /*background-repeat: no-repeat;*/
        /*background-size: 100% 100%;*/
        /*background-position: center center;*/
        background-color: RGB(234, 242, 232);
    }
</style>
<script>


    Date.prototype.format =function(format)
    {
        var o = {
            "M+" : this.getMonth()+1, //month
            "d+" : this.getDate(), //day
            "h+" : this.getHours(), //hour
            "m+" : this.getMinutes(), //minute
            "s+" : this.getSeconds(), //second
            "q+" : Math.floor((this.getMonth()+3)/3), //quarter
            "S" : this.getMilliseconds() //millisecond
        }
        if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
            (this.getFullYear()+"").substr(4- RegExp.$1.length));
        for(var k in o)if(new RegExp("("+ k +")").test(format))
            format = format.replace(RegExp.$1,
                RegExp.$1.length==1? o[k] :
                    ("00"+ o[k]).substr((""+ o[k]).length));
        return format;
    }

    //获取时间函数
    function time1() {
        var today = new Date();
        var year = today.getFullYear();
        var month = today.getMonth() + 1;
        var day = today.getDate();
        var hour = today.getHours();
        var minute = today.getMinutes();
        var second = today.getSeconds();
        // console.log(today.getDate());

        minute = checkTime(minute);
        second = checkTime(second);

        document.getElementById("time").innerHTML =
            "时间：" + year + "年" + month + "月" + day + "日 " + hour + ":" + minute + ":" + second;
            // today.format("yyyy-MM-dd hh:mm:ss")
        t = setTimeout("time1()", 500);
    }

    //调整时间格式
    function checkTime(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }
</script>