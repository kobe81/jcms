package com.jcms.mapper.hotel;

import com.jcms.pojo.dto.OrderDto;
import com.jcms.pojo.dto.OrderItemDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: ZYJ
 * @Description: 订单
 * @CreateDate: 2018/4/5 14:00
 * @UpdateUser: ZYJ
 * @UpdateUser: 2018/4/5 14:00
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
public interface OrderMapper {

    public List<OrderDto> getOrder(@Param("userId") Long userId,@Param("state")  Integer state);

    public List<OrderItemDto> getOrderItem(@Param("orderId") Long orderId);

    public int delOrder(@Param("orderId") Long orderId);

    public int delOrderALL(@Param("orderId") Long orderId);

    public int delOrderDetail(@Param("detailId") Long detailId);
}
