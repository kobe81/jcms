$(function(){
});

var hotel_info={
    reserve:function(hotelId,roomId,num,beds){
        if(!$("#userId").attr("val")){
            layer.msg('请先登录！', {icon: 5});
            return
        }
        var html="<div><p style='padding: 10px;'><span>入驻时间：</span>" +
            "<input type='text' class='workinput' id='time' placeholder='例：2018-01-01' ></p>" +//readonly
            "<p style='padding: 10px;'><span>入驻天数：</span><input type='number' min='1' id='days' name='rooms'></p>"+
            "<p style='padding: 10px;'><span>入驻人数：</span><input type='number' min='1' id='man' name='mans'></p>"+
            "<p style='padding: 10px;'><span>房间数量：</span><input type='number' min='1' id='rooms' name='rooms'></p></div>";
        layer.open({
            title: '房间预订',
            content: html,
            shade:0,
            btn: ['确定', '取消'],
            yes:function(index, layero){
                if(!$("#time").val()){
                    layer.tips('入驻时间不能为空', '#time',{tips: [2, 'red'],time: 1500});
                    return;
                }else if(!$("#days").val()){
                    layer.tips('入驻天数不能为空', '#days',{tips: [2, 'red'],time: 1500});
                    return;
                }else if(!$("#man").val()){
                    layer.tips('入驻人数不能为空', '#man',{tips: [2, 'red'],time: 1500});
                    return;
                }else if(!$("#rooms").val()){
                    layer.tips('预订房间数量不能为空,并且不能大于最大剩余房间数', '#rooms',{tips: [2, 'red'],time: 1500});
                    return;
                }
                var DATE_FORMAT =/^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/;
                if (!DATE_FORMAT.test($("#time").val())){
                    layer.tips('入驻时间格式错误，例：2018-01-01', '#time',{tips: [2, 'red'],time: 1500});
                    return;
                }
                if($("#man").val()&&$("#man").val()>(num*beds)){
                    layer.tips('入住人数量不能大于床位总数', '#man',{tips: [2, 'red'],time: 1500});
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
                    "mans":$("#man").val(),
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