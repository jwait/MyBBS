var context = $('#context').attr('value');
var form = $('#userMessage');
$(function () {

    form.bootstrapValidator({
        message: '输入值不合法',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                message: '用户名不合法',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: '请输入3到30个字符'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\. \u4e00-\u9fa5 ]+$/,
                        message: '用户名只能由字母、数字、点、下划线和汉字组成 '
                    }
                }
            }
            , password: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '密码长度不能小于6位或超过30位'
                    }
                }
            }
        }
    });
});

$("#login").click(function () {
    //进行表单验证
    var bv = form.data('bootstrapValidator');
    bv.validate();
    if (bv.isValid()) {
        console.log(form.serialize());
        //发送ajax请求
        $.ajax({
            url: context+'/user/login',
            async: false,//同步，会阻塞操作
            type: 'POST',//PUT DELETE POST
            data: form.serialize(),
            complete: function (msg) {
                console.log('登陆成功');
            },
            success: function (result) {
                console.log(result);
                if (result) {
                    window.location.reload();
                } else {
                    $("#returnMessage").hide().html('<label class="label label-danger">用户和密码不匹配!</label>').show(300);
                }
            }, error: function () {
                $("#returnMessage").hide().html('<label class="label label-danger">用户和密码不匹配!</label>').show(300);
            }
        })
    }
});
$("#regist").click(function () {
    //进行表单验证
    var bv = form.data('bootstrapValidator');
    bv.validate();
    if (bv.isValid()) {
        console.log(form.serialize());
        //发送ajax请求
        $.ajax({
            url: context+'/user/regist',
            async: false,//同步，会阻塞操作
            type: 'POST',//PUT DELETE POST
            data: form.serialize(),
            complete: function (msg) {
                console.log('注册成功');
            },
            success: function (data) {
                console.log(data);
                if (data.data == 1) {
                	$("#returnMessage").hide().html('<label class="label label-danger">用户名已存在！</label>').show(300);
                }else if(data.data == 2) {
                	$("#returnMessage").hide().html('<label class="label label-success">注册成功，请重新登录！</label>').show(300);
                	location.href = location.href;
                }
                else {
                    $("#returnMessage").hide().html('<label class="label label-danger">注册失败!</label>').show(300);
                }
            }, error: function () {
                $("#returnMessage").hide().html('<label class="label label-danger">注册失败!</label>').show(300);
            }
        })
    }
});