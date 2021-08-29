// 获取元素和点击操作

const signInBtn123 = document.getElementById("signIn");
const signUpBtn321 = document.getElementById("signUp");
const fistForm = document.getElementById("form1");
const secondForm = document.getElementById("form2");
const container = document.querySelector(".container");

signInBtn123.addEventListener("click", () => {
	container.classList.remove("right-panel-active");
});

signUpBtn321.addEventListener("click", () => {
	container.classList.add("right-panel-active");
});

// fistForm.addEventListener("submit", (e) => e.preventDefault());
// secondForm.addEventListener("submit", (e) => e.preventDefault());

// window.onload = function () {
// 	//1,获取图片对象
// 	var img = document.getElementById("checkcode");
//
// 	//2.绑定单机事件
// 	img.onclick = function () {
// 		//加时间戳
// 		var date = new Date().getTime();
//
// 		img.src = "${pageContext.request.contextPath}/CheckCodeServlet?time="+date;
//
// 	}
//
// }

// function refreshCode() {
// 	//1.获取验证码图片对象
// 	var vcode = document.getElementById("checkcode");
//
// 	//2.设置其src属性
// 	vcode.src = "${pageContext.request.contextPath}/CheckCodeServlet?"+new Date();
//
// }

