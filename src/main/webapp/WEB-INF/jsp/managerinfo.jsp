<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="margin-bottom: 20px">
	<form id="managerinfoForm">
		<div>用户名:</div>
		<input class="easyui-textbox" name="managerName" readonly="readonly">
		<div>手机号:</div>
		<input class="easyui-textbox" name="phone" readonly="readonly">
		<div>邮箱:</div>
		<input class="easyui-textbox" name="email" readonly="readonly"></br></br>
		<a href="/manager/logout/${cookie.TOKEN_KEY_MANAGER.value }" class="easyui-linkbutton">退出登录</a>
	</form>	
</div>
<script>
	$(function(){
		$("#managerinfoForm").form("load","/manager/getManagerInfoByManagerName/${managerName}");
	})
</script>
