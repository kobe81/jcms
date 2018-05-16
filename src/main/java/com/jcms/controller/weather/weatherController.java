package com.jcms.controller.weather;

import com.jcms.controller.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author hongtong
 * date: 2018/4/9
 */
@Controller
@RequestMapping("/weather")
public class weatherController extends BaseController {

    @RequestMapping("/wuyuan")
    public String weather(){
        return "/views/weather";
    }
}
