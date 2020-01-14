package com.pekka.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.pekka.common.pojo.PekkaResult;
import com.pekka.common.util.CookieUtils;
import com.pekka.pojo.TbManager;
import com.pekka.service.ManagerService;

public class LoginInterceptor implements HandlerInterceptor {

	@Value("${TOKEN_KEY_MANAGER}")
	private String TOKEN_KEY_MANAGER;

	@Autowired
	private ManagerService managerService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 执行handler之前执行
		// 1.从cookie中取token信息
		String token = CookieUtils.getCookieValue(request, TOKEN_KEY_MANAGER);
		// 2.如果取不到token，跳转到登陆页面，需要把当前请求的url作为参数传递过去，登陆成功后跳转回请求的页面
		if (StringUtils.isBlank(token)) {
			response.sendRedirect("http://localhost:8081/page/login");
			// 拦截
			return false;
		}
		// 3.取到token，判断是否登陆
		PekkaResult PekkaResult = managerService.getManagerByToken(token);
		if (PekkaResult.getStatus() != 200) {
			// 未取到管理员信息，即管理员未登录，跳转到登陆页面
			response.sendRedirect("http://localhost:8081/page/login");
			// 拦截
			return false;
		}
		// 取到管理员信息，放行
		TbManager manager = (TbManager) PekkaResult.getData();
		request.setAttribute("manager", manager);
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 执行handler之后，ModelAndView之前
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 执行ModelAndView之后，异常处理
	}

}
