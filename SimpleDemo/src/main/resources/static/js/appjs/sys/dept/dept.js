
var prefix = "/sys/dept"
$(function() {
	load();
});

function load() {
	$('#exampleTable')
		.bootstrapTreeTable(
			{
				id : 'deptId',
				code : 'deptId',
                parentCode : 'parentId',
                type : "post", // 请求数据的ajax类型
				url : prefix + '/list', // 请求数据的ajax的url
				expandColumn : '1', // 在哪一列上面显示展开按钮
				striped : true, // 是否各行渐变色
				bordered : true, // 是否显示边框
				expandAll : false, // 是否全部展开
				// toolbar : '#exampleToolbar',
				columns : [
					{
						title : '编号',
						field : 'deptId',
						visible : false,
						align : 'center',
						valign : 'center',
						width : '50px',
						checkbox : true
					},
					{
						field : 'name',
						title : '部门名称',
                        valign : 'center',
						witth :20
					},
					{
						field : 'orderNum',
						title : '排序',
                        align : 'center',
                        valign : 'center',
					},
					{
						field : 'delFlag',
						title : '状态',
						align : 'center',
                        valign : 'center',
						formatter : function(item, index) {
							if (item.delFlag == '0') {
								return '<span class="label label-danger">禁用</span>';
							} else if (item.delFlag == '1') {
								return '<span class="label label-primary">正常</span>';
							}
						}
					},
					{
						title : '操作',
						field : 'id',
						align : 'center',
                        valign : 'center',
						formatter : function(item, index) {
							var e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\''
								+ item.deptId
								+ '\')"><i class="fa fa-edit"></i></a> ';
							var a = '<a class="btn btn-primary btn-sm ' + s_add_h + '" href="#" title="增加下級"  mce_href="#" onclick="add(\''
								+ item.deptId
								+ '\')"><i class="fa fa-plus"></i></a> ';
							var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="del(\''
								+ item.deptId
								+ '\')"><i class="fa fa-remove"></i></a> ';
							var f = '<a class="btn btn-success btn-sm＂ href="#" title="备用"  mce_href="#" onclick="resetPwd(\''
								+ item.deptId
								+ '\')"><i class="fa fa-key"></i></a> ';
							return e + a + d;
						}
					} ]
			});
}
function reLoad() {
	load();
}
function add(pId) {
	layer.open({
		type : 2,
		title : '增加',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '800px', '520px' ],
		content : prefix + '/add/' + pId
	});
}
function edit(id) {
	layer.open({
		type : 2,
		title : '编辑',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '800px', '520px' ],
		content : prefix + '/edit/' + id // iframe的url
	});
}
function del(id) {
    swal({
        title: "确定要删除选中的记录？",
        text: "删除后无法恢复!",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "是的，我要删除！",
        confirmButtonColor: "#ec6c62",
        cancelButtonText: "容我三思!"
    }).then(function (isConfirm) {
        if (isConfirm.value){
            $.ajax({
                url : prefix + "/remove",
                type : "post",
                data : {
                    'deptId' : id
                },
                success : function(r) {
                    if (r.code == 0) {
                        swal({title:"删除成功!",
                            text:r.msg,
                            type:"success"}).then(function () {
                            reLoad();
                        });
                    } else {
                        swal("出错啦。。。", r.msg, "error");
                    }
                },
                error: function () {  // ajax请求失败
                    swal("啊哦。。。", "服务器被外星人攻占了。。。", "error");
                }
            });
        }
    });
}
function batchRemove() {
	var rows = $('#exampleTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
    if (rows.length == 0) {
        swal("请选择要删除的数据","至少选择一行!", "warning");
        return;
    }
    swal({
        title: "确认要删除选中的'" + rows.length + "'条数据吗?",
        text: "删除后无法恢复!",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "是的，我要删除！",
        confirmButtonColor: "#ec6c62",
        cancelButtonText: "容我三思!"
    }).then(function (isConfirm) {
        if (isConfirm.value){
            var ids = new Array();
            // 遍历所有选择的行数据，取每条数据对应的ID
            $.each(rows, function(i, row) {
                ids[i] = row['id'];
            });
            $.ajax({
                type : 'POST',
                data : {
                    "ids" : ids
                },
                url : prefix + '/batchRemove',
                success : function(r) {
                    if (r.code == 0) {
                        swal({title:"删除成功!",
                            text:r.msg,
                            type:"success"}).then(function () {
                            reLoad();
                        });
                    } else {
                        swal("出错啦。。。", r.msg, "error");
                    }
                },
                error: function () {  // ajax请求失败
                    swal("啊哦。。。", "服务器被外星人攻占了。。。", "error");
                }
            });
        }
    });
}

