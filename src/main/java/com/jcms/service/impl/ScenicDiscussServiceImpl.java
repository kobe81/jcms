package com.jcms.service.impl;

import com.alibaba.fastjson.JSON;
import com.jcms.mapper.scenic.ScenicDiscussEntityMapper;
import com.jcms.pojo.dto.ScenicDiscussDto;
import com.jcms.pojo.entity.scenic.ScenicDiscussEntity;
import com.jcms.pojo.entity.sys.SysFileEntity;
import com.jcms.service.ScenicDiscussService;
import org.springframework.stereotype.Service;
import sun.misc.BASE64Decoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 * @Author: hontong
 * @Description: TODO
 * @CreateDate: 2018/3/23 22:48
 * @UpdateUser: hontong
 * @UpdateUser: 2018/3/23 22:48
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
@Service
public class ScenicDiscussServiceImpl implements ScenicDiscussService {

    @Resource
    private ScenicDiscussEntityMapper discussMapper;

    @Override
    public List<ScenicDiscussDto> getDiscuss(Long scenicId) {
        List<ScenicDiscussDto> discuss=discussMapper.selectDiscuss(scenicId);
        //获取图片
        for(ScenicDiscussDto dis:discuss){
           List<String> files=discussMapper.getFile(dis.getId());
            dis.setFilePath(files);
        }
        return discuss;
    }

    @Override
    public void saveDiscuss(ScenicDiscussEntity discussEntity,String files,String path) throws Exception {
        discussMapper.insert(discussEntity);
        //保存文件
        Object[] file=  JSON.parseArray(files).toArray();
        for (Object obj: file) {
            String str= (String) obj;
            String suffix=str.substring(("data:image/").length(),str.indexOf(";base64,"));
            str=str.substring(str.indexOf("64,")+3);
            SysFileEntity sysFile=new SysFileEntity();
            //获取文件后缀
            byte[] buffer = new BASE64Decoder().decodeBuffer(str);
            File directory = new File("");// 参数为空
            String filepath=path+"resources/upload/";
            File fileurl=new File(path);
            if(!fileurl.exists()){
                fileurl.mkdirs();
            }
            filepath+=System.currentTimeMillis()+"."+suffix;
            Files.write(Paths.get(filepath), buffer, StandardOpenOption.CREATE);


            sysFile.setJoinId(discussEntity.getId());
            sysFile.setPicUrl(filepath.replace(path,"/"));
            sysFile.setCreatTime(new Date());
            discussMapper.saveFile(sysFile);
        }
    }

}
