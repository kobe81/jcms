package com.jcms.service.impl;

import com.alibaba.fastjson.JSON;
import com.jcms.mapper.scenic.ScenicDiscussEntityMapper;
import com.jcms.pojo.dto.ReplyDto;
import com.jcms.pojo.dto.ScenicDiscussDto;
import com.jcms.pojo.entity.scenic.ScenicDiscussEntity;
import com.jcms.pojo.entity.sys.SysFileEntity;
import com.jcms.service.ScenicDiscussService;
import com.sun.rowset.providers.RIXMLProvider;
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
import java.util.Map;

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

        for(ScenicDiscussDto dis:discuss){
            //获取图片
           List<String> files=discussMapper.getFile(dis.getId());
            dis.setFilePath(files);
            //获取回复
           List<ReplyDto> reply=discussMapper.getReply(dis.getId());
            dis.setReplys(reply);
            //获取点赞数
            Map<String,Object> total=discussMapper.getPraiseNums(dis.getId());
            dis.setPraise(Integer.valueOf(String.valueOf(total.get("up"))));
            dis.setUnpraise(Integer.valueOf(String.valueOf(total.get("down"))));
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

    @Override
    public void saveReply(ReplyDto replyDto) throws Exception {
        discussMapper.saveReply(replyDto);
    }

    @Override
    public void del(Long discussId) throws Exception {
        discussMapper.deleteByPrimaryKey(discussId);
        discussMapper.delReply(discussId);
    }

    @Override
    public void savePraise(Long userId, Long discussId, String type) throws Exception {
        //判断是否已经点过赞如果点过就是取消点赞
        int t=discussMapper.getPraise(userId,discussId,type);
        if(t>0){
            discussMapper.delPraise(userId,discussId,type);
        }else{
            discussMapper.savePraise(userId,discussId,type);
        }

    }

}
