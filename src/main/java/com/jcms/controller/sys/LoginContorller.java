package com.jcms.controller.sys;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jcms.controller.common.BaseController;

/**  
* @ClassName: LoginContorller  
* @Description: 后台登录
* @author ZYJ  
* @date 2017年11月27日下午9:43:38
*    
*/  
@RestController
public class LoginContorller extends BaseController{

	/**  
	* @Title: jump  
	* @Description: 页面调转  
	* @param @return    参数  
	* @return ModelAndView    返回类型  
	* @throws  
	*/  
	@ResponseBody
	@RequestMapping("/login")
	public ModelAndView jump(){
		return new ModelAndView("/system/login");
	}
	
	/**  
	* @Title: 登录验证
	* @Description: TODO(这里用一句话描述这个方法的作用)  
	* @param     参数  
	* @return void    返回类型  
	* @throws  
	*/  
	@ResponseBody
	@RequestMapping("/doLogin")
	public void doLogin() {
		
	}
}
