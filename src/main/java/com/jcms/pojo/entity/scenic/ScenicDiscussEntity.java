package com.jcms.pojo.entity.scenic;

import java.util.Date;

public class ScenicDiscussEntity {
    private Long id;

    private Long userId;

    private Long sceniceId;

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

    public Long getSceniceId() {
        return sceniceId;
    }

    public void setSceniceId(Long sceniceId) {
        this.sceniceId = sceniceId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }
}