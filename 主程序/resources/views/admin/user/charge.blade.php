@extends('admin._layoutNew')

@section('page-head')

@endsection

@section('page-content')
    <div style="margin-top: 10px;width: 100%;">
        
<style>
.layui-table-cell{ height:auto;}
.layui-table-cell .uacc{font-size:12px;line-height:1.5;}
</style>
        <form class="layui-form layui-form-pane layui-inline" action="">

            <div class="layui-inline">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" name="account_number" autocomplete="off" class="layui-input">
                </div>
            </div>
            
            <div class="layui-inline">
                <label class="layui-form-label">订单状态</label>
                <div class="layui-input-inline">
                   <select name="type"  class="layui-input">
                       <option value="">选择类型</option>
                       <option value="2">已处理</option>
                       <option value="1">未处理</option>
                   </select>
                </div>
            </div>
            
            
           <div class="layui-input-inline date_time111" style="margin-left: 50px;">
               <input type="text" name="start_time" id="start_time" placeholder="请输入开始时间" autocomplete="off" class="layui-input" value="">
           </div>
           <div class="layui-input-inline date_time111">
               <input type="text" name="end_time" id="end_time" placeholder="请输入结束时间" autocomplete="off" class="layui-input" value="">
           </div>
            
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <button class="layui-btn" lay-submit="" lay-filter="mobile_search"><i class="layui-icon">&#xe615;</i></button>
                </div>
            </div>
            



        </form>
       
    </div>

    <script type="text/html" id="switchTpl">
        <input type="checkbox" name="is_recommend" value="@{{d.id}}" lay-skin="switch" lay-text="是|否" lay-filter="sexDemo" @{{ d.is_recommend == 1 ? 'checked' : '' }}>
    </script>

    <table id="demo" lay-filter="test"></table>
    <script type="text/html" id="barDemo">
    
    <a class="layui-btn layui-btn-xs" lay-event="show">查看</a>
    
    </script>
    <script type="text/html" id="statustml">
        @{{d.status==1 ? '<span class="layui-badge layui-bg-green">'+'申请充值'+'</span>' : '' }}
        @{{d.status==2 ? '<span class="layui-badge layui-bg-red">'+'充值完成'+'</span>' : '' }}
        @{{d.status==3 ? '<span class="layui-badge layui-bg-black">'+'申请失败'+'</span>' : '' }}

    </script>
	<script type="text/html" id="ophtml">
        @{{d.status==1 ? '<button type="button" onclick="pass('+d.id+')">通过并加钱</button> <button type="button" onclick="passNoMoney('+d.id+')">通过不加钱</button> <button type="button" onclick="refuse('+d.id+')" data-id='+d.id+' class="btn-refuse">拒绝</button>' : '' }}
   

    </script>
@endsection

@section('scripts')
    <script>
        document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if(e && e.keyCode==13){ // enter 键
                $('#mobile_search').click();
            }
        };
        
        layui.use(['table','form','laydate'], function(){
            var table = layui.table;
            var $ = layui.jquery;
            var form = layui.form;
            var laydate = layui.laydate;
            
            laydate.render({
                elem: '#start_time'
            });
            laydate.render({
                elem: '#end_time'
            });
            
            $("body").on("click",".pzImg",function(){
                var img = $(this).attr("src");
                layer.open({
                  type: 1,
                  title:'大图',
                  content: '<img src="'+img+'" style="max-width:600px;max-height:600px;" />'
                });
            })
            
            var tableIns;
            
            form.on('submit(mobile_search)',function(obj){
                
                tableIns.reload({
                  where: obj.field
                  ,page: {
                    curr: 1 //重新从第 1 页开始
                  }
                });

                return false
            });
            
            //第一个实例
            tableIns = table.render({
                elem: '#demo'
                ,url: "{{url('admin/user/charge_list')}}" //数据接口
                ,page: true //开启分页
                ,id:'mobileSearch'
                ,cols: [[ //表头
                    {field: 'id', title: 'ID', width:70, sort: true}
                    ,{field: 'account_number', title: '用户名', minWidth:100}
                    ,{field: 'name', title: '虚拟币', width:80}
                    ,{field: 'user_account', title: '支付账号', minWidth:90,templet:function(d){
                        // if(d.currency_id==9999){
                        //     var arr = JSON.parse(d.user_account);
                        //     console.log(arr)
                        //     var html = "<div class='uacc'>";
                        //     html += "存款人："+arr[0]+"<br>汇款卡号："+arr[1]+"<br>汇款银行："+arr[2]+"<br>汇款日期："+arr[3]+"<br>汇款凭证：<img src='"+arr[4]+"' width='60' class='pzImg' />";
                        //     html += "</div>";
                        //     return html;
                        // }else{
                            return d.user_account
                        // }
                    }}
             
                    // ,{field: 'address', title: '提币地址', minWidth:100}
                    ,{field: 'amount', title: '数量', minWidth:80}
                    // ,{field: 'hes_account', title: '承兑商交易账号', minWidth:180}
                    // ,{field: 'money', title: '交易额度', minWidth:100}
                    ,{field: 'status', title: '交易状态', minWidth:100, templet: '#statustml'}
                    ,{field: 'daozhang_num', title: '到账数量', minWidth:80} 
                    ,{field: 'created_at', title: '提币时间', minWidth:180}
                    ,{title:'充值图片', minWidth:110,templet:function(d){
                            if(d.img == 0 ){
                                var html = "<div class='uacc'>";
                                html += "没有上传图片";
                                html += "</div>";
                                return html;
                                
                            }else{
                                var html = "<div class='uacc'>";
                                html += "<img src='"+d.img+"' width='60' class='pzImg' />";
                                html += "</div>";
                                return html;
                            }
                       
                    }}
                    ,{title:'操作',minWidth:120,templet: '#ophtml'}

                ]]
            });
            //监听热卖操作
            // form.on('switch(sexDemo)', function(obj){
            //     var id = this.value;
            //     $.ajax({
            //         url:'{{url('admin/product_hot')}}',
            //         type:'post',
            //         dataType:'json',
            //         data:{id:id},
            //         success:function (res) {
            //             if(res.error != 0){
            //                 layer.msg(res.msg);
            //             }
            //         }
            //     });
            // });
		})
		function pass(id){
        
          $.ajax({
				url:'{{url('admin/user/pass_req')}}',
				type:'post',
				dataType:'json',
				data:{id:id},
				success:function (res) {
                     if(res.type == 'ok'){
                         layer.msg(res.message);
                         setTimeout(function(){
                             window.location.reload(); 
                         },1200)
                     }
                 }
		   })
		}
    function passNoMoney(id){
        
          $.ajax({
        url:'{{url('admin/user/pass_req_no_money')}}',
        type:'post',
        dataType:'json',
        data:{id:id},
        success:function (res) {
                     if(res.type == 'ok'){
                         layer.msg(res.message);
                         setTimeout(function(){
                             window.location.reload(); 
                         },1200)
                     }
                 }
       })
    }
		   function refuse(id){
          $.ajax({
				url:'{{url('admin/user/refuse_req')}}',
				type:'post',
				dataType:'json',
				data:{id:id},
				success:function (res) {
                   if(res.type == 'ok'){
                         layer.msg(res.message);
                         setTimeout(function(){
                             window.location.reload(); 
                         },1200)
                     }
                 }
		   })
		  }
		   
            //监听提交
            
    </script>

@endsection