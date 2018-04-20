$(function(){
    //初始Tab
    $('.roomtype ul li').click(function(){
        $('.roomtype ul li').removeClass("am-active");
        $(this).addClass("am-active");
        hotel_order.init($(this).attr("val"));
    });
    hotel_order.init(0);
});

var hotel_order={
    init:function(state){
        $.get(ctx+"/hotel/getOrder?state="+state,function(data,status){
            var data=$.parseJSON(data);
            if(data&&data.success){
                var orders=data.data;
                var orderhtml="";
                $.each(orders,function(i,o){
                    var item=o.item;
                    var itemhtml="",rooms=0,total=0;

                    $.each(item,function(j,t){
                        itemhtml+='<li><div class="itemLeft"><a style="font-weight: 600;">'+t.roomType+'</a><br>'+
                            '<span>'+t.remark+'</span></div><div class="itemRight"><span>￥'+t.price+' X'+t.numbers+'</span>&nbsp;&nbsp;'+
                            (o.state==0?'<i class="am-icon-trash am-icon-sm" style="cursor:pointer;" onclick="hotel_order.delItem('+t.id+','+t.roomId+','+t.numbers+','+o.id+')"></i>':"") +
                            '</div></li>';
                        total+= t.price*t.numbers;
                        rooms+=t.numbers;
                    })


                    orderhtml+='<div class="roomInfo"><div class="orderName"><span>'+o.hotelName+'</span>' +
                        '<span style="margin-left: 900px;">'+dateFtt("yyyy-MM-dd hh:mm:ss",o.orderTime)+'</span></div>' +
                        '<div class="orderitem"> <ul class="am-list">'+itemhtml+'</ul>'+
                        '</div><div align="right" class="but"><span>共'+rooms+'间房</span>&nbsp;&nbsp;' +
                        '<span>合计：￥ '+total+'</span>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;'+
                        (o.state==0?'<button type="button"   class="am-btn am-btn-xs am-btn-warning"><a href="/jcms/order/pay?oid='+o.id+'">立即付款</a></button>&nbsp;&nbsp;':"")+
                        '<button type="button" onclick="hotel_order.delOrder('+o.id+')" class="am-btn am-btn-xs">删除订单</button></div></div>';
                })
                $("#order").html(orderhtml);

            }
        });
    },
    delOrder:function(orderId){
        $.get(ctx+"/hotel/delOrder?orderId="+orderId,function(data,status){
            var data=$.parseJSON(data);
            if(data&&data.success){
                location.reload();
            }else {
                layer.msg('删除失败', {icon: 5});
            }

        })
    },
    delItem:function(itemId,roomId,numbers,orderId){
        $.get(ctx+"/hotel/delItem?itemId="+itemId+'&roomId='+roomId+'&numbers='+numbers+'&orderId='+orderId,function(data,status){
            var data=$.parseJSON(data);
            if(data&&data.success){
                location.reload();
            }else {
                layer.msg('删除失败', {icon: 5});
            }
        })
    },
    play:function(oid){
            /*var data=$.parseJSON(data);
            if(data&&data.success){*/
               /* location.reload();*/
          /*  }else {
                layer.msg('删除失败', {icon: 5});
            }*/
        layer.msg('待开发！！！', {icon: 4});
    }
}

/**************************************时间格式化处理************************************/
function dateFtt(fmt,date){
    date=new Date(date);
    var o = {
        "M+" : date.getMonth()+1,                 //月份
        "d+" : date.getDate(),                    //日
        "h+" : date.getHours(),                   //小时
        "m+" : date.getMinutes(),                 //分
        "s+" : date.getSeconds(),                 //秒
        "q+" : Math.floor((date.getMonth()+3)/3), //季度
        "S"  : date.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
}
