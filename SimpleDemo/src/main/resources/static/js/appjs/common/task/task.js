var prefix = "/common/task"
$(function () {
    load();
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
                sidePagination : "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
                queryParams: function (params) {
                    var page ={
                        limit : params.limit,
                        offset : params.offset
                    };
                    var search={
                        searchValue:$('#searchValue').val(),
                        searchColumn:$('#searchColumn').val()
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
                        field: 'id',
                        title: 'id',
                        searchable:false
                    },
                    {
                        field: 'jobName',
                        title: '任务名称'
                    },
                    {
                        field: 'jobGroup',
                        title: '任务分组'
                    },
                    {
                        field: 'beanClass',
                        title: '任务类'
                    },
                    {
                        field: 'cronExpression',
                        title: 'cron表达式'
                    },
                    {
                        field: 'methodName',
                        title: '方法名称'
                    },
                    {
                        visible: false,
                        field: 'isConcurrent',
                        title: '任务是否有状态'
                    },
                    {
                        field: 'description',
                        title: '任务描述'
                    },
                    {
                        field: 'updateBy',
                        title: '更新者',
                        searchable:false
                    },

                    {
                        field: 'createDate',
                        title: '创建时间',
                        searchable:false
                    },


                    {
                        field: 'updateDate',
                        title: '更新时间',
                        searchable:false
                    },
                    {
                        field: 'createBy',
                        title: '创建者',
                        searchable:false
                    },
                    {
                        visible: false,
                        field: 'springBean',
                        title: 'Spring bean'
                    },

                    {
                        field: 'jobStatus',
                        title: '停起操作',
                        searchable:false,
                        formatter: function (value, row, index) {
                            var e = '<a class="btn btn-success btn-xs" href="#" mce_href="#" title="点击开启" onclick="changeStatus(\''
                                + row.id + '\',\'' + row.jobStatus
                                + '\')"><i class="fa fa-hourglass-start"></i>开启</a> ';
                            var f = '<a class="btn btn-danger btn-xs" href="#" mce_href="#" title="点击关闭" onclick="changeStatus(\''
                                + row.id + '\',\'' + row.jobStatus
                                + '\')"><i class="fa fa-square-o">关闭</i></a> ';
                            if (row.jobStatus == 0) {
                                return e;
                            } else {
                                return f;
                            }

                        }
                    },

                    {
                        title: '操作',
                        field: 'id',
                        align: 'center',
                        searchable:false,
                        formatter: function (value, row, index) {
                            var e = '<a class="btn btn-primary btn-sm" href="#" mce_href="#" title="编辑" onclick="edit(\''
                                + row.id + '\',\'' + row.jobStatus
                                + '\')"><i class="fa fa-edit"></i></a> ';
                            var d = '<a class="btn btn-warning btn-sm" href="#" title="删除"  mce_href="#" onclick="del(\''
                                + row.id
                                + '\')"><i class="fa fa-remove"></i></a> ';
                            var f = '<a class="btn btn-success btn-sm" href="#" title="开启"  mce_href="#" onclick="resetPwd(\''
                                + row.id
                                + '\')"><i class="fa fa-key"></i></a> ';
                            return e + d;
                        }
                    }]
            });
}

function reLoad() {
    $('#exampleTable').bootstrapTable('refresh');
}

function reset() {
    $("#searchColumn option:first").prop("selected", 'selected');
    $("#searchValue").val("");
    $('#exampleTable').bootstrapTable('refresh');
}

function add() {
    layer.open({
        type: 2,
        title: '增加',
        maxmin: true,
        shadeClose: false, // 点击遮罩关闭层
        area: ['800px', '520px'],
        content: prefix + '/add' // iframe的url
    });
}

function edit(id, status) {
    if (status == '1') {
        swal({title:"修改之前请先停止任务!",type:"warning"});
        return;
    }
    layer.open({
        type: 2,
        title: '编辑',
        maxmin: true,
        shadeClose: false, // 点击遮罩关闭层
        area: ['800px', '520px'],
        content: prefix + '/edit/' + id // iframe的url
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
        }
    });
}

function changeStatus(id, status) {
    var actCh;
    var cmd;
    var type;
    if (status == 0) {
        cmd = 'start';
        actCh = "确认要开启任务吗？";
        type="开启";
    } else {
        cmd = 'stop';
        actCh = "确认要停止任务吗？";
        type="停止";
    }
    swal({
        title: actCh,
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "是的，我要"+type+"!",
        confirmButtonColor: "#ec6c62",
        cancelButtonText: "容我三思!"
    }).then(function (isConfirm) {
        if (isConfirm.value){
            $.ajax({
                url: prefix + "/changeJobStatus",
                type: "post",
                data: {
                    'id': id,
                    'cmd': cmd
                },
                success : function(r) {
                    if (r.code == 0) {
                        swal({title:type+"成功!",
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