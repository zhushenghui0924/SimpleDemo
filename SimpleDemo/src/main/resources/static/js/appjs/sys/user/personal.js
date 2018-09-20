var prefix = "/sys/user"
$(function () {
    laydate({
        elem : '#birth'
    });
});
/**
 * 基本信息提交
 */
$("#base_save").click(function () {
    var hobbyStr = getHobbyStr();
    $("#hobby").val(hobbyStr);
    if($("#basicInfoForm").valid()){
            $.ajax({
                cache : true,
                type : "POST",
                url :"/sys/user/updatePeronal",
                data : $('#basicInfoForm').serialize(),
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

});
$("#pwd_save").click(function () {
    if($("#modifyPwd").valid()){
        $.ajax({
            cache : true,
            type : "POST",
            url :"/sys/user/resetPwd",
            data : $('#modifyPwd').serialize(),
            async : false,
            error : function(request) {
                swal({title:"Connection error!",text:"网络异常!",type:"warning"});
            },
            success : function(r) {
                if (r.code == 0) {
                    swal({title:"更新密码成功!",
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
});
function getHobbyStr(){
    var hobbyStr ="";
    $(".hobby").each(function () {
        if($(this).is(":checked")){
            hobbyStr+=$(this).val()+";";
        }
    });
   return hobbyStr;
}