<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>登录皮卡</title>
<link type="text/css" rel="stylesheet" href="/css/login.css" />
<script type="text/javascript" src="/js/jquery-1.6.4.js"></script>
</head>
<body>
	<!-- <div class="w">
		<div id="logo" style="width: 300px;">
			<a href="http://localhost:8082" clstag="passport|keycount|login|01">
				<img src="/images/pekka-logo.jpg" alt="皮卡" width="170" height="60" />
			</a><b class = "welcomefont" ></b>
		</div>
	</div> -->
	<div class="login-banner">
		<div class="login-form">
			<div class="tips-wrapper">
				<div class="cont-wrapper">
					<i class="icon-tips"></i>
					<p
						style="vertical-align: middle; color: #999; font-size: 12px; display: inline-block;">
						皮卡不会以任何理由要求您转账汇款，谨防诈骗。</p>
				</div>
			</div>
			<div class="login-tab">皮卡玩具商城管理后台</div>
			<div class="login-box"
				style="display: block; visibility: visible;; border-top-style: solid; border-top-width: 50px;">
				<div class="form">
					<form id="formlogin" method="post" onsubmit="return false;">
						<div class="item item-fore1">
							<label class="login-label" for="loginname"></label> <input
								id="loginname" class="itxt" name="managerName" tabindex="1"
								autocomplete="off" value="" placeholder="用户名"
								type="text" /> <span class="clear-btn" style="display: none;"></span>
						</div>
						<script type="text/javascript">
							setTimeout(function() {
								if (!$("#loginname").val()) {
									$("#loginname").get(0).focus();
								}
							}, 0);
						</script>
						<div id="capslock"><i></i><s></s>键盘大写锁定已打开，请注意大小写</div>
						<div class="item item-fore2" style="visibility: visible;">
							<label class="login-label pwd-label" for="nloginpwd"></label> <input
								id="nloginpwd" class="itxt itxt-error" name="password"
								tabindex="2" autocomplete="off" placeholder="密码" type="password" style="font-family: Tahoma,Helvetica,Arial;"/>
							<span class="clear-btn" style="display: none;">
						</div>
						<div class="login-btn">
							<a onclick="LOGIN.login();" class="btn-img btn-entry" id="loginsubmit"
								tabindex="6" clstag="pageclick|keycount|login_pc_201804112|12"
								style="text-decoration: none;"  type="button">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
						</div>
						<div id="kbCoagent" class="coagent">
							<div class="regist-link">
								<a href="/manager/register"
									clstag="pageclick|keycount|login_pc_201804112|5"
									target="_blank"
									style="outline: 0px none rgb(109, 109, 109); text-decoration: none; color: #b61d1d; font-size: 14px; padding-left: 220px;"><b></b>立即注册</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div id="banner-bg" class="i-inner">
			<img src="../images/ntk-1419-11218.jpg" style="width: 100%;height: 100%" alt="" />
		</div>
	</div>
	<!-- <form id="formlogin" method="post" onsubmit="return false;" style="background: #e93854; height: 475px; margin-top: 40px;"" >


    <div class=" w1" id="entry">
        <div class="mc " id="bgDiv">
            <div id="entry-bg" clstag="passport|keycount|login|02" style="width: 511px; height: 475px; position: absolute; left: -44px; top: 0px; background: url(/images/5aa68632Nd7790d0c.png) 0px 0px no-repeat;">
			</div>
            <div class="form ">
                <div class="item fore1">
                    <span>用户名</span>
                    <div class="item-ifo">
                        <input type="text" id="loginname" name="username" class="text"  tabindex="1" autocomplete="off"/>
                        <div class="i-name ico"></div>
                        <label id="loginname_succeed" class="blank invisible"></label>
                        <label id="loginname_error" class="hide"><b></b></label>
                    </div>
                </div>
                <script type="text/javascript">
                    setTimeout(function () {
                        if (!$("#loginname").val()) {
                            $("#loginname").get(0).focus();
                        }
                    }, 0);
                </script>
                <div id="capslock"><i></i><s></s>键盘大写锁定已打开，请注意大小写</div>
                <div class="item fore2">
                    <span>密码</span>
                    <div class="item-ifo">
                        <input type="password" id="nloginpwd" name="password" class="text" tabindex="2" autocomplete="off"/>
                        <div class="i-pass ico"></div>
                        <label id="loginpwd_succeed" class="blank invisible"></label>
                        <label id="loginpwd_error" class="hide"></label>
                    </div>
                </div>
                <div class="item login-btn2013">
                    <input type="button" class="btn-img btn-entry" id="loginsubmit" value="登录" tabindex="8" clstag="passport|keycount|login|06"/>
                </div>
            </div>
        </div>
        <div class="free-regist">
            <span><a href="/page/register" clstag="passport|keycount|login|08">免费注册&gt;&gt;</a></span>
        </div>
    </div> 
</form>-->
<%-- <jsp:include page="commons/footer.jsp" /> --%>
	<script type="text/javascript">
		var redirectUrl = "${redirect}";
		var LOGIN = {
			checkInput : function() {
				if ($("#loginname").val() == "") {
					alert("用户名不能为空");
					$("#loginname").focus();
					return false;
				}
				if ($("#nloginpwd").val() == "") {
					alert("密码不能为空");
					$("#nloginpwd").focus();
					return false;
				}
				return true;
			},
			doLogin : function() {
				$.post("/manager/login", $("#formlogin").serialize(), function(
						data) {
					if (data.status == 200) {
						if (redirectUrl == "") {
							location.href = "http://localhost:8081";
						} else {
							location.href = redirectUrl;
						}
					} else {
						alert("登录失败，原因是：" + data.msg);
						$("#loginname").select();
					}
				});
			},
			login : function() {
				if (this.checkInput()) {
					this.doLogin();
				}
			}

		};
		/* $(function() {
			$("#loginsubmit").click(function() {
				LOGIN.login();
			});
		}); */
	</script>
</body>
</html>