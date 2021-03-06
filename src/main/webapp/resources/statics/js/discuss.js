var sceniceId,userId;
$(function(){
    userId=$("#userId").attr("val");
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
                    var reply="";
                    $.each(obj.replys,function (r,o) {
                        reply+='<blockquote>'+o.username+'&nbsp;:&nbsp;'+o.content+'</blockquote>';
                    });

                    html+='<li class="am-comment"><article class="am-comment"><a href="#link-to-user-home">'+
                        '<img src="'+ctx+'/resources/statics/img/tx.png" class="am-comment-avatar" width="48" height="48"/>'+
                        '</a><div class="am-comment-main"><header class="am-comment-hd"><div class="am-comment-meta">'+
                        '<a href="javascript:void()" class="am-comment-author">'+obj.userName+'</a>&nbsp;&nbsp;评论于 <time>'+dateFtt("yyyy-MM-dd hh:mm:ss",obj.creatTime)+'</time>'+
                        (obj.userId==userId?'&nbsp;&nbsp;&nbsp;&nbsp;<i class="am-icon-trash am-icon-sm" style="cursor:pointer;" onclick="discuss.delDis('+obj.id+')"></i>':'')+'</div></header>' +
                        '<div class="am-comment-bd"><p>'+obj.content+'</p>' +imgs+'</div>' +
                        '<footer class="am-comment-footer"><div class="am-comment-actions">' +
                        '<a href="javascript:discuss.praise(\'up\','+obj.id+')"><i class="am-icon-thumbs-up"></i>('+obj.praise+')</a>' +
                        '<a href="javascript:discuss.praise(\'down\','+obj.id+')"><i class="am-icon-thumbs-down"></i>('+obj.unpraise+')</a>' +
                        '<a href="javascript:discuss.reply('+obj.id+')">回复</a></div></footer>' +reply+
                        '</div></article></li>';
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
        var files = $('#uploadfile').get(0).files;//获取到文件列表
        if (files.length > 0) {
            var display=$("#piclist").css("display");
            if(display=="none"){
                $("#piclist").show();
            }
        } else {
            return;
        }
        var reader = new FileReader();//新建一个FileReader
        reader.readAsDataURL(files[0]);
        reader.onload = function (e) { //读取完文件之后会回来这里
             var fileStr = e.target.result;
            discuss.files.push(fileStr);
                $("#piclist").append('<img width="150" id="pic_'+discuss.files.length+'" style="height: 95px;margin: 5px;" src="'+fileStr+'" class="am-img-thumbnail am-radius">' +
                    '<i class="am-icon-trash am-icon-sm" id="del_'+discuss.files.length+'" style="position: relative;cursor:pointer;left: -25px;top: -35px;" onclick="discuss.delPic(\''+discuss.files.length+'\',\''+fileStr+'\')"></i>');
        }
    },
    praise:function (type,discussId) {
        if(!$("#userId").attr("val")){
            layer.msg('请先登录！', {icon: 5});
            return
        }
        $.get(ctx+"/discuss/praise?id="+discussId+"&type="+type,function(data,status){
            var data=$.parseJSON(data);
            if(data&&data.success){
                discuss.getInfo(sceniceId);
                // location.reload();
            }else{
                layer.msg('点赞失败！', {icon: 5});
            }

        });
    },
    reply:function(discussId){
        if(!$("#userId").attr("val")){
            layer.msg('请先登录！', {icon: 5});
            return
        }
        var html="<div><p style='padding: 10px;'><span>评论：</span>" +
            '<textarea style="width: 500px;" rows="5" id="reply" placeholder="一字千金"></textarea></p></div>';
        layer.open({
            title: '评论回复',
            content: html,
            area: '550px',
            shade:0,
            btn: ['确定', '取消'],
            yes:function(index, layero){
                if(!$("#reply").val()){
                    layer.tips('留言不能为空', '#reply',{tips: [2, 'red'],time: 1500});
                    return;
                }
                var param={
                    "discussId":discussId,
                    "content":$("#reply").val()

                }
                $.post(ctx+"/discuss/reply",param,function(data,status){
                    var data=$.parseJSON(data);
                    if(data.success){
                        // location.reload();
                        discuss.getInfo(sceniceId);
                        //$("blockquote:last").after("<blockquote>"+$("#userId").text()+":"+$("#reply").val()+"</blockquote>");
                        layer.close(index);
                    }else{
                        layer.msg('预订失败！', {icon: 5});
                    }

                });

            },
            cancel:function(index){
                layer.close(index);
            }
        });

    },
    delDis:function(id){
        $.get(ctx+"/discuss/del?id="+id,function(data,status){
            var data=$.parseJSON(data);
            if(data&&data.success){
                // location.reload();
                discuss.getInfo(sceniceId);
            }else{
                layer.msg('删除评论失败！', {icon: 5});
            }

        });
    },
    delPic:function(i,file){
        var files=discuss.files;
        var index=$.inArray(file,files);
        files.splice(index,1);
        $("#del_"+i).remove();
        $("#pic_"+i).remove();
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