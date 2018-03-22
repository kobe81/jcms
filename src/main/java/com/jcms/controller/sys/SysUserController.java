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
 * 系统用户管理
 * @author ZYJ
 *
 */
@RestController
@RequestMapping("/sys/user/")
public class SysUserController extends BaseController{
	private static Logger log = LoggerFactory.getLogger(SysUserController.class);
	
	@Resource
	private ISysUserService userServiceImpl;
	
	
	 @RequestMapping(value = "save",method = RequestMethod.POST)
	 public BaseResultsDto saveSysUser(SysUserEntity user){
		 log.info("进入用户保存");
		 try {
             String psd=user.getPassword();
             String username=user.getUsername();
             //MD5加密
             String encodeStr= DigestUtils.md5DigestAsHex((username+psd).getBytes());
             user.setPassword(encodeStr);
			 user.setStatus("1");
			userServiceImpl.saveSysUser(user);
			return new BaseResultsDto(true,"查询成功",null);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			 return new BaseResultsDto(false,"查询成功",e.getMessage());
		}
	 }
}
