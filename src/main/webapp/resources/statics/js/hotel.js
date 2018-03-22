$(function(){
    //初始酒店列表
    hotel.init_list('init');
});

var hotel={
    init_list:function(type){
        var param={};
        if (type!="init"){
            param={
                "name":$("#name").val(),
                "level":$("#level").val(),
                "type":$("#type").val()
            }
        }

        $.post(ctx+"/hotel/getlist",param,function(data,status){
            var html="";
            var data=$.parseJSON(data);
            if(data.success&&data.data){
                var hotels=data.data;
                $.each(hotels,function(i,o){
                    var level="";
                    for(var l=0;l<o.hotelLevel;l++){
                        level+='<span class="am-icon-star color_y"></span>';
                    }
                    html+='<li><div class="listimg">'+
                        '<img onclick="hotel.jump_info('+o.id+')" src="'+ctx+(o.picPath?o.picPath:"/resources/showtemp/background/hotel1.jpg")+'" width="180" height="220" class="am-img-thumbnail am-radius"/>'+
                        '</div><div class="info"><div class="ml">'+
                        '<table><tr><td>'+o.hotelName+'&nbsp;&nbsp;</td><td>'+level+'</td></tr>' +
                        '<tr><td>酒店类型：</td><td><span>'+o.hotelType+'</span></td></tr><tr><td>地址：</td><td>'+o.address+'</td></tr>'+
                        '<!--<tr><td>房间数：</td><td><span style="color:red;">5</span></td></tr>--></table></div>'+
                        '<div class="price"><div><label>¥</label><label class="color_y">'+o.lowestPrice+'</label><label>起</label></div>'+
                        '<button type="button" onclick="hotel.jump_info('+o.id+')" class="am-btn am-btn-xs am-btn-warning" style="margin-top: 55px;">马上预订</button>'+
                        '</div></div></li>';

                });
                $("#hotellist").html(html);
            }

        });
    },
    jump_info:function(id){
        window.location.href=ctx+"/hotel/jump/hotel_info?id="+id;
    }
}