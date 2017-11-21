package com.jcms.controller.sys;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jcms.controller.common.BaseController;
import com.jcms.pojo.sys.sysUserEntity;
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
	
	
	 @RequestMapping("save")
	 public String saveSysUser(){
		 log.info("进入用户保存");
		 sysUserEntity user=new sysUserEntity();
		 try {
			 user.setId("123");
			 user.setNickname("测试");
			 user.setPassword("123456");
			 user.setUsername("11");
			userServiceImpl.saveSysUser(user);
			return "成功了！！！";
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			return e.getMessage();
		}
	 }
}
