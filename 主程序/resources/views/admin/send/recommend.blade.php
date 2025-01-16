@extends('admin._layoutNew')

@section('page-head')

@endsection

@section('page-content')
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">新币名称</label>
            <div class="layui-input-block">
                <input type="text" name="new_currency_name" readonly="readonly" value="{{$model->new_currency_name}}" required autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">是否推荐到首页</label>
                <div class="layui-input-block">
                <input type="radio" name="is_recommend" class="sports" value="1" title="是" {{ $model->is_recommend== 1 ? 'checked' : '' }}>
                <input type="radio" name="is_recommend" class="sports" value="2" title="否" {{ $model->is_recommend== 2 ? 'checked' : '' }}>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">推荐标题</label>
                <div class="layui-input-block">
                    <input type="text" name="recommend_title" id="recommend_title" value="{{$model->recommend_title}}"  required autocomplete="off"   class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">推荐内容</label>
                <div class="layui-input-block">
                    <input type="text" name="recommend_content" id="recommend_content" value="{{$model->recommend_content}}" required autocomplete="off"   class="layui-input">
                </div>
            </div>
        </div>
        <input type="hidden" name="id" value="{{$model->id}}">
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
                    url:'{{url('admin/send/update_recommend')}}'
                    ,type:'post'
                    ,dataType:'json'
                    ,data : data
                    ,success:function(res) {
                        if(res.type=='error'){
                            layer.msg(res.message);
                        }else{
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