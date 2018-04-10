package com.jcms.controller.show;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jcms.controller.common.BaseController;
import com.jcms.pojo.dto.*;
import com.jcms.pojo.entity.sys.SysUserEntity;
import com.jcms.service.HotelService;
import com.jcms.service.OrderService;
import com.jcms.service.ScenicInfoService;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
 **/
@RestController
@RequestMapping("/hotel")
public class HotelController extends BaseController {


    @Resource
    private HotelService hotelService;

    @Resource
    private OrderService orderService;


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
    public BaseResultsDto getHotlList(String name, Integer level, String type,String price,Integer currentPage,Integer pageSize){
        //编码处理
        try {
            if(null!=name&&!"".equals(name)){
                name=URLDecoder.decode(name,"UTF-8");
            }
            if(null!=type&&!"".equals(type)){
                type=URLDecoder.decode(type,"UTF-8");
            }
            PageHelper.startPage(currentPage,pageSize);
            System.out.println("name="+name+"   "+"level="+level+"    "+"type="+type+"   "+"price="+price+"   ");
            List<HotelDto>  list=hotelService.getHotelList(name,level,type,price);
            System.out.println("size===="+list.size());
            for(HotelDto hotelDto:list){
                System.out.println(hotelDto.toString());
            }

            PageInfo<HotelDto> pageInfo=new PageInfo<>(list);
            return new BaseResultsDto(true,"查询成功",pageInfo);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return new BaseResultsDto(false,"查询失败");
        }
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
            return new BaseResultsDto(true,"预订成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new BaseResultsDto(false,"预订失败");
        }

    }

    /**
     * 酒店预订
     * @return
     */
    @RequestMapping(value = "/getOrder")
    public BaseResultsDto getOrder(Integer state, HttpServletRequest request){
        try {
            SysUserEntity user= (SysUserEntity) request.getSession().getAttribute("user");
            List<OrderDto> orders=orderService.getOrder(user.getId(),state);
            return new BaseResultsDto(true,"获取订单成功！",orders);
        } catch (Exception e) {
            e.printStackTrace();
            return new BaseResultsDto(false,"获取订单失败！");
        }

    }
    /**
     * 删除酒店预订
     * @return
     */
    @RequestMapping(value = "/delOrder")
    public BaseResultsDto delOrder(Long orderId){
        try {
            orderService.delOrder(orderId);
            return new BaseResultsDto(true,"删除订单成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new BaseResultsDto(false,"删除订单失败！");
        }

    }
    /**
     * 删除酒店预订明细
     * @return
     */
    @RequestMapping(value = "/delItem")
    public BaseResultsDto delItem(Long itemId,Long roomId,Integer numbers,Long orderId){
        try {
            orderService.delOrderDetail(itemId,roomId,numbers,orderId);
            return new BaseResultsDto(true,"删除订单成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new BaseResultsDto(false,"删除订单失败！");
        }

    }
}
