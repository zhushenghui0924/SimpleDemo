let prefix = "/common/dict"
$(function() {
	load();
});
function load() {
	$('#exampleTable')
		.bootstrapTable(
			{
				method : 'post', // 服务器数据的请求方式 get or post
				url : prefix + "/list", // 服务器数据的加载地址
				//	showRefresh : true,
				//	showToggle : true,
				//	showColumns : true,
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
				search : true, // 是否显示搜索框
                searchOnEnterKey: true, //回车查询
				showColumns : false, // 是否显示内容下拉框（选择显示的列）
				sidePagination : "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
				queryParams : function(params) {
                    let searchConditionJson ={};
                    let searchColumn = $('#searchColumn').val()
                    searchConditionJson[searchColumn]=$('#searchValue').val();
                    let page ={
                        limit : params.limit,
                        offset : params.offset
                    };
                    let search={
                        searchConditionJson:searchConditionJson,
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
						search:search
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
						field : 'id',
						title : '编号',
                        searchable:false
					},
					{
						field : 'name',
						title : '标签名'
					},
					{
						field : 'value',
						title : '数据值',
						width : '100px'
					},
					{
						field : 'type',
						title : '类型'
					},
					{
						field : 'description',
						title : '描述'
					},
					{
						visible : false,
						field : 'sort',
						title : '排序（升序）',
                        searchable:false
					},
					{
						visible : false,
						field : 'parentId',
						title : '父级编号',
                        searchable:false
					},
					{
						visible : false,
						field : 'createBy',
						title : '创建者',
                        searchable:false
					},
					{
						field : 'createTime',
						title : '创建时间'
					},
					{
						field : 'updateBy',
						title : '更新者'
					},
					{
						field : 'updateTime',
						title : '更新时间'
					},
					{
						field : 'remarks',
						title : '备注信息'
					},
					{
						visible : false,
						field : 'delFlag',
						title : '删除标记',
                        searchable:false
					},
					{
						title : '操作',
						field : 'id',
                        searchable:false,
						align : 'center',
						formatter : function(value, row, index) {
                            let e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\''
								+ row.id
								+ '\')"><i class="fa fa-edit"></i></a> ';
                            let d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="del(\''
								+ row.id
								+ '\')"><i class="fa fa-remove"></i></a> ';
                            let f = '<a class="btn btn-success btn-sm ' + s_add_h + '" href="#" title="增加"  mce_href="#" onclick="add(\''
								+ row.type +'\',\''+row.description
								+ '\')"><i class="fa fa-plus"></i></a> ';
							return e + d +f;
						}
					} ]
			});
}
function reLoad() {
    $('#exampleTable').bootstrapTable('resetView');// 重置表头
	$('#exampleTable').bootstrapTable('refresh');
}

function reset() {
    $("#searchColumn option:first").prop("selected", 'selected');
    $("#searchValue").val("");
    $('#exampleTable').bootstrapTable('refresh');
}

function add() {
	layer.open({
		type : 2,
		title : '增加',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '800px', '520px' ],
		content : prefix + '/add' // iframe的url
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
    swal.queue([{
        title: "确定要删除选中的记录？",
        text: "删除后无法恢复!",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "是的，我要删除！",
        confirmButtonColor: "#ec6c62",
        cancelButtonText: "容我三思!",
        showLoaderOnConfirm: true,
        preConfirm: function () {
            return new Promise(function (resolve) {
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
            })
        }
    }])
}

function batchRemove() {
	let rows = $('#exampleTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
	if (rows.length == 0) {
        swal("请选择要删除的数据","至少选择一行!", "warning");
		return;
	}
    swal.queue([{
        title: "确认要删除选中的'" + rows.length + "'条数据吗?",
        text: "删除后无法恢复!",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "是的，我要删除！",
        confirmButtonColor: "#ec6c62",
        cancelButtonText: "容我三思!",
        showLoaderOnConfirm: true,
        preConfirm: function () {
            return new Promise(function (resolve) {
                let ids = new Array();
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
            })
        }
    }])
}
