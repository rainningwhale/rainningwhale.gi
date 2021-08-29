<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2021/8/13
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" Type="text/css" href="style.css" >
</head>
<body>
<div class="container right-panel-active">
    <!-- 注册 -->
    <div class="container__form container--signup">
        <form action="test.html" class="form" id="form1">
            <h2 class="form__title">注册账号</h2>
            <input type="text" placeholder="User" class="input" />
            <input type="email" placeholder="Email" class="input" />
            <input type="password" placeholder="Password" class="input" />
            <button class="btn">点击注册</button>
        </form>
    </div>

    <!-- 登录 -->

    <div class="container__form container--signin">
        <form action="${pageContext.request.contextPath}/LoginServlet" class="form" id="form2" method="post">
            <h2 class="form__title">欢迎登录</h2>
            <input type="text" placeholder="Username" class="input" name="username"/>
            <input type="password" placeholder="Password" class="input" name="password"/>
          <label> <input type="text" id="short" placeholder="checkcode" class="input1" name="checkcode" style="float: left"/>
              <img style="float: right" id="checkcode" src="${pageContext.request.contextPath}/CheckCodeServlet" />
          </label>



            <a href="https://www.baidu.com" class="link">忘记密码?</a>
            <!--                <button class="btn">登录</button>-->
            <input type="submit" class="btn" value="登录">
            <!--                <input type="submit" value="提交">-->

        </form>
    </div>

    <!-- 叠加部分 -->
    <div class="container__overlay">
        <div class="overlay">
            <div class="overlay__panel overlay--right">
                <button class="btn" id="signUp">没有账号，点击注册</button>
            </div>
            <div class="overlay__panel overlay--left">
                <button class="btn" id="signIn">已有账号，直接登录</button>
            </div>

        </div>
    </div>
</div>

<div class="div1"><%=request.getAttribute("cc_error") == null ? "": request.getAttribute("cc_error")%></div>
<div class="div1"><%=request.getAttribute("login_error") == null ?"" : request.getAttribute("login_error")%></div>


</body>
<script src="script.js" ></script>
<script>
    <%--function refreshCode() {--%>
    <%--    //1.获取验证码图片对象--%>
    <%--    var vcode = document.getElementById("checkcode");--%>

    <%--    //2.设置其src属性--%>
    <%--    vcode.src = "${pageContext.request.contextPath}/CheckCodeServlet?time"+new Date().getTime();--%>

    <%--}--%>

     window.onload = function () {
     	//1,获取图片对象
     	var img = document.getElementById("checkcode");

     	//2.绑定单机事件
     	img.onclick = function () {
     		//加时间戳
     		var date = new Date().getTime();

     		img.src = "${pageContext.request.contextPath}/CheckCodeServlet?time="+date;

     	}

     }

</script>
</html>
