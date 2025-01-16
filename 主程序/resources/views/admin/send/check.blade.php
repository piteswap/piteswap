@extends('admin._layoutNew')

@section('page-head')

@endsection

@section('page-content')

    <div class="layui-inline">
        <label class="layui-form-label">用户帐号</label>
        <div class="layui-input-inline">
            <input type="text" name="account" placeholder="用户账号或者邮箱" autocomplete="off" class="layui-input" value="">
        </div>
        <div class="layui-inline" style="margin-left: 10px;">
            <label>审核状态</label>
            <div class="layui-input-inline" style="width: 90px">
                <select name="status" id="status" class="layui-input">
                    <option value="0">所有</option>
                    <option value="1">未审核</option>
                    <option value="2">已审核</option>
                </select>
            </div>
        </div>
        <button class="layui-btn btn-search" id="mobile_search" lay-submit lay-filter="mobile_search"> <i class="layui-icon">&#xe615;</i> </button>
    </div>
    
        <table id="userlist" lay-filter="userlist"></table>
      
        <script type="text/html" id="switchTpl">
        <input type="checkbox" name="status" value="@{{d.id}}" lay-skin="switch" lay-text="是|否" lay-filter="sexDemo" @{{ d.status == 2 ? 'checked' : '' }} >
        </script>


@endsection

        @section('scripts')
            <script>
                window.onload = function() {
                    document.onkeydown=function(event){
                        var e = event || window.event || arguments.callee.caller.arguments[0];
                        if(e && e.keyCode==13){ // enter 键
                            $('#mobile_search').click();
                        }
                    };
                    layui.use(['element', 'form', 'layer', 'table'], function () {
                        var element = layui.element;
                        var layer = layui.layer;
                        var table = layui.table;
                        var $ = layui.$;
                        var form = layui.form;


                        form.on('submit(mobile_search)',function(obj){
                            var account =  $("input[name='account']").val();
                            var status =  $("select[name='status']").val();

                            tbRend("{{url('/admin/send/check/list')}}?account="+account+"&status="+status);
                            return false;
                        });

                        function tbRend(url) {
                            table.render({
                                elem: '#userlist'
                                , url: url
                                , page: true
                                ,limit: 20
                                , cols: [[
                                    {field: 'user_id', title: '用户ID'}
                                    , {field:'user_name',title: '用户账号'}
                                    , {field:'currency_name',title: '申请币种'}
                                    , {field:'created_at',title:'申请时间'}
                                    ,{field:'status', title:'是否审核', templet: '#switchTpl'}
                                ]]
                            });
                        }
                        tbRend("{{url('/admin/send/check/list')}}");

                        //监听审核操作
                        form.on('switch(sexDemo)', function(obj){
                            var id = this.value;
                            
                            $.ajax({
                                url:'{{url('admin/send/check/update')}}',
                                type:'post',
                                dataType:'json',
                                data:{id:id},
                                success:function (res) {
                                    layer.msg(res.message);
                                }
                            });
                        });
                    });
                }
            </script>

@endsection