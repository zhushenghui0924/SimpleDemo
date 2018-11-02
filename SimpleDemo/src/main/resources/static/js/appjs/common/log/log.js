let prefix = "/common/log"
$(function () {
    load();
});
$('#exampleTable').on('load-success.bs.table', function (e, data) {
    if (data.total && !data.rows.length) {
        $('#exampleTable').bootstrapTable('selectPage').bootstrapTable('refresh');
    }
});

function load() {
    $('#exampleTable')
        .bootstrapTable(
            {
                method: 'post', // 服务器数据的请求方式 get or post
                url: prefix + "/list", // 服务器数据的加载地址
                // showRefresh : true,
                // showToggle : true,
                // showColumns : true,
                iconSize: 'outline',
                toolbar: '#exampleToolbar',
                striped: true, // 设置为true会有隔行变色效果
                dataType: "json", // 服务器返回的数据类型
                pagination: true, // 设置为true会在底部显示分页条
                // queryParamsType : "limit",
                // //设置为limit则会发送符合RESTFull格式的参数
                singleSelect: false, // 设置为true将禁止多选
                // contentType : "application/x-www-form-urlencoded",
                // //发送到服务器的数据编码类型
                pageSize: 10, // 如果设置了分页，每页数据条数
                pageNumber: 1, // 如果设置了分布，首页页码
                pageList: [10, 25, 50, 100,500,1000],//可供选择的每页的行数（*）
                search : true, // 是否显示搜索框
                searchOnEnterKey: true, //回车查询
                showColumns : false, // 是否显示内容下拉框（选择显示的列）
                sidePagination: "server", // 设置在哪里进行分页，可选值为"client" 或者
                // "server"
                queryParams: function (params) {
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
                columns: [
                    {
                        checkbox: true,
                        searchable:false
                    },
                    {
                        field: 'id', // 列字段名
                        title: '序号' ,// 列标题
                        searchable:false
                    },
                    {
                        field: 'userId',
                        title: '用户Id',
                        searchable:false
                    },
                    {
                        field: 'username',
                        title: '用户名'
                    },
                    {
                        field: 'operation',
                        title: '操作'
                    },
                    {
                        field: 'responseTime',
                        title: '用时',
                        searchable:false
                    },
                    {
                        field: 'method',
                        title: '方法'
                    },
                    {
                        field: 'params',
                        title: '参数'
                    },
                    {
                        field: 'ip',
                        title: 'IP地址'
                    },
                    {
                        field: 'createTime',
                        title: '创建时间'
                    },
                    {
                        title: '操作',
                        field: 'id',
                        align: 'center',
                        searchable:false,
                        formatter: function (value, row, index) {
                            let d = '<a class="btn btn-warning btn-sm" href="#" title="删除"  mce_href="#" onclick="del(\''
                                + row.id
                                + '\')"><i class="fa fa-remove"></i></a> ';
                            return d;
                        }
                    }]
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
                    url: prefix + "/remove",
                    type: "post",
                    data: {
                        'id': id
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
