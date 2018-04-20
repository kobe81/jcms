package com.jcms.pojo.dto;

import java.util.Date;

/**
 * @Author: hongtong
 * @Description: 回复
 * @CreateDate: 2018/4/6 20:06
 * @UpdateUser: hongtong
 * @UpdateUser: 2018/4/6 20:06
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
public class ReplyDto {

    private Long id;
    private Long userId;
    private Long discussId;
    private String username;
    private String content;
    private Date creatTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getDiscussId() {
        return discussId;
    }

    public void setDiscussId(Long discussId) {
        this.discussId = discussId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }
}
