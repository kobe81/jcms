package com.jcms.controller.sys;

import javax.annotation.Resource;

import com.jcms.pojo.dto.BaseResultsDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jcms.controller.common.BaseController;
import com.jcms.pojo.entity.sys.SysUserEntity;
import com.jcms.service.ISysUserService;

/**
 * 用户
 * @author hontong
 *
 */
@RestController
@RequestMapping("/sys/user/")
public class SysUserController extends BaseController{
	private static Logger log = LoggerFactory.getLogger(SysUserController.class);
	
	@Resource
	private ISysUserService userServiceImpl;

	/**
	 * 用户进行注册接口
	 * @param user
	 * @return
	 */
	 @RequestMapping(value = "register",method = RequestMethod.POST)
	 public BaseResultsDto saveSysUser(SysUserEntity user){
		 log.info("注册用户"+user.toString());
		 try {
             String password=user.getPassword();
             String username=user.getUsername();
			 /**
			  * MD5加密
			  * 数据库加密的密码是（用户名+密码）
			  *
			  */
             String encodeStr= DigestUtils.md5DigestAsHex((username+password).getBytes());
             user.setPassword(encodeStr);
             SysUserEntity userEntity=userServiceImpl.getForUserName(username);
             if(userEntity!=null){
				 return new BaseResultsDto(false,"用户名已经存在",null);
			 }
			 SysUserEntity userEntity2=userServiceImpl.getForTelephone(user.getTelephone());
			 if(userEntity2!=null){
				 return new BaseResultsDto(false,"手机号已经存在",null);
			 }
			userServiceImpl.saveSysUser(user);
			return new BaseResultsDto(true,"注册成功",null);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			 return new BaseResultsDto(false,"注册失败",e.getMessage());
		}
	 }
}
