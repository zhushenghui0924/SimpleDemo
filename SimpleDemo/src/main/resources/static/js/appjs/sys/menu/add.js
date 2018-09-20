var prefix = "/sys/menu"
$(function() {
	validateRule();
	//打开图标列表
    $("#ico-btn").click(function(){
        layer.open({
            type: 2,
			title:'图标列表',
            content: '/FontIcoList.html',
            area: ['480px', '90%'],
            success: function(layero, index){
                //var body = layer.getChildFrame('.ico-list', index);
                //console.log(layero, index);
            }
        });
    });
});
$.validator.setDefaults({
	submitHandler : function() {
		submit01();
	}
});
function submit01() {
	$.ajax({
		cache : true,
		type : "POST",
		url : prefix + "/save",
		data : $('#signupForm').serialize(),
		async : false,
        error : function(request) {
            swal({title:"Connection error!",text:"网络异常!",type:"warning"});
        },
        success : function(r) {
            if (r.code == 0) {
                swal({title:"操作成功!",
                    type:"success"}).then(function () {
                    parent.reLoad();
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                });
            } else {
                swal("出错啦。。。", r.msg, "error");
            }
        }
	});
}

function validateRule() {
	var icon = "<i class='fa fa-times-circle'></i> ";
	$("#signupForm").validate({
		rules : {
			name : {
				required : true
			},
			type : {
				required : true
			}
		},
		messages : {
			name : {
				required : icon + "请输入菜单名"
			},
			type : {
				required : icon + "请选择菜单类型"
			}
		}
	})
}