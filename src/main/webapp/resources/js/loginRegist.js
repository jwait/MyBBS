var context = $('#context').attr('value');
var form = $('#loginMessage');
var form1 = $('#registMessage');
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
                        max: 20,
                        message: '请输入3到20个字符'
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
                        max: 19,
                        message: '密码长度不能小于6位或超过19位'
                    }
                }
            }
        }
    });
    
    form1.bootstrapValidator({
        message: '输入值不合法',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username1: {
                message: '用户名不合法',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 3,
                        max: 20,
                        message: '请输入3到20个字符'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\. \u4e00-\u9fa5 ]+$/,
                        message: '用户名只能由字母、数字、点、下划线和汉字组成 '
                    }
                }
            }, 
            password1: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 19,
                        message: '密码长度不能小于6位或超过19位'
                    }
                }
            },
            phone: {
                message: 'The phone is not valid',
                validators: {
                    notEmpty: {
                        message: '手机号码不能为空'
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: '请输入11位手机号码'
                    },
                    regexp: {
                        regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                        message: '手机号码格式有误'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: '邮件不能为空'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,
                        message: '邮箱格式有误'
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
                console.log('操作有效！');
            },
            success: function (result) {
                console.log(result);
                if (result) {
                	setTimeout(function(){
                		window.location.reload();
                	},500);
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
    var bv1 = form1.data('bootstrapValidator');
    bv1.validate();
    if (bv1.isValid()) {
        console.log(form1.serialize());
        //发送ajax请求
        $.ajax({
            url: context+'/user/regist',
            async: false,//同步，会阻塞操作
            type: 'POST',//PUT DELETE POST
            data: {username : $('#username1').val(),
            	password : $('#password1').val(),
            	phone : $('#phone').val(),
            	email : $('#email').val()},
            complete: function (msg) {
                console.log('操作有效！');
            },
            success: function (data) {
                console.log(data);
                if (data.data == 1) {
                	$("#returnMessage2").hide().html('<label class="label label-danger">用户名已存在！</label>').show(300);
                }else if(data.data == 2) {
                	$("#returnMessage2").hide().html('<label class="label label-success">注册成功！</label>').show(300);
                	setTimeout(function(){
                		location.href = location.href;
                	},500);
                }
                else {
                    $("#returnMessage2").hide().html('<label class="label label-danger">注册失败!</label>').show(300);
                }
            }, error: function () {
                $("#returnMessage2").hide().html('<label class="label label-danger">注册失败!</label>').show(300);
            }
        })
    }
});