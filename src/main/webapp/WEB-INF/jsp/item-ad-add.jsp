<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form id="itemADAddForm" class="itemForm" method="post">
	<input type="hidden" name="categoryName" value="${param.categoryName }"/>
	<table cellpadding="5" style="margin-left: 30px" id="itemParamAddTable" class="itemParam">
	
		<tr>
		    <td>商品ID:</td>
		    <td><input class="easyui-textbox" type="text" name="id" data-options="required:true" style="width: 280px;"></input></td>
		</tr>
	</table>
</form>
<div style="padding:5px;padding-left: 90px;">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
<script type="text/javascript">
//提交表单
function submitForm(){
	//有效性验证
	if(!$('#itemADAddForm').form('validate')){
		$.messager.alert('提示','请输入商品ID!');
		return ;
	}
	$.post("/item/ad/save",$("#itemADAddForm").serialize(), function(data){
		if(data.status == 200){
			$.messager.alert('提示','新增商品广告成功!');
			$("#itemADList${param.categoryName }").datagrid("reload");
			TT.closeCurrentWindow();
		}else{
			$.messager.alert('提示',data.msg);
		}
	});
}

function clearForm(){
	$('#itemADAddForm').form('reset');
}
</script>