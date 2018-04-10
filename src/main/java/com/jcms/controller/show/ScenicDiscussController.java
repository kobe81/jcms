package com.jcms.controller.show;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.jcms.controller.common.BaseController;
import com.jcms.pojo.dto.BaseResultsDto;
import com.jcms.pojo.dto.ReplyDto;
import com.jcms.pojo.dto.ScenicDiscussDto;
import com.jcms.pojo.dto.ScenicInfoDto;
import com.jcms.pojo.entity.scenic.ScenicDiscussEntity;
import com.jcms.pojo.entity.sys.SysUserEntity;
import com.jcms.service.ScenicDiscussService;
import com.jcms.service.ScenicInfoService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: hontong
 * @Description: 景点点评
 * @CreateDate: 2018/3/5 19:22
 * @UpdateUser: hontong
 * @UpdateUser: 2018/3/5 19:22
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
@RestController
@RequestMapping("/discuss")
public class ScenicDiscussController extends BaseController {
    @Resource
    private ScenicInfoService scenicInfoService;

    @Resource
    private ScenicDiscussService discussService;

    /**
     * 获取评论
     * @param id
     * @return
     */
    @RequestMapping("/getDiscuss/{id}")
    public BaseResultsDto getDiscuss(@PathVariable Long id){
        Map<String,Object> data=new HashMap<>();
        //获取景点详情
        ScenicInfoDto info=scenicInfoService.getScenicInfo(id);
        data.put("scenic",info);
        //获取点评列表
        List<ScenicDiscussDto> discuss=discussService.getDiscuss(id);
        data.put("discuss",discuss);
//        return new BaseResultsDto(true,"获取评论成功", JSON.toJSONString(data, SerializerFeature.WriteMapNullValue));
        return new BaseResultsDto(true,"获取评论成功", data);
    }

    /**
     * 上传文件
     * @param file
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/upload")
    public BaseResultsDto upLoadFile(MultipartFile file, HttpServletRequest request) throws IOException {
        if (null!=file){
            // 文件原名称
            String name=file.getOriginalFilename();
            //项目路径
            String realPath=request.getSession().getServletContext().getRealPath("/");
            //文件名称
            String fileName="";
            //文件路径
            String filepath=realPath+fileName;
            //文件从内存写到磁盘
            file.transferTo(new File(filepath));
            return new BaseResultsDto(true,"上传文件成功",filepath);
        }else{
            return new BaseResultsDto(false,"上文件失败");
        }

    }

    /**
     * 评论发表
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/send",method = RequestMethod.POST)
    public BaseResultsDto send(ScenicDiscussEntity discussEntity,String files,HttpServletRequest request) {
        try {
            //获取当前登录人员
            SysUserEntity user= (SysUserEntity) request.getSession().getAttribute("user");
            String realPath=request.getSession().getServletContext().getRealPath("/");
            discussEntity.setUserId(user.getId());
            discussEntity.setCreatTime(new Date());
            discussService.saveDiscuss(discussEntity,files,realPath);
            return new BaseResultsDto(true,"评论成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new BaseResultsDto(false,"评论失败");
        }

    }

    /**
     * 评论回复
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/reply",method = RequestMethod.POST)
    public BaseResultsDto reply(ReplyDto replyDto, HttpServletRequest request) {
        try {
            //获取当前登录人员
            SysUserEntity user= (SysUserEntity) request.getSession().getAttribute("user");
            replyDto.setUserId(user.getId());
            replyDto.setCreatTime(new Date());
            discussService.saveReply(replyDto);
            return new BaseResultsDto(true,"留言成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new BaseResultsDto(false,"留言失败");
        }

    }

    /**
     * 点赞评论
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/praise")
    public BaseResultsDto praise(Long id,String type,HttpServletRequest request) {
        try {
            //获取当前登录人员
            SysUserEntity user= (SysUserEntity) request.getSession().getAttribute("user");
            discussService.savePraise(user.getId(),id,type);
            return new BaseResultsDto(true,"点赞成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new BaseResultsDto(false,"点赞失败");
        }

    }
    /**
     * 删除评论
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/del")
    public BaseResultsDto delDiscuss(Long id) {
        try {
            discussService.del(id);
            return new BaseResultsDto(true,"删除评论成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new BaseResultsDto(false,"删除评论失败");
        }

    }

}
