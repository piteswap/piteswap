@extends('admin._layoutNew')

@section('page-head')

@endsection

@section('page-content')
    <form class="layui-form" action="">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">申购审核</label>
                <div class="layui-input-block">
                <input type="radio" name="status" class="sports" value="1" title="是" checked >
                <input type="radio" name="status" class="sports" value="2" title="否" >
                </div>
            </div>

        </div>
        <input type="hidden" name="id" value="{{$id}}">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">修改</button>
            </div>
        </div>
    </form>

@endsection

@section('scripts')
    <script>
         layui.use(['form', 'laydate'],function () {
            var form = layui.form
                ,$ = layui.jquery
                ,laydate = layui.laydate
                ,index = parent.layer.getFrameIndex(window.name);
            //监听提交
            form.on('submit(demo1)', function(data) {
                var data = data.field;
                $.ajax({
                    url:'{{url('admin/send/update/order')}}'
                    ,type:'post'
                    ,dataType:'json'
                    ,data : data
                    ,success:function(res) {
                        if(res.type=='error'){
                            layer.msg(res.message);
                        }else{
                            layer.msg(res.message);
                            parent.layer.close(index);
                            parent.window.location.reload();
                        }
                    }
                });
                return false;
            });
        });
    </script>
@endsection