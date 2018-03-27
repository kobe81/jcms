package com.jcms.system;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jcms.pojo.entity.sys.SysUserEntity;
import com.jcms.service.ISysUserService;


/**  
* @ClassName: ShiroRealm  
* @Description: 自定义权限认证  
* @author hontong
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
		String userName = (String) getAvailablePrincipal(collection);
		//获取登录用户的权限
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		return info;
	}

	/**
     * 用户登陆认证
     */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		logger.info("===开始用户登陆认证===");
		String userName=String.valueOf(token.getPrincipal());
		SysUserEntity user=sysUserService.getForUserName(userName);
		if(null == user){
			//账号不存在
			throw new UnknownAccountException();
		}else if("2".equals(user.getStatus())){
			//账号被锁定
			throw new LockedAccountException();
		}
		//密码验证
		 SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(userName,user.getPassword(),ByteSource.Util.bytes(userName),getName());
		return info;
	}

}
