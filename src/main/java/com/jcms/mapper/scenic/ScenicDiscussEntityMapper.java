package com.jcms.mapper.scenic;

import com.jcms.pojo.dto.ReplyDto;
import com.jcms.pojo.dto.ScenicDiscussDto;
import com.jcms.pojo.entity.scenic.ScenicDiscussEntity;
import com.jcms.pojo.entity.sys.SysFileEntity;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.OBJ_ADAPTER;

import java.util.List;
import java.util.Map;

public interface ScenicDiscussEntityMapper {

    int deleteByPrimaryKey(Long id);

    int insert(ScenicDiscussEntity record);

    ScenicDiscussEntity selectByPrimaryKey(Long id);

    List<ScenicDiscussEntity> selectAll();

    List<ScenicDiscussDto> selectDiscuss(@Param("scenicId") Long scenicId);

    int updateByPrimaryKey(ScenicDiscussEntity record);

    List<String> getFile(@Param("joinId")Long joinId);

    int saveFile(SysFileEntity entity);

    void saveReply(ReplyDto replyDto) throws Exception;

    List<ReplyDto> getReply(@Param("discussId")Long discussId);

    int delReply(@Param("discussId")Long discussId);

    int savePraise(@Param("userId")Long userId,@Param("discussId") Long discussId,@Param("type") String type);

    Map<String,Object> getPraiseNums(@Param("discussId") Long discussId);

    int getPraise(@Param("userId")Long userId,@Param("discussId") Long discussId,@Param("type") String type);

    int delPraise(@Param("userId")Long userId,@Param("discussId") Long discussId,@Param("type") String type);

}