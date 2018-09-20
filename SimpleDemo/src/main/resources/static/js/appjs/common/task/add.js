$().ready(function() {
	validateRule();
});

$.validator.setDefaults({
	submitHandler : function() {
		save();
	}
});
function save() {
	$.ajax({
		cache : true,
		type : "POST",
		url :"/common/task/save",
		data : $('#signupForm').serialize(),
		async : false,
		error : function(request) {
            swal({title:"Connection error!",text:"网络异常!",type:"warning"});
		},
		success : function(data) {
            if (data.code == 0) {
                swal({title:"操作成功!",
                    type:"success"}).then(function () {
                    parent.reLoad();
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                });
            } else {
                swal("出错啦。。。", data.msg, "error");
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
			}
		},
		messages : {
			name : {
				required : icon + "请输入姓名"
			}
		}
	})
}