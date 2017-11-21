package com.jcms.controller.common;

import org.springframework.web.servlet.ModelAndView;

/**
 * 基类封装统一定义的结构
 * @author ZYJ
 *
 */
public class BaseController {
	
	ModelAndView returnMsg(){
		return new ModelAndView();
	}
}
