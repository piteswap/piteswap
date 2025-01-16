@extends('agent.layadmin')

@section('page-head')

@endsection

@section('page-content')

    <div class="layui-fluid">
        <div class="layui-card">
            <div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="layadmin-userfront-formlist">
                <div class="layui-form-item">
                    <!--<div class="layui-inline">-->
                    <!--    <label class="layui-form-label">ID</label>-->
                    <!--    <div class="layui-input-block">-->
                    <!--        <input type="text" name="id" placeholder="请输入" autocomplete="off" class="layui-input">-->
                    <!--    </div>-->
                    <!--</div>-->
                    <div class="layui-inline">
                        <label class="layui-form-label">用户</label>
                        <div class="layui-input-block">
                            <input type="text" name="serach" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                   
                    <div class="layui-inline">
                        <button class="layui-btn layuiadmin-btn-useradmin" lay-submit lay-filter="searchtj">
                            <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="layui-card-body">

                <table id="boss" lay-filter="boss"></table>
            </div>
        </div>
    </div>

@endsection

@section('scripts')
    <script type="text/html" id="barDemo">
     @{{# if (d.is_unlock ==0) { }}
           <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="peishou"><i class="layui-icon layui-icon-friends"></i>解冻</a>
       @{{# } }}

    </script>

    <script>
     let id='';
    let url=window.location.href;
    if(url.indexOf("=")!=-1){
        id=url.substr(url.indexOf("=")+1);
    }
        layui.use(['table','form'], function(){
            // console.log(layui.setter.base)
            var table = layui.table;
            var $ = layui.jquery;
            var form = layui.form;

             //第一个实例
            table.render({
                elem: '#boss'
                ,url: '/admin/currency/project/order/list?project_id='+id //数据接口
                ,page: true //开启分页
                ,id:'mobileSearch'
                ,cols: [[ //表头
                  

                    {field: 'id', title: 'ID', width:80, sort: true}

                    ,{field: 'account_number', title: '用户', width:150}
                     ,{field: 'coin_amount', title: '申购数量', width:100}
                     ,{field: 'price', title: '价格', width:100}
                    ,{field:'total_price',title: '扣除余额', width:100}
                   ,{field:'pay_currency_name',title: '扣除币种', width:100}
                    ,{field: 'created_at', title: '创建时间',width:150}
                    ,{field: 'end_at', title: '到期时间',width:150}
                     ,{ title: '是否解冻',templet:function(d){

                            if(d.is_unlock==1){
                                return '<span style="color:#00c087">是</span>';
                            }else if(d.is_unlock==0){
                                return '<span style="color:#f00">否</span>';
                            }
                        }
                    }
                     ,{title:'操作',minWidth:100,toolbar: '#barDemo'}
                ]]
            });
            //监听提交
            form.on('submit(searchtj)', function(data){
                // var seller_name = data.field.seller_name
                var account_number = data.field.search;
                    
                    // ,currency_id = $('#currency_id').val()

                table.reload('mobileSearch',{
                    where:{
                        // is_cancel:is_cancel,
                       
                        account_number:account_number
                    
                        // currency_id:currency_id,
                    },
                    page: {curr: 1}         //重新从第一页开始
                });
                return false;
            });
            //
            table.on('tool(boss)', function(obj){
              var data = obj.data;
            if(obj.event === 'peishou'){
            layer.confirm('确定解冻?', function (index) {
                    var loading = layer.load(1, {time: 30 * 1000});
                    layer.close(index);
                    $.ajax({
                        url: '/admin/currency/project/unlock_order'
                        ,type: 'get'
                        ,data: {id: data.id}
                        ,success: function (res) {
                            if(res.type=='error') {
                                layer.msg(res.message);
                            } else {
                                layer.msg(res.message);
                                //parent.layer.close(index);
                            }
                        }
                        ,error: function () {
                            layer.msg('网络错误');
                        }
                        ,complete: function () {
                            layer.close(loading);
                        }
                    });
                });
            }
            });
          
        });
    </script>

@endsection
