@extends('admin._layoutNew')

@section('page-head')
<style>
    p.percent {
        text-align: right;
        margin-right: 10px;
    }
    p.percent::after {
        content: '%';
    }
</style>
@endsection

@section('page-content')
    <form class="layui-form layui-form-pane layui-inline" action="">

        <div class="layui-inline" style="margin-left: 50px;">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="search" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <div class="layui-input-inline">
                <button class="layui-btn" lay-submit="" lay-filter="mobile_search"><i class="layui-icon">&#xe615;</i></button>
            </div>
        </div>



    </form>
    <table id="demo" lay-filter="demo"></table>
@endsection

@section('scripts')
    <script type="text/html" id="barDemo">
        <button class="layui-btn layui-btn-xs" lay-event="update">申购审核</button>
    </script>
    <script>
        layui.use(['table','form','laydate'], function(){
            var table = layui.table;
            var $ = layui.jquery;
            var form = layui.form;
            var laydate = layui.laydate;
            //第一个实例
            table.render({
                elem: '#demo'
                ,toolbar: '#toolbar'
                ,url: '{{url('admin/send/order/list')}}' //数据接口
                ,page: true //开启分页
                ,id:'mobileSearch'
                ,cols: [[ //表头
                    {field: 'id', title: 'ID', width:60, sort: true}
                    ,{field: 'account_number', title: '账号', minWidth:80}
                    ,{field: 'new_currency_name', title: '新币名称', minWidth:80}
                    ,{field: 'amount', title: '购买数量', minWidth:80}
                    ,{field: 'new_currency_num', title: '新币数量', minWidth:80}
                    ,{field: 'remain_day', title: '剩余天数', minWidth:80}
                    ,{field: 'interest', title: '总收益', minWidth:80}
                    ,{field: 'status', title: '状态', minWidth:80,templet:function(d){
                        if(d.status==1){
                           return '<span style="color:#5fb878">申购中</span>';
                        }
                        if(d.status==2){
                            return '赎回中';
                        }
                        if(d.status==3){
                            return '<span>已完成</span>';
                        }
                        if(d.status==4){
                            return '待审核';
                        }
                        if(d.status==5){
                            return '<span style="color:red">不通过</span>';
                        }
                        return '';
                    }}
                    ,{field: 'exam_status', title: '审核状态', minWidth:80,templet:function(d){
                        if (d.status==1){
                            if(d.exam_status==3){
                                return '待审核';
                            }
                            if(d.exam_status==2){
                                return '<span style="color:red">不通过</span>';
                            }
                            if(d.exam_status==1){
                                return '<span style="color:green">已审核</span>';
                            }
                        }
                            return '';
                    }}
                    ,{field: 'created_at', title: '申购时间', minWidth:80}
                    ,{fixed: 'right', title: '操作', minWidth: 80, align: 'center', toolbar: '#barDemo'}
                ]]
            });
            table.on('tool(demo)', function (obj) {
                var data = obj.data;
                var layEvent = obj.event;
                var tr = obj.tr;
                var selected = table.checkStatus('data_table')

                if (layEvent === 'update') {
                    var index = layer.open({
                        title: '申购审核'
                        ,type: 2
                        ,content: '/admin/send/check/order?id=' + data.id
                        ,maxmin: true
                        ,area:["400px", "300px"],
                    });
                }
            });
            //监听提交
            form.on('submit(mobile_search)', function(data){
                var search = data.field.search;
                table.reload('mobileSearch',{
                    where:{search:search},
                    page: {curr: 1}         //重新从第一页开始
                });
                return false;
            });
        });
    </script>
@endsection