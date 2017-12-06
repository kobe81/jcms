package com.jcms.system;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jcms.service.ISysUserService;


/**  
* @ClassName: ShiroRealm  
* @Description: 自定义权限认证  
* @author ZYJ  
* @date 2017年12月6日下午9:51:49
*    
*/  
public class ShiroRealm extends AuthorizingRealm{
	private static final Logger logger = LoggerFactory.getLogger(ShiroRealm.class);
	@Resource
	private ISysUserService sysUserService;

	/**
     * 用户授权认证
     */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection collection) {
		logger.info("===开始用户授权认证===");
		return null;
	}

	/**
     * 用户登陆认证
     */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		logger.info("===开始用户登陆认证===");
		String userName=String.valueOf(token.getPrincipal());
		sysUserService.getForUserName(userName);
		return null;
	}

}
