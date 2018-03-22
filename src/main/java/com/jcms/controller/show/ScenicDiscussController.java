package com.jcms.controller.show;

import com.jcms.controller.common.BaseController;
import com.jcms.pojo.dto.BaseResultsDto;
import com.jcms.pojo.dto.ScenicInfoDto;
import com.jcms.service.ScenicInfoService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @Author: ZYJ
 * @Description: 景点点评
 * @CreateDate: 2018/3/5 19:22
 * @UpdateUser: ZYJ
 * @UpdateUser: 2018/3/5 19:22
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
@RestController
@RequestMapping("/discuss")
public class ScenicDiscussController extends BaseController {


    /**
     * 获取评论
     * @param id
     * @return
     */
    @RequestMapping("/getDiscuss/{id}")
    public BaseResultsDto getDiscuss(Long id){


        return new BaseResultsDto(true,"",null);
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
    @RequestMapping("/send")
    public BaseResultsDto send() throws IOException {

            return new BaseResultsDto(false,"上文件失败");

    }

}
