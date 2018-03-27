package com.jcms.controller.show;

import com.jcms.controller.common.BaseController;
import com.jcms.pojo.dto.ScenicInfoDto;
import com.jcms.service.ScenicInfoService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: hontong
 * @Description: 景点展示
 * @CreateDate: 2018/3/5 19:22
 * @UpdateUser: hontong
 * @UpdateUser: 2018/3/5 19:22
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
@RestController
@RequestMapping("/scenic")
public class ScenicShowController extends BaseController {

    @Resource
    private ScenicInfoService scenicInfoService;

    @RequestMapping("/jump/{page}")
    public ModelAndView jump(@PathVariable String page,Long id){
        ModelAndView mav=new ModelAndView("/views/"+page);
        if (page.equals("scenicInfo")){
            //获取景点详情
            ScenicInfoDto info=scenicInfoService.getScenicInfo(id);
            mav.addObject("info",info);
        }else{
            //获取景点列表
            List<ScenicInfoDto> scenics=scenicInfoService.getScenics();
            mav.addObject("scenics",scenics);
        }

    return mav;
    }

    @RequestMapping("/hotl/{page}")
    public ModelAndView hotl(@PathVariable String page,Long id){
        ModelAndView mav=new ModelAndView("/views/"+page);
        if (page.equals("hotelinfo")){
            //获取酒店详情
            ScenicInfoDto info=scenicInfoService.getScenicInfo(id);
            mav.addObject("info",info);
        }else{
            //获取酒店列表
            List<ScenicInfoDto> scenics=scenicInfoService.getScenics();
            mav.addObject("scenics",scenics);
        }

        return mav;
    }
}
