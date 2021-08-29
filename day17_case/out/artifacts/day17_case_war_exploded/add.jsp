<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2021/8/16
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <h1 align="center">添加联系人页面</h1>
<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/AddUserServlet">
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputEmail3" placeholder="Email" name="name">
        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">性别</label>
        <div class="col-sm-10">
    <label class="checkbox-inline">
        <input type="checkbox" id="inlineCheckbox1" value="男" name="gender"> 男
    </label>
    <label class="checkbox-inline">
        <input type="checkbox" id="inlineCheckbox2" value="女" name="gender"> 女
    </label>
        </div>
    </div>

    <div class="form-group">
        <label for="inputEmail4" class="col-sm-2 control-label">年龄</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputEmail4" placeholder="Email" name="age">
        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail5" class="col-sm-2 control-label">籍贯</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputEmail5" placeholder="Email" name="address">
        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail6" class="col-sm-2 control-label">QQ</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputEmail6" placeholder="Email" name="qq">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword7" class="col-sm-2 control-label">Email</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="inputPassword7" placeholder="Email" name="email">
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
