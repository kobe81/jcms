package com.jcms.pojo.dto;

import java.util.Date;
import java.util.List;

public class ScenicDiscussDto {
    private Long id;

    private Long userId;

    private String userName;

    private Long sceniceId;

    private String content;

    private Date creatTime;

    private List<String> filePath;

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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public List<String> getFilePath() {
        return filePath;
    }

    public void setFilePath(List<String> filePath) {
        this.filePath = filePath;
    }
}