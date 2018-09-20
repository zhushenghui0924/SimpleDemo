var prefix = "/sys/user"
var deptId = '';
$(function() {
    getTreeData();
	load(deptId);
});

function load(deptId) {
	$('#exampleTable')
		.bootstrapTable(
			{
				method : 'post', // 服务器数据的请求方式 get or post
				url : prefix + "/list", // 服务器数据的加载地址
				// showRefresh : true,
				// showToggle : true,
				// showColumns : true,
				iconSize : 'outline',
				toolbar : '#exampleToolbar',
				striped : true, // 设置为true会有隔行变色效果
				dataType : "json", // 服务器返回的数据类型
				pagination : true, // 设置为true会在底部显示分页条
				// queryParamsType : "limit",
				// //设置为limit则会发送符合RESTFull格式的参数
				singleSelect : false, // 设置为true将禁止多选
				// contentType : "application/x-www-form-urlencoded",
				// //发送到服务器的数据编码类型
				pageSize : 10, // 如果设置了分页，每页数据条数
				pageNumber : 1, // 如果设置了分布，首页页码
                pageList: [10, 25, 50, 100,500,1000],//可供选择的每页的行数（*）
                // search : true, // 是否显示搜索框
                search : true, // 是否显示搜索框
                searchOnEnterKey: true, //回车查询
                showColumns : false, // 是否显示内容下拉框（选择显示的列）
                sidePagination : "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
                queryParams : function(params) {
                    var page ={
                        limit : params.limit,
                        offset : params.offset
                    };
                    var search={
                        searchValue:$('#searchValue').val(),
                        searchColumn:$('#searchColumn').val(),
                        orderBy:"id"
                    };
                    return {
                        //说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
                        // limit : params.limit,
                        // offset : params.offset,
                        // searchValue:$('#searchValue').val(),
                        // searchColumn:$('#sel_column').val(),
                        // startTime:$('#startTime').val(),
                        // endTime:$('#endTime').val(),
                        page:page,
                        search:search,
						t:window.deptId,
                    };
                },
				// //请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，例如 toolbar 中的参数 如果
				// queryParamsType = 'limit' ,返回参数必须包含
				// limit, offset, search, sort, order 否则, 需要包含:
				// pageSize, pageNumber, searchText, sortName,
				// sortOrder.
				// 返回false将会终止请求
				columns : [
					{
						checkbox : true,
                        searchable:false
					},
					{
						field : 'userId', // 列字段名
						title : '序号', // 列标题
                        searchable:false
					},
					{
						field : 'name',
						title : '姓名'
					},
					{
						field : 'username',
						title : '用户名'
					},
					{
						field : 'email',
						title : '邮箱'
					},
					{
						field : 'status',
						title : '状态',
						align : 'center',
						formatter : function(value, row, index) {
							if (value == '0') {
								return '<span class="label label-danger">禁用</span>';
							} else if (value == '1') {
								return '<span class="label label-primary">正常</span>';
							}
						}
					},
					{
						title : '操作',
						field : 'id',
						align : 'center',
						formatter : function(value, row, index) {
							var e = '<a  class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\''
								+ row.userId
								+ '\')"><i class="fa fa-edit "></i></a> ';
							var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="del(\''
								+ row.userId
								+ '\')"><i class="fa fa-remove"></i></a> ';
							var f = '<a class="btn btn-success btn-sm ' + s_resetPwd_h + '" href="#" title="重置密码"  mce_href="#" onclick="resetPwd(\''
								+ row.userId
								+ '\')"><i class="fa fa-key"></i></a> ';
							return e + d + f;
						}
					} ]
			});
}
function reLoad() {
	$('#exampleTable').bootstrapTable('refresh');
    // $('#jstree').jstree('select_node',deptId,true);
}
function reset() {
    $("#searchColumn option:first").prop("selected", 'selected');
    $("#searchValue").val("");
    $('#exampleTable').bootstrapTable('refresh');
}
function add() {
	// iframe层
	layer.open({
		type : 2,
		title : '增加用户',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '800px', '520px' ],
		content : prefix + '/add'
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
                    'id' : id
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
function edit(id) {
	layer.open({
		type : 2,
		title : '用户修改',
		maxmin : true,
		shadeClose : false,
		area : [ '800px', '520px' ],
		content : prefix + '/edit/' + id // iframe的url
	});
}
function resetPwd(id) {
	layer.open({
		type : 2,
		title : '重置密码',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '400px', '260px' ],
		content : prefix + '/resetPwd/' + id // iframe的url
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
function getTreeData() {
	$.ajax({
		type : "GET",
		url : "/sys/dept/tree",
		success : function(tree) {
			loadTree(tree);
		}
	});
}
function loadTree(tree) {
	$('#jstree').jstree({
		'core' : {
			'data' : tree
		},
		"plugins" : [ "search" ]
	});
	$('#jstree').jstree().open_all();
}
$('#jstree').on("changed.jstree", function(e, data) {
	if (data.selected == -1) {
		$('#exampleTable').bootstrapTable('refresh');
	} else {
        deptId=data.selected[0];
        $('#exampleTable').bootstrapTable('refresh');
	}

});