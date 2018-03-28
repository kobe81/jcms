package com.jcms.controller.sms;

import com.alibaba.fastjson.JSONException;
import com.jcms.utils.GetMessageCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 短信验证接口
 */
@RestController
@RequestMapping("/sendSMS")
public class SendSmsController {

	private static Logger log = LoggerFactory.getLogger(SendSmsController.class);

	@RequestMapping()
	public String index(String phone) {
		log.info("发送验证码，手机号===="+phone);
		//根据获取到的手机号发送验证码
		String code= null;
		try {
			code = GetMessageCode.getCode(phone);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		log.info("手机验证码为===="+code);
		return code;
	}

}
