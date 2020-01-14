package com.pekka.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pekka.common.pojo.PekkaResult;
import com.pekka.common.util.CookieUtils;
import com.pekka.pojo.TbManager;
import com.pekka.service.LoginManagerService;

/**
 * @author 朱树广
 * @date 2020年1月13日
 */
@Controller
public class LoginManagerControler {

	@Autowired
	private LoginManagerService loginManagerService;
	@Value("${TOKEN_KEY_MANAGER}")
	private String TOKEN_KEY_MANAGER;
	@Value("${TOKEN_EXPIRE}")
	private int TOKEN_EXPIRE;

	@RequestMapping("/manager/login")
	@ResponseBody
	public PekkaResult login(String managerName, String password, HttpServletRequest request,
			HttpServletResponse response) {
		PekkaResult result = loginManagerService.login(managerName, password);
		// 登陆成功把token写入cookie
		if (result.getStatus() == 200) {
			CookieUtils.setCookie(request, response, TOKEN_KEY_MANAGER, result.getData().toString(), TOKEN_EXPIRE);
		}
		// 将用户名存到全局域对象中，方便获取。
		request.getSession().getServletContext().setAttribute("managerName", managerName);
		return result;
	}

	@RequestMapping("/manager/check/{param}/{type}")
	@ResponseBody
	public PekkaResult checkData(@PathVariable String param, @PathVariable Integer type) {
		PekkaResult result = loginManagerService.checkData(param, type);
		return result;
	}

	@RequestMapping(value = "/manager/register", method = RequestMethod.POST)
	@ResponseBody
	public PekkaResult register(TbManager manager) {
		PekkaResult result = loginManagerService.register(manager);
		return result;
	}

	@RequestMapping("/manager/getManagerInfoByManagerName/{managerName}")
	@ResponseBody
	public TbManager getManagerInfoByManagerName(@PathVariable String managerName) {
		PekkaResult result = loginManagerService.getManagerInfoByManagerName(managerName);
		return (TbManager) result.getData();
	}

	@RequestMapping("/manager/logout/{token}")
	public String logout(@PathVariable String token) {
		loginManagerService.logout(token);
		return "redirect:http://localhost:8081/page/login";
	}

	@RequestMapping("/manager/updatepwd")
	@ResponseBody
	public PekkaResult updatePwd(String managerName, String oldpassword, String newpassword) {
		PekkaResult result = loginManagerService.updatePwd(managerName, oldpassword, newpassword);
		return result;
	}
}
