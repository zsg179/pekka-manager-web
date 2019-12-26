<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
<table class="easyui-datagrid" id="itemADList${param.categoryName }" title="商品列表" 
       data-options="singleSelect:false,collapsible:true,url:'/item/ad/list?categoryName=${param.categoryName }',method:'get',toolbar:itemADListToolbar">
     <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'id',width:60">商品ID</th>
            <th data-options="field:'title',width:200">商品标题</th>
            <th data-options="field:'cid',width:100">叶子类目</th>
            <th data-options="field:'sellPoint',width:100">卖点</th>
            <th data-options="field:'price',width:70,align:'right',formatter:TAOTAO.formatPrice">价格</th>
            <th data-options="field:'num',width:70,align:'right'">库存数量</th>
            <th data-options="field:'barcode',width:100">条形码</th>
            <th data-options="field:'status',width:60,align:'center',formatter:TAOTAO.formatItemStatus">状态</th>
            <th data-options="field:'isAd',width:100,align:'center',formatter:TAOTAO.formatADStatus">是否为广告</th>
            <th data-options="field:'isHot',width:100,align:'center',formatter:TAOTAO.formatHOTStatus">是否为热门</th>
            <th data-options="field:'created',width:130,align:'center',formatter:TAOTAO.formatDateTime">创建日期</th>
            <th data-options="field:'updated',width:130,align:'center',formatter:TAOTAO.formatDateTime">更新日期</th>
        </tr>
    </thead>
</table>
<%-- <input type="hidden" id="categoryName" value="${param.categoryName }"> --%>
</div>

<script type="text/javascript">
	 
$(function(){
	$("#itemADList").datagrid("reload");
})
    function getSelectionsIds(){
    	var itemList = $("#itemADList${param.categoryName }");
    	var sels = itemList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(",");
    	return ids;
    }
    
    var itemADListToolbar = [{
        text:'新增',
        iconCls:'icon-add',
        handler:function(){
        	var itemList = $("#itemADList${param.categoryName }");
        	var data = itemList.datagrid("getData");
        	if(data.total == 6){
        		$.messager.alert("提示", "广告位已满!");
        	}else{
        		TAOTAO.createWindow({
            		url : "/item-ad-add?categoryName=${param.categoryName }",
            	});
        	}
        	
        }
    },{
        text:'移除',
        iconCls:'icon-cancel',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中商品规格!');
        		return ;
        	}
        	$.messager.confirm('确认','确定移除ID为 '+ids+' 的商品吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids,"categoryName":"${param.categoryName }"};
                	$.post("/item/ad/delete",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','移除商品广告成功!',undefined,function(){
            					$("#itemADList${param.categoryName }").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    }];
</script>