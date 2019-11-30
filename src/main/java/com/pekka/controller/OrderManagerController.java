package com.pekka.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pekka.common.pojo.EasyUIDataGridResult;
import com.pekka.common.pojo.PekkaResult;
import com.pekka.service.OrderManagerService;

@Controller
public class OrderManagerController {
	@Autowired
	private OrderManagerService orderManagerService;

	@RequestMapping("/order/list")
	@ResponseBody
	public EasyUIDataGridResult getOrderList(Integer page, Integer rows) {
		return orderManagerService.getOrderList(page, rows);
	}

	@RequestMapping("/order/deliverGoods")
	@ResponseBody
	public PekkaResult deliverGoods(String orderId) {
		return orderManagerService.deliverGoods(orderId);
	}

	@RequestMapping("/manager/order/getOrderByOrderId")
	@ResponseBody
	public EasyUIDataGridResult getOrderByOrderId(String orderId) {
		return orderManagerService.getOrderByOrderId(orderId);
	}

	@RequestMapping("/manager/order/delete")
	@ResponseBody
	public PekkaResult deleteOrderByOrderId(@RequestParam("ids") String[] orders) {
		return orderManagerService.deleteOrderByOrderId(orders);
	}

	@RequestMapping("/order/orderItemInfo")
	@ResponseBody
	public PekkaResult getOrderItemInfo(HttpSession session, String orderId) {
		PekkaResult result = orderManagerService.getOrderItemList(orderId);
		session.setAttribute("orderItems", result.getData());
		return result;
	}
}
