<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2021/8/15
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript"></script>
  </head>
  <body>

  <div align="center">
    <div>

     ${loginuser.username},欢迎你

    </div>
    <a
    href="${pageContext.request.contextPath}/FindUserByPageServlet" style="...">查询所有用户信息

    </a>
  </div>

  </body>
</html>
