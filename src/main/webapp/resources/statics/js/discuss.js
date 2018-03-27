var sceniceId;
$(function(){
    //默认加载第一个
    var id=$(".am-nav li").length>=2?$(".am-nav li:eq(1)").attr("id"):"";
    sceniceId=id;
    discuss.getInfo(id);
});
var discuss={
    files:[],
    getInfo:function(id){
        sceniceId=id;
        $.get(ctx+"/discuss/getDiscuss/"+id,function(data){
            var data=$.parseJSON(data);
            var datas=data.data;
            if(datas){
                var scenic=datas.scenic;
                if(scenic){
                $("#scenic_remark").html(scenic.remark);
                $(".info_pic img").attr("src",ctx+scenic.filepath);
                $(".info_text a").attr("href",ctx+"/scenic/jump/scenicInfo?id="+scenic.id);
                }
                var discuss=datas.discuss;
                if(discuss){
                    $("#total").html(discuss.length);
                var html="";
                $.each(discuss,function (i,obj) {
                    //获取图片
                    var imgs="";
                    $.each(obj.filePath,function (j,f) {
                        imgs+='<img width="150" src="'+ctx+f+'" class="am-img-thumbnail am-radius">';
                    });
                    html+='<li class="am-comment"><article class="am-comment"><a href="#link-to-user-home">'+
                        '<img src="'+ctx+'/resources/statics/img/tx.png" class="am-comment-avatar" width="48" height="48"/>'+
                        '</a><div class="am-comment-main"><header class="am-comment-hd"><div class="am-comment-meta">'+
                        '<a href="javascript:void()" class="am-comment-author">'+obj.userName+'</a>&nbsp;&nbsp;评论于 <time>'+dateFtt("yyyy-MM-dd hh:mm:ss",obj.creatTime)+'</time>'+
                        '</div></header><div class="am-comment-bd"><p>'+obj.content+'</p>' +imgs+
                        '</div></div></article></li>';
                });
                $("#discuss_list").html(html);
                }
            }
        });
    },
    send_discuss:function(){
        if(!$("#content").val()||$("#content").val().length<10){
            layer.tips('评论内容不能为空，并且不能少于10个字符', '#content',{tips: [2, 'red'],time: 2000});
            return
        }
        var data={
            "sceniceId":sceniceId,
            "files":JSON.stringify(discuss.files),
            "content":$("#content").val()
        }
        $.post(ctx+"/discuss/send", data).success(function (result) {
           if(result){
               $("#content").val("");
               $("#piclist").hide();
               $("#piclist").html("");
               discuss.getInfo(sceniceId);
           }else{

           }
        });
    },
    upload:function(){
        var files = $('#file').prop('files');//获取到文件列表
        if (files.length > 0) {
            var display=$("#piclist").css("display");
            if(display=="none"){
                $("#piclist").show();
            }
            // $("#piclist").append('<img width="150" style="height: 95px;" src="'+URL.createObjectURL($("#file")[0].files[0])+'" class="am-img-thumbnail am-radius">');
        } else {
            return;
        }
        var reader = new FileReader();//新建一个FileReader
        reader.readAsDataURL(files[0]);
        reader.onload = function (e) { //读取完文件之后会回来这里
            var fileStr = this.result;
            discuss.files.push(fileStr);
                $("#piclist").append('<img width="150" style="height: 95px;" src="'+fileStr+'" class="am-img-thumbnail am-radius">');
        }
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