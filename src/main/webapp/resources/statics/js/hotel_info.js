$(function(){
    //初始酒店房间列表
    $('.container .am-slider').flexslider();
});

var hotel_info={
    reserve:function(hotelId,roomId,num){
        if(!$("#userId").attr("val")){
            layer.msg('请先登录！', {icon: 5});
            return
        }
        var html="<div><p style='padding: 10px;'><span>入驻时间：</span>" +
            "<input type='text' id='time' readonly='readonly' data-am-datepicker ></p>" +
            "<p style='padding: 10px;'><span>入驻天数：</span><input type='number' min='1' id='days' name='rooms'></p>"+
            "<p style='padding: 10px;'><span>房间数量：</span><input type='number' min='1' id='rooms' name='rooms'></p></div>";
        layer.open({
            title: '房间预订',
            content: html,
            shade:0,
            btn: ['确定并支付', '取消'],
            yes:function(index, layero){
                if(!$("#time").val()){
                    layer.tips('入驻时间不能为空', '#time',{tips: [2, 'red'],time: 1500});
                    return;
                }else if(!$("#days").val()){
                    layer.tips('入驻天数不能为空', '#days',{tips: [2, 'red'],time: 1500});
                    return;
                }else if(!$("#rooms").val()){
                    layer.tips('预订房间数量不能为空,并且不能大于最大剩余房间数', '#rooms',{tips: [2, 'red'],time: 1500});
                    return;
                }
                if($("#rooms").val()&&$("#rooms").val()>num){
                    layer.tips('预订房间数量不能大于最大剩余房间数', '#rooms',{tips: [2, 'red'],time: 1500});
                    return;
                }
                var param={
                    "numbers":$("#rooms").val(),
                    "inTime":$("#time").val(),
                    "days":$("#days").val(),
                    "allNumbers":num,
                    "hotelId":hotelId,
                    "roomId":roomId

                }
                $.post(ctx+"/hotel/reserve",param,function(data,status){
                    var data=$.parseJSON(data);
                    if(data.success){
                        layer.msg('预订成功！', {icon: 6});
                        location.reload();
                    }else{
                        layer.msg('预订失败！', {icon: 5});
                    }

                });

            },
            cancel:function(index){
                layer.close(index);
            }
        });
        $('#time').datepicker({format: 'yyyy-mm-dd'});
        $(".am-datepicker-dropdown").css("z-index",90000000);
    }
}