$().ready(function() {
	validateRule();
});

$.validator.setDefaults({
	submitHandler : function() {
		update();
	}
});
function update() {
	$.ajax({
		cache : true,
		type : "POST",
		url : "/sys/dept/update",
		data : $('#signupForm').serialize(),// 你的formid
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
			}
		},
		messages : {
			name : {
				required : icon + "请输入名字"
			}
		}
	})
}