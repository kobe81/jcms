package com.jcms.controller.show;

import com.jcms.controller.common.BaseController;
import com.jcms.pojo.dto.BaseResultsDto;
import com.jcms.pojo.dto.HotelDto;
import com.jcms.pojo.dto.RoomsDto;
import com.jcms.pojo.dto.ScenicInfoDto;
import com.jcms.pojo.entity.sys.SysUserEntity;
import com.jcms.service.HotelService;
import com.jcms.service.ScenicInfoService;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author: hontong
 * @Description: 酒店展示
 * @CreateDate: 2018/3/5 19:22
 * @UpdateUser: hontong
 * @UpdateUser: 2018/3/5 19:22
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
@RestController
@RequestMapping("/hotel")
public class HotlController extends BaseController {


    @Resource
    private HotelService hotelService;


    @RequestMapping("/jump/{page}")
    public ModelAndView jump(@PathVariable String page,Long id){
        ModelAndView mav=new ModelAndView("/views/"+page);
        if (page.equals("hotel_info")){
            //获取酒店详情
            mav.addObject("info",hotelService.getHoteInfo(id));
        }
        return mav;
    }

    /**
     * 查询酒店列表
     * @param name
     * @param level
     * @return
     */
    @RequestMapping(value = "/getlist",method = RequestMethod.POST)
    public BaseResultsDto getHotlList(String name, Integer level, String type){
       List<HotelDto>  list=hotelService.getHotelList(name,level,type);
        return new BaseResultsDto(true,"查询成功",list);
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));

    }

    /**
     * 酒店预订
     * @return
     */
    @RequestMapping(value = "/reserve",method = RequestMethod.POST)
    public BaseResultsDto reserve(RoomsDto dto, HttpServletRequest request){

        try {
            SysUserEntity user= (SysUserEntity) request.getSession().getAttribute("user");
            dto.setUserId(user.getId());
            hotelService.saveReserve(dto);
            return new BaseResultsDto(true,"预订成功",null);
        } catch (Exception e) {
            e.printStackTrace();
            return new BaseResultsDto(false,"预订失败",null);
        }

    }
}
