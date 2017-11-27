package com.jcms.controller.sys;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jcms.controller.common.BaseController;

/**
 * 后台登录
 * @author ZYJ
 *
 */
@RestController
public class LoginContorller extends BaseController{

	@ResponseBody
	@RequestMapping("/login")
	public ModelAndView jump(){
		return new ModelAndView("/admins/login");
	}
	
	@ResponseBody
	public void login() {
		
	}
}
