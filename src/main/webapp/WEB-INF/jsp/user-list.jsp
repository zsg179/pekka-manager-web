<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="userList" title="用户列表" 
       data-options="singleSelect:false,collapsible:true,remoteSort:false,pagination:true,url:'/user/list',method:'get',pageSize:30,toolbar:toolbar">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'id',width:60">用户ID</th>
            <th data-options="field:'username',width:200">用户名</th>
            <th data-options="field:'password',width:100">密码</th>
            <th data-options="field:'phone',width:100">手机号</th>
            <th data-options="field:'email',width:100">电子邮箱</th>
            <th data-options="field:'created',width:130,align:'center',formatter:TAOTAO.formatDateTime,sortable:true">创建日期</th>
            <th data-options="field:'updated',width:130,align:'center',formatter:TAOTAO.formatDateTime,sortable:true">更新日期</th>
        </tr>
    </thead>
</table>
<div id="userEditWindow" class="easyui-window" title="编辑用户" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/rest/page/user-edit'" style="width:50%;height:50%;padding:10px;">
</div>


<script type="text/javascript"> 
function qq(value,name){ 
alert(value+":"+name) 
} ;

</script> 
<script>

    function getSelectionsIds(){
    	var userList = $("#userList");
    	var sels = userList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(",");
    	return ids;
    }
    
    var toolbar = [{
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','必须选择一个用户才能编辑!');
        		return ;
        	}
        	if(ids.indexOf(',') > 0){
        		$.messager.alert('提示','只能选择一个用户!');
        		return ;
        	}
        	
        	$("#userEditWindow").window({
        		onLoad :function(){
        			//回显数据
        			var data = $("#userList").datagrid("getSelections")[0];
        			$("#userEditForm").form("load",data);
        		}
        	}).window("open");
        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中用户!');
        		return ;
        	}
        	$.messager.confirm('确认','确定删除ID为 '+ids+' 的用户吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
                	$.post("/rest/user/delete",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','删除用户成功!',undefined,function(){
            					$("#userList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    },{
    	 text:'<input type="text" id="userInfo" placeholder="用户名/ID"/>',
    	 
    },{
    	text:'查询',
    	iconCls:'icon-search',
    	handler:function(){
    		var userInfo = $("#userInfo").val();
    		$.post("/manager/user/getUserByUserInfo",{'userInfo':userInfo},function(data){
    			if(data.rows==0){
    				alert("没有找到该用户！请确认用户名/ID");
    			}
    			$("#userList").datagrid("loadData",data);//加载本地数据，旧的行将被移除。
    		});
    	}
    }]; 
</script>