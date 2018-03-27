package com.jcms.controller.common;

import org.springframework.web.servlet.ModelAndView;


/**
 * 基类封装统一定义的结构
 */
public class BaseController {

	/**
	 * @Title: returnMsg 
	 * @Description: 定义统一的返回结果结构
	 *  @param msg 
	 *  @param data 
	 *  @return 参数 
	 *  @return ModelAndView 返回类型 
	 *  @throws
	 */
	protected ModelAndView returnMsg(Boolean success, String msg, Object data) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("success", success);
		mv.addObject("msg", msg);
		mv.addObject("data", data);

		return mv;
	}
}
