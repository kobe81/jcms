$(function(){
    //初始酒店列表
    hotel.init_list('init');
});
var currentPage=1;
var totalPage;
var hotel={
    init_list:function(type){
        var param={};
        if (type!="init"){
            param={
                "name":$("#name").val(),
                "level":$("#level").val(),
                "type":$("#type").val(),
                "price":$("#price").val(),
                "currentPage":type=="page"?currentPage:1,
                "pageSize":1

            }
        }else{
            param={
                "currentPage":1,
                "pageSize":1
            }
        }
        $.post(ctx+"/hotel/getlist",param,function(data,status){
            var html="";
            var data=$.parseJSON(data);
            $(".am-pagination").hide();
            if(data.success&&data.data){
                var hotels=data.data.list;
                if(hotels.length>0){
                    $(".am-pagination").show();
                }
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
                if (type=="init"||type=="query"){
                    //清除旧页码
                    $("li").remove(".pageNum");
                //页码
                totalPage=data.data.pages;
                var pageHtml="";
                for (var i=0;i<totalPage;i++){
                    var pageNum=(i+1);
                    if(pageNum==1){
                        pageHtml+='<li class="pageNum am-active" id="'+pageNum+'"><a href="javascript:hotel.page('+pageNum+')">'+pageNum+'</a></li>';
                    }else{
                        pageHtml+='<li class="pageNum" id="'+pageNum+'"><a href="javascript:hotel.page('+pageNum+')">'+pageNum+'</a></li>';
                    }

                }
                $(".am-pagination-prev").after(pageHtml);
                }
            }

        });
    },
    jump_info:function(id){
        window.location.href=ctx+"/hotel/jump/hotel_info?id="+id;
    },
    page:function(t){
        var paganumber;
        if(t=='first'){
            paganumber=1;
        }else if(t=='pgup'){
            paganumber=$(".am-pagination .am-active>a").text();
            paganumber=parseInt(paganumber);
            if(paganumber>1){
                paganumber=paganumber-1;
            }
        }else if(t=='pgdn'){
            paganumber=$(".am-pagination .am-active>a").text();
            paganumber=parseInt(paganumber);
            if(paganumber<totalPage){
                paganumber=paganumber+1;
            }
        }else if(t=='end'){
            paganumber=totalPage;
        }else{
            paganumber=t;
        }
        currentPage=paganumber;
        $(".am-pagination li").removeClass("am-active");
        $(".am-pagination #"+paganumber).addClass("am-active");
        hotel.init_list('page');
    }
}