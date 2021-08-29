<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2021/8/15
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript"></script>
</head>
<style>
    /*#tab{*/
    /*    width: 80%;*/


    /*}*/
    td,th{
        text-align: center;
    }

</style>

<body>
<div class="container">
<h1 align="center">学生管理系统</h1>

    <div style="float: left">
        <form class="form-inline" action="${pageContext.request.contextPath}/FindUserByPageServlet" method="post">
            <div class="form-group">
                <label for="exampleInputName2">姓名</label>
                <input type="text" class="form-control" value="${condition.name[0]}" id="exampleInputName2" placeholder="Jane Doe" name="name">
            </div>
            <div class="form-group">
                <label for="exampleInputName3">籍贯</label>
                <input type="text" class="form-control" value="${condition.address[0]}" id="exampleInputName3" placeholder="Jane Doe" name="address">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">Email</label>
                <input type="text" class="form-control" value="${condition.email[0]}" id="exampleInputEmail2" name="email">
            </div>
            <button type="submit" class="btn btn-default">查询</button>

        </form>
    </div>
<div style="float: right ; margin: 5px;" >
    <a class="btn btn-primary" href="add.jsp" role="button">添加联系人</a>
    <a class="btn btn-primary" href="javascript:void(0);" id="DelSelected" role="button">删除选中</a>
</div>

    <form id="form" action="${pageContext.request.contextPath}/DelSelectedServlet" method="post">
<table border="1" class="table table-hover" id="tab">
    <tr class="success">
        <th><input type="checkbox" id="firstCb"></th>
        <th>编号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>年龄</th>
        <th>籍贯</th>
        <th>QQ</th>
        <th>邮箱</th>
        <th>操作</th>
    </tr>

<%--    <tr class="success">--%>
<%--        <th><input type="checkbox"></th>--%>
<%--        <td>1</td>--%>
<%--        <td>胡偶然</td>--%>
<%--        <td>男</td>--%>
<%--        <td>20</td>--%>
<%--        <td>四川</td>--%>
<%--        <td>1173137842</td>--%>
<%--        <td>1173137842@qq.com</td>--%>
<%--        <td align="center"><a class="btn btn-default" href="#" role="button">修改</a>&nbsp;--%>
<%--            <a class="btn btn-default" href="#" role="button" >删除</a></td>--%>
<%--    </tr>--%>

    <c:forEach items="${pb.list}" var="user" varStatus="s">
    <tr>
        <td><input type="checkbox" name="uid" value="${user.id}"></td>
        <td>${s.count}</td>
        <td>${user.name}</td>
        <td>${user.gender}</td>
        <td>${user.age}</td>
        <td>${user.address}</td>
        <td>${user.qq}</td>
        <td>${user.email}</td>
        <td align="center"><a class="btn btn-default" href="${pageContext.request.contextPath}/findUserServlet?id=${user.id}" role="button">修改</a>&nbsp;
            <a class="btn btn-default" href="javascript:deleteUser(${user.id});" role="button">删除</a></td>

    </tr>
    </c:forEach>





</table>
    </form>

    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">

                <c:if test="${pb.currentPage == 1}">
                         <li class="disabled">
                    </c:if>
                    <c:if test="${pb.currentPage != 1}">
                         <li>
                    </c:if>

                    <a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${pb.currentPage - 1}&rows=5" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>






                <c:forEach begin="1" end="${pb.totalPage}" var="i">

                    <c:if test="${pb.currentPage == i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${i}&rows=5">${i}</a></li>
                    </c:if>
                    <c:if test="${pb.currentPage != i}">
                        <li ><a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${i}&rows=5">${i}</a></li>
                    </c:if>
                </c:forEach>

                    <c:if test="${pb.currentPage == pb.totalPage}">
                    <li class="disabled">
                        </c:if>
                        <c:if test="${pb.currentPage != pb.totalPage}">
                    <li>
                        </c:if>
                    <a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${pb.currentPage+1}&rows=5" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <span style="font-size: 25px;margin-left: 5px">
                    共${pb.totalCount}条记录，共${pb.totalPage}页
                </span>
            </ul>
        </nav>
    </div>
</div>
</body>
<script>
    function deleteUser(id) {
        if(confirm("您确定要删除嘛？")){
            location.href="${pageContext.request.contextPath}/DelUserServlet?id="+id;
        }

    }

    window.onload = function () {
        //给删除选中按钮添加单机属性
        document.getElementById("DelSelected").onclick = function () {
            if(confirm("您确定要删除这些信息嘛？")){
                //判断是否有选中条目
                var flag = false;
                var cbs = document.getElementsByName("uid");
                for (var i = 0; i < cbs.length; i++) {
                    if(cbs[i].checked){
                        flag = true;
                        break;
                    }
                }

           if(flag == true){
               document.getElementById("form").submit();
           }

            }

        }



    document.getElementById("firstCb").onclick = function () {
        //2.获取下边列表所有cb
        var cbs = document.getElementsByName("uid");

        //3.遍历
        for (var i = 0; i < cbs.length ; i++) {
            //4.设置这些cbs【i】的checked状态 = firstcb。checked
            cbs[i].checked = this.checked;

        }
    }
    }
</script>
</html>
