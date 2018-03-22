var login={
		doloign:function(){
			var html="<div><p style='padding: 10px;'><span>用户昵称：</span><input type='text' id='username' name='username'></p>" +
				"<p style='padding: 10px;'><span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input type='password' id='psd' name='psd'></p></div>";
            layer.open({
                title: '登录',
				content: html,
                btn: ['登录', '取消'],
                yes:function(index, layero){
                   var username= $("input[name='username']").val();
                   var psd = $("input[name='psd']").val();
                   if(!username){
                       layer.tips('用户不能为空', '#username',{tips: [2, 'red'],time: 1000});
                       return;
				   }else
				   if (!psd){
                       layer.tips('密码不能为空', '#psd',{tips: [2, 'red'],time: 1000});
                       return;
				   }
                    $.post(ctx+"/sys/login",{
                        "username":username,
                        "password":psd
                    },function(data,status){
                        var data=$.parseJSON(data);
                        if(data.success){
                            layer.msg('登陆成功！',{time:2000,icon: 6});
                            layer.close(index);
                            location.reload();
                        }else{
                            layer.tips(data.msg, '#psd',{tips: [3, 'red'],time: 2000});
                        }
                    });
				},
                cancel:function(index){
					layer.close(index);
                }

            });

		},
    register:function(){
        var html="<div><p style='padding: 10px;'><span>用户昵称：</span><input type='text' id='username' name='username'></p>" +
            "<p style='padding: 10px;'><span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input type='password' id='psd' name='psd'></p>" +
            "<p style='padding: 10px;'><span>确认密码：</span><input type='password' id='npsd' name='npsd'></p>" +
            "<p style='padding: 10px;'><span>联系电话：</span><input type='text' id='phone' name='phone'></p>" +
            "</div>";
        layer.open({
            title: '用户注册',
            content: html,
            btn: ['确定', '取消'],
            yes:function(index, layero){
                var username= $("input[name='username']").val();
                var psd = $("input[name='psd']").val();
                var npsd = $("input[name='npsd']").val();
                var phone = $("input[name='phone']").val();
                if(!username){
                    layer.tips('用户不能为空', '#username',{tips: [2, 'red'],time: 1000});
                    return;
                }else if (!psd){
                    layer.tips('密码不能为空', '#psd',{tips: [2, 'red'],time: 1000});
                    return;
                }else if (!npsd){
                    layer.tips('确认密码不能为空', '#npsd',{tips: [2, 'red'],time: 1000});
                    return;
                }else if (!phone){
                    layer.tips('联系电话不能为空', '#phone',{tips: [2, 'red'],time: 1000});
                    return;
                }
                if(psd&&npsd&&psd!=npsd){
                    layer.tips('两次密码不一致', '#psd',{tips: [2, 'red'],time: 1000});
                    return;
                }
                $.post(ctx+"/sys/user/save",{
                    "username":username,
                    "password":psd,
                    "telephone":phone
                },function(data,status){
                    var data=$.parseJSON(data);
                    if(data.success){
                        layer.msg('注册用户成功！',{time:2000,icon: 6});
                        layer.close(index);
                    }else{
                        layer.msg('注册用户失败！',{time:2000,icon: 5});
                    }
                });
            },
            cancel:function(index){
                layer.close(index);
            }
        });
	},
    logout:function(){
        $.get(ctx+"/sys/logout",function(data,status){
            var data=$.parseJSON(data);
            if(data.success){
                location.reload();
            }else{
                layer.msg('退出系统失败！',{time:2000,icon: 5});
            }
        });
    }
}