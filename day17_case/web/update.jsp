<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2021/8/16
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <h1 align="center">添加联系人页面</h1>
<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/UpdateUserServlet?id=${user.id}">
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" readonly="readonly" id="inputEmail3" placeholder="Email" name="name" value="${user.name}">
        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">性别</label>
        <div class="col-sm-10">
            <c:if test="${user.gender == '男'}">
    <label class="checkbox-inline">

        <input type="checkbox" id="inlineCheckbox1" value="男" name="gender" checked> 男
    </label>
    <label class="checkbox-inline">
        <input type="checkbox" id="inlineCheckbox2" value="女" name="gender"> 女
    </label>
            </c:if>

            <c:if test="${user.gender == '女'}">
                <label class="checkbox-inline">

                    <input type="checkbox"  value="男" name="gender" > 男
                </label>
                <label class="checkbox-inline">
                    <input type="checkbox"  value="女" name="gender" checked> 女
                </label>
            </c:if>
        </div>
    </div>

    <div class="form-group">
        <label for="inputEmail4" class="col-sm-2 control-label">年龄</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputEmail4" placeholder="Email" name="age" value="${user.age}">
        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail5" class="col-sm-2 control-label">籍贯</label>
                <div class="col-sm-10">
                    <c:if test="${user.address == '四川'}">
        <select class="form-control" name="address" id="inputEmail5">
            <option value="陕西">陕西</option>
            <option value="江苏">江苏</option>
            <option value="四川" selected>四川</option>
            <option value="武汉">武汉</option>
        </select>
                    </c:if>

                    <c:if test="${user.address == '江苏'}">
                        <select class="form-control" name="address" id="inputEmail5">
                            <option value="陕西">陕西</option>
                            <option value="江苏" selected>江苏</option>
                            <option value="四川" >四川</option>
                            <option value="武汉">武汉</option>
                        </select>
                    </c:if>
                    <c:if test="${user.address == '武汉'}">
                        <select class="form-control" name="address" id="inputEmail5">
                            <option value="陕西">陕西</option>
                            <option value="江苏">江苏</option>
                            <option value="四川">四川</option>
                            <option value="武汉" selected>武汉</option>
                        </select>
                    </c:if>
                    <c:if test="${user.address == '陕西'}">
                        <select class="form-control" name="address" id="inputEmail5">
                            <option value="陕西"  selected>陕西</option>
                            <option value="江苏">江苏</option>
                            <option value="四川">四川</option>
                            <option value="武汉">武汉</option>
                        </select>
                    </c:if>

                            </div>
<%--        <div class="col-sm-10">--%>
<%--            <input type="text" class="form-control" id="inputEmail5" placeholder="Email" name="address">--%>
<%--        </div>--%>
    </div>
    <div class="form-group">
        <label for="inputEmail6" class="col-sm-2 control-label">QQ</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputEmail6" placeholder="Email" name="qq" value="${user.qq}">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword7" class="col-sm-2 control-label">Email</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="inputPassword7" placeholder="Email" name="email" value="${user.email}">
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">

            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-primary" type="reset" value="重置" />
            <input class="btn btn-primary" type="button" value="返回" />
        </div>
    </div>
</form>
</div>

</body>
</html>
