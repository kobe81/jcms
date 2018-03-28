package com.jcms.controller.sys;

import com.jcms.pojo.dto.BaseResultsDto;
import com.jcms.pojo.dto.SysUserDto;
import com.jcms.pojo.entity.sys.SysUserEntity;
import com.jcms.service.ISysUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jcms.controller.common.BaseController;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

/**  
* @ClassName: LoginContorller  
* @Description: 后台登录
* @author hontong
* @date 2017年11月27日下午9:43:38
*    
*/  
@RestController
@RequestMapping("/sys")
public class LoginContorller extends BaseController{

    @Resource
    private ISysUserService userServiceImpl;

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
	 * 登录
	 * @param sysUserDto
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public BaseResultsDto login(SysUserDto sysUserDto, HttpServletRequest request,HttpServletResponse response) {
		/**
		 * number可能是手机号或者用户名
		 */
        String number= sysUserDto.getNumber();
        String password= sysUserDto.getPassword();
		SysUserEntity user=userServiceImpl.getForUserName(number);
		//可能传的手机号
        if(user==null){
        	user=userServiceImpl.getForTelephone(number);
		}
		//如果手机和用户名都找不到用户，就说明不存在用户
		if(user==null){
			return new BaseResultsDto(false,"用户名或者密码错误，请检查",null);
		}
        String encodeStr= DigestUtils.md5DigestAsHex((user.getUsername()+password).getBytes());
        if (user!=null&&user.getPassword().equals(encodeStr)){
			request.getSession().setAttribute("user",user);
			if(sysUserDto.getRememberPsd()){
				//记住密码登录
				Cookie c = new Cookie("username", URLEncoder.encode(user.getUsername()));
				Cookie c1=new Cookie("password", URLEncoder.encode(user.getPassword()));
				//一天的失效时间
				c.setMaxAge(60*60*24);
				c1.setMaxAge(60*60*24);
				c.setPath(request.getContextPath());
				c1.setPath(request.getContextPath());
				System.out.println(c);
				response.addCookie(c);
				response.addCookie(c1);
				System.out.println("记住密码了");
			}
            return new BaseResultsDto(true,"登录成功",null);
        }else{
            return new BaseResultsDto(false,"用户名或者密码错误，请检查",null);
        }
	}

	/**
	 * 登出
	 * @return
	 */
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public BaseResultsDto loginout(HttpServletRequest request) {
		//用户验证登录
        request.getSession().removeAttribute("user");
		return new BaseResultsDto(true,"退出成功",null);
	}
	
	/**  
	* @Title: doLogout
	* @Description: 退书登录
	* @param
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
