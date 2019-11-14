package com.pekka.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pekka.common.pojo.EasyUIDataGridResult;
import com.pekka.common.pojo.PekkaResult;
import com.pekka.pojo.TbUser;
import com.pekka.service.UserManagerService;

@Controller
public class UserManagerController {
	@Autowired
	private UserManagerService userManagerService;

	@RequestMapping("/user/list")
	@ResponseBody
	public EasyUIDataGridResult getUserList(Integer page, Integer rows) {
		EasyUIDataGridResult userList = userManagerService.getUserList(page, rows);
		return userList;
	}

	@RequestMapping("/rest/user/update")
	@ResponseBody
	public PekkaResult updateUser(TbUser user) {
		PekkaResult result = userManagerService.updateUser(user);
		return result;
	}

	@RequestMapping("/rest/user/delete")
	@ResponseBody
	public PekkaResult deleteUserById(Long[] ids) {
		PekkaResult result = userManagerService.deleteUser(ids);
		return result;
	}

	@RequestMapping("/manager/user/getUserByUserInfo")
	@ResponseBody
	public EasyUIDataGridResult getUserByUserInfo(String userInfo) {
		List<TbUser> list = userManagerService.getUserByUserInfo(userInfo);
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		result.setRows(list);
		result.setTotal(list.size());
		return result;
	}
}
