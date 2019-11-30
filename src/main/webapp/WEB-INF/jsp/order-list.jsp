<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="orderList" title="订单列表" 
       data-options="singleSelect:false,collapsible:true,remoteSort:false,pagination:true,url:'/order/list',method:'get',pageSize:30,toolbar:toolbar">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'orderId',width:55,align:'center'">订单ID</th>
            <th data-options="field:'payment',width:60,align:'center',sortable:true">实付金额</th>
            <th data-options="field:'paymentType',width:60,align:'center',formatter:TAOTAO.formatPaymentTpye">支付类型</th>
            <th data-options="field:'status',width:60,align:'center',formatter:TAOTAO.formatOrderStatus">状态</th>
            <th data-options="field:'createTime',width:130,align:'center',formatter:TAOTAO.formatDateTime,sortable:true">创建时间</th>
            <th data-options="field:'updateTime',width:130,align:'center',formatter:TAOTAO.formatDateTime,sortable:true">更新时间</th>
            <th data-options="field:'paymentTime',width:130,align:'center',formatter:TAOTAO.formatDateTime,sortable:true">付款时间</th>
            <th data-options="field:'consignTime',width:130,align:'center',formatter:TAOTAO.formatDateTime,sortable:true">发货时间</th>
            <th data-options="field:'endTime',width:130,align:'center',formatter:TAOTAO.formatDateTime,sortable:true">交易完成时间</th>
            <th data-options="field:'shippingName',width:60,align:'center'">物流名称</th>
            <th data-options="field:'shippingCode',width:60,align:'center'">物流单号</th>
            <th data-options="field:'userId',width:50,align:'center'">用户ID</th>
            <th data-options="field:'buyerNick',width:60,align:'center'">用户昵称</th>
            <th data-options="field:'',width:200,formatter:TAOTAO.formatOperation">处理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
        </tr>
    </thead>
</table>
<!-- <div id="orderItemInfoWindow" class="easyui-window" title="订单商品详情" data-options="modal:true,closed:true,iconCls:'icon-edit',href:'/rest/page/order-itemInfo'" style="width:50%;height:50%;padding:10px;">
</div> -->


<script type="text/javascript"> 
function qq(value,name){ 
alert(value+":"+name) 
} ;

</script> 
<script>

    function getSelectionsIds(){
    	var orderList = $("#orderList");
    	var sels = orderList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].orderId);
    	}
    	ids = ids.join(",");
    	return ids;
    }
    
    var toolbar = [/* {
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','必须选择一个订单才能编辑!');
        		return ;
        	}
        	if(ids.indexOf(',') > 0){
        		$.messager.alert('提示','只能选择一个订单!');
        		return ;
        	}
        	
        	$("#orderEditWindow").window({
        		onLoad :function(){
        			//回显数据
        			var data = $("#orderList").datagrid("getSelections")[0];
        			$("#orderEditForm").form("load",data);
        		}
        	}).window("open");
        }
    }, */{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中订单!');
        		return ;
        	}
        	$.messager.confirm('确认','确定删除ID为 '+ids+' 的订单吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
        	    	$.ajax({
        	    		url:"/manager/order/delete",
        	    		type:"post",
        	    		dataType:"json",
        	    		data:params,
        	    		success:function(data){
        	    			if(data.status == 200){
                				$.messager.alert('提示','删除订单成功!',undefined,function(){
                					$("#orderList").datagrid("reload");
                				});
                			}else{
                				$.messager.alert("提示", "删除失败！", undefined, function(){
                				});
                				
                			}
        	    		}
        	    		
        	    	})
        	    }
        	});
        }
    },{
    	 text:'<input type="text" id="orderId" placeholder="订单ID"/>',
    	 
    },{
    	text:'查询',
    	iconCls:'icon-search',
    	handler:function(){
    		var orderId = $("#orderId").val();
    		if(orderId == ""){
				$("#orderList").datagrid("reload");
    		}else{
    			$.ajax({
        			url:"/manager/order/getOrderByOrderId",
        			type:"post",
        			dataType:"json",
        			data:{orderId:orderId},
        			success:function(data){
        				if(data.rows==0){
            				//$.messager.alert();
            				$.messager.alert("提示", "没有找到该订单！请确认订单ID", undefined, function(){
            				});
            			}
            			$("#orderList").datagrid("loadData",data);//加载本地数据，旧的行将被移除。
        			}
        		});
    		}
    		
    	}
    }]; 
</script>