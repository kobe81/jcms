package com.jcms.pojo.dto;

/**
 * @Author: ZYJ
 * @Description: Controller数据返回结果
 * @CreateDate: 2018/3/15 20:10
 * @UpdateUser: ZYJ
 * @UpdateUser: 2018/3/15 20:10
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
public class BaseResultsDto {
    /**
     * 结果
     */
    private Boolean success;
    /**
     * 消息
     */
    private String msg;
    /**
     * 数据
     */
    private Object data;

    public BaseResultsDto(Boolean success, String msg) {
        this.success = success;
        this.msg = msg;
    }

    public BaseResultsDto(Boolean success, String msg, Object data) {
        this.success = success;
        this.msg = msg;
        this.data = data;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
