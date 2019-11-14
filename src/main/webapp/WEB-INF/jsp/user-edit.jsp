<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div style="padding:10px 10px 10px 10px">
	<form id="userEditForm" class="itemForm" method="post">
		<input type="hidden" name="id"/>
	    <table cellpadding="5">
	        <tr>
	            <td>用户名:</td>
	            <td><input class="easyui-textbox" type="text" name="username" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>密码:</td>
	            <td><input class="easyui-textbox" type="text" name="password" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>手机号:</td>
	            <td><input class="easyui-textbox" type="text" name="phone" data-options="required:true" style="width: 280px;"/></td>
	        </tr>
	        <tr>
	            <td>电子邮箱:</td>
	            <td><input class="easyui-textbox" type="text" name="email"  style="width: 280px;"/></td>
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	</div>
</div>
<script type="text/javascript">
	
	function submitForm(){
		if(!$('#userEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$.post("/rest/user/update",$("#userEditForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','修改用户成功!','info',function(){
					$("#userEditWindow").window('close');
					$("#userList").datagrid("reload");
				});
			}
		});
	}
</script>
