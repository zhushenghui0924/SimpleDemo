$().ready(function() {
	validateRule();
    initToolTips();
});

$.validator.setDefaults({
	submitHandler : function() {
		save();
	}
});
function save() {
    swal.queue([{
        title: "确认保存数据?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "确定！",
        confirmButtonColor: "#ec6c62",
        cancelButtonText: "容我三思!",
        showLoaderOnConfirm: true,
        preConfirm: function () {
            return new Promise(function (resolve) {
                $.ajax({
                    cache : true,
                    type : "POST",
                    url : "/common/dict/save",
                    data : $('#signupForm').serialize(), // 你的formid
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
            })
        }
    }])
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

//使用ToolTip提示组件
function initToolTips() {
    let tooltips = $( "[title]" ).tooltip();
}