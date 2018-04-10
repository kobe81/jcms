package com.jcms.service;

import com.jcms.pojo.dto.OrderDto;

import java.util.List;
import java.util.Map;

/**
 * @Author: ZYJ
 * @Description: 订单
 * @CreateDate: 2018/4/5 13:50
 * @UpdateUser: ZYJ
 * @UpdateUser: 2018/4/5 13:50
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
public interface OrderService {

    public List<OrderDto> getOrder(Long userId,Integer state);

    public void delOrder(Long orderId) throws Exception;

    public void delOrderDetail(Long detailId,Long roomId,Integer nums,Long orderId) throws Exception;
}
