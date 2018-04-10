/* $.ajax({
        type: "POST",
        url: "/sys/login",
        data: {username:$("#username").val(), content:$("#content").val()},
        dataType: "json",
        success: function(data){
            $('#resText').empty();   //清空resText里面的所有内容
            var html = '';
            $.each(data, function(commentIndex, comment){
                html += '<div class="comment"><h6>' + comment['username']
                    + ':</h6><p class="para"' + comment['content']
                    + '</p></div>';
            });
            $('#resText').html(html);
        }
    });*/


function login() {
    var number = $("#login_number").val();
    var psd = $("#login_password").val();
    var remember_psd = $("#remember").val();
    if (number == "") {
        /* alert("yonghu");*/
        layer.tips('用户名或手机号码不能为空', '#login_number', {tips: [2, 'red'], time: 1000});
        return;
    } else if (psd == "") {
        layer.tips('密码不能为空', '#login_password', {tips: [2, 'red'], time: 1000});
        return;
    }
    $.post(ctx + "/sys/login", {
        "number": number,
        "password": psd,
        "rememberPsd": remember_psd
    }, function (data, status) {
        var data = $.parseJSON(data);
        if (data.success) {
            layer.msg('登陆成功！', {time: 2000, icon: 6});
          /* $("#_close").trigger("click");*/
            location.reload();
        } else {
            layer.tips(data.msg, '#login_password', {tips: [3, 'red'], time: 2000});
        }
    });

}

/**
 * 发送验证码
 *
 */

var clock = '';
var nums = 30;
var btn;
/*验证码发送的标记*/
var sms_flag = false;
/*验证码*/
var sms_vcode="null";

function sendCode(thisBtn) {
    var phone = $("#regist_phone").val();
    if (phone == "") {
        layer.tips('手机号码不能为空', '#regist_phone', {tips: [2, 'red'], time: 1000});
        return;
    }
    var phone_reg =/0?(13|14|15|17|18|19)[0-9]{9}/;
    if (!phone_reg.test(phone)) {
        console.log(phone);
        console.log(phone_reg);
        layer.tips('手机号码格式不正确', '#regist_phone', {tips: [2, 'red'], time: 1000});
        return;
    }

    btn = thisBtn;
    btn.disabled = true; //将按钮置为不可点击
    btn.value = '重新获取（' + nums + '）';
    clock = setInterval(doLoop, 1000); //一秒执行一次
    /**
     * 发送验证码，然后对sms_vcode赋值
     */
    $.post(ctx + "/sendSMS", {
        "phone": phone
    }, function (data, status) {
        console.log("验证码为=" + data);
        sms_vcode = data;
        sms_flag = true;
    });


}

function doLoop() {
    nums--;
    if (nums > 0) {
        btn.value = '重新获取（' + nums + '）';
    } else {
        clearInterval(clock); //清除js定时器
        btn.disabled = false;
        btn.value = '点击发送验证码';
        nums = 10; //重置时间
    }
}

$(document).ready(function () {
    $("#login_QQ").click(function () {
        alert("暂停使用！");
    });
    $("#login_WB").click(function () {
        alert("暂停使用！");
    });
});

/**
 * 注册
 */
function register() {
    var username = $("#regist_account").val();
    var psd = $("#regist_password1").val();
    var npsd = $("#regist_password2").val();
    var phone = $("#regist_phone").val();
    var vcode = $("#regist_vcode").val();
    var email = $("#regist_email").val();
    if (username == "") {
        layer.tips('用户不能为空', '#regist_account', {tips: [2, 'red'], time: 1000});
        return;
    } else if (psd == "") {
        layer.tips('密码不能为空', '#regist_password1', {tips: [2, 'red'], time: 1000});
        return;
    } else if (npsd == "") {
        layer.tips('确认密码不能为空', '#regist_password2', {tips: [2, 'red'], time: 1000});
        return;
    } else if (phone == "") {
        layer.tips('联系电话不能为空', '#regist_phone', {tips: [2, 'red'], time: 1000});
        return;
    }
    if (email == "") {
        layer.tips('邮箱不能为空', '#regist_email', {tips: [2, 'red'], time: 1000});
        return;
    }
    if (psd && npsd && psd != npsd) {
        layer.tips('两次密码不一致', '#regist_password1', {tips: [2, 'red'], time: 1000});
        return;
    }
    if (!sms_flag) {
        layer.tips('请发送验证码', '#regist_vcode', {tips: [2, 'red'], time: 1000});
        return;
    }
    console.log("手机的=="+sms_vcode);
    console.log("页面的=="+vcode);
    if (sms_vcode.replace(/\"/g, "") != vcode) {
        layer.tips('验证码错误', '#regist_vcode', {tips: [2, 'red'], time: 1000});
        return;
    }
    $.post(ctx + "/sys/user/register", {
        "username": username,
        "password": psd,
        "telephone": phone,
        "email": email
    }, function (data, status) {
        var data = $.parseJSON(data);
        if (data.success) {
            layer.msg('注册用户成功！', {time: 2000, icon: 6});
            $("#_close").trigger("click");
        } else {
            layer.msg(data.msg, {time: 2000, icon: 5});
        }
    });
}

 function logout() {
     $.get(ctx + "/sys/logout", function (data, status) {
         var data = $.parseJSON(data);
         if (data.success) {
             window.location.href=ctx+"/";
         } else {
             layer.msg('退出系统失败！', {time: 2000, icon: 5});
         }
     });
}