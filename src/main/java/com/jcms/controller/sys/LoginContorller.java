package com.jcms.controller.sys;

import java.time.LocalDateTime;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jcms.controller.common.BaseController;
import com.jcms.pojo.dto.SysUserDto;

/**  
* @ClassName: LoginContorller  
* @Description: 后台登录
* @author ZYJ  
* @date 2017年11月27日下午9:43:38
*    
*/  
@RestController
@RequestMapping("/sys")
public class LoginContorller extends BaseController{

	/**  
	* @Title: jump  
	* @Description: 页面调转  
	* @param @return    参数  
	* @return ModelAndView    返回类型  
	* @throws  
	*/  
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
	@RequestMapping(value="/doLogin",method=RequestMethod.POST)
	public ModelAndView doLogin(SysUserDto userDto) {
			UsernamePasswordToken token = new UsernamePasswordToken(userDto.getUsername(), userDto.getPassword());
			//记住当前用户
//			token.setRememberMe(true);
			try {
				SecurityUtils.getSubject().login(token);
			} catch ( UnknownAccountException uae ) {
				return returnMsg(false, "账号/密码错误", null);
			}catch ( IncorrectCredentialsException ice ) {
				return returnMsg(false, "账号/密码错误", null);
			} catch ( LockedAccountException lae ) {
				return returnMsg(false, "账号被锁定", null);
			} catch ( ExcessiveAttemptsException eae ) {
				return returnMsg(false, "账号/密码错误", null);
			}
			//继承AuthenticationExceptions可以实现自定义登录异常
			userDto.setLoginTime(LocalDateTime.now());
			return returnMsg(true, "登录成功", userDto);
	}
	
	/**  
	* @Title: doLogout
	* @Description: 退书登录
	* @param     参数  
	* @return void    返回类型  
	* @throws  
	*/  
	@RequestMapping(value="/doLogout",method=RequestMethod.POST)
	public ModelAndView doLogout() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return new ModelAndView("/system/login");
	}
}
