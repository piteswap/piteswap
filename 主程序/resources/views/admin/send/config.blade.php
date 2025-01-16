@extends('admin._layoutNew')

@section('page-head')

@endsection

@section('page-content')
	 <div class="layui-fluid">
        <div class="layui-card">
            <div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="layadmin-userfront-formlist">
                <div class="layui-form-item">
                    
                    <button class="layui-btn layui-btn-normal layui-btn-radius" id="add_project">添加</button>
                </div>
            </div>

    <table id="data_table" lay-filter="data_table"></table>
@endsection
@section('scripts')
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
        <button class="layui-btn layui-btn-xs" lay-event="update">是否首页推荐</button>
    </script>
    <script>
         $('#add_project').click(function() {
                var index = layer.open({
                    title:'添加'
                    ,type:2
                    ,content: '/admin/send/config/add/view'
                    ,area: ['100%', '100%']
                    ,maxmin: true
                    ,anim: 3
                });
            });
        let url=window.location.href;
        let configId="";
        if(url.indexOf("id")!=-1){
            configId=url.substr(url.lastIndexOf("/")+1);
        }
      
        layui.use(['table', 'layer', 'form'], function() {
            var table = layui.table
                ,layer = layui.layer
                ,form = layui.form
                ,$ = layui.$
            var data_table = table.render({
                elem: '#data_table'
                ,url: '/admin/send/config'
                ,height: 'full'
                ,toolbar: 'false'//'default'
                ,page: true
                ,limits:[10,20,30]
                ,cols: [[
                    //{type: 'radio'}
                    {field: 'new_currency_name', title: '新币名称'}
                    ,{field: 'currency_name', title: '兑换币'}
                    ,{field: 'change_rate', title: '兑换率'}
                    ,{field: 'send_start', title: '申购开始时间'}
                    ,{field: 'online_time', title: '预计上线时间'}
                    ,{field: 'day', title: '锁仓时间'}
                    ,{field: 'num', title: '申购总数量'}
                    ,{field: 'buy_num', title: '最小购买数量'}
                    ,{field: 'last_num', title: '剩余数量'}
                    ,{field: 'interest_rate', title: '总收益'}
                    ,{field: 'created_at', title: '创建时间'}
                    ,{field: 'status', title: '是否首页推荐',templet:function(d){
                            if(d.is_recommend==1){
                                return '<span style="color:#5fb878">是</span>';
                            }
                            if(d.is_recommend==2){
                                return '<span style="color:#f00">否</span>';
                            }
                            return '';
                        }}
                    ,{fixed: 'right', title: '操作', minWidth: 200, align: 'center', toolbar: '#barDemo'}
                ]]
            });
            table.on('tool(data_table)', function (obj) {
                var data = obj.data;
                var layEvent = obj.event;
                var tr = obj.tr;
                var selected = table.checkStatus('data_table')
                if (layEvent === 'delete') { //删除
                    layer.confirm('真的要删除吗？', function (index) {
                        //向服务端发送删除指令
                        $.ajax({
                            url: "/admin/send/config/delete",
                            type: 'post',
                            dataType: 'json',
                            data: {id: data.id},
                            success: function (res) {
                                if (res.type == 'ok') {
                                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                    layer.close(index);
                                } else {
                                    layer.close(index);
                                    layer.alert(res.message);
                                }
                            }
                        });
                    });
                }
                 if(layEvent === 'edit'){
                        /*if (selected.data.length != 1) {
                            layer.msg('请先选中要编辑的行');
                            return false;
                        }
                        id = selected.data[0].id
                        var data=selected.data[0];*/
                        id = data.id
                        layer.open({
                            title: '编辑'
                            ,type: 2
                            ,content: '/admin/send/config/edit/view?id='+id
                            ,area: ['800px', '700px']
                        });
                    
                 }
                if (layEvent === 'update') {
                    var index = layer.open({
                        title: '是否推荐到首页'
                        ,type: 2
                        ,content: '/admin/send/recommend?id=' + data.id
                        ,maxmin: true
                        ,area:["800px", "500px"],
                    });
                }
            });
          
        });
    </script>
@endsection
