<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="margin-bottom: 20px">
	<form id="updatepwdForm">
		<div>原密码:</div>
		<input class="easyui-textbox" type="password" name="oldpassword" id="oldpassword" required="required">
		<div>新密码:</div>
		<input class="easyui-textbox" type="password" name="newpassword" id="newpassword" required="required">
		<div>确认新密码:</div>
		<input class="easyui-textbox" type="password" name="reqpassword" id="reqpassword" required="required"></br>
		</br> <a href="javascript:void(0);" onclick="checkNewPwd()"
			class="easyui-linkbutton">确认修改</a>
	</form>
</div>
<script type="text/javascript">
	function checkNewPwd() {
		if ($("#oldpassword").val() == "") {
			$.messager.alert("提示","原密码不能为空");
			$("#oldpassword").focus();
			return false;
		}
		if ($("#newpassword").val() == "") {
			$.messager.alert("提示","新密码不能为空");
			$("#newpassword").focus();
			return false;
		}
		if ($("#reqpassword").val() == "") {
			$.messager.alert("提示","确认新密码不能为空");
			$("#reqpassword").focus();
			return false;
		}
		var v0 = $("#oldpassword").val();
		var v1 = $("#newpassword").val();
		var v2 = $("#reqpassword").val();
		if(v1 != v2){
			$.messager.alert("提示","两次密码不一致")
			return ;
		}
		$.ajax({
			url:"/manager/updatepwd",
			type:"post",
			dataType:"json",
			data:{'managerName':"${managerName}",'oldpassword':v0,'newpassword':v1},
			success:function(data){
				if(data.status == 200){
					$.messager.alert("提示","修改密码成功！");
				}else{
					$.messager.alert("提示",data.msg);
				}
			}
		})
	}
</script>

