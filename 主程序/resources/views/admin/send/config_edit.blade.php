@extends('admin._layoutNew')

@section('page-head')
    <style>
        .layui-form-label {
            width: 150px;
        }
        .layui-input-block {
            margin-left: 180px;
        }
    </style>
@endsection

@section('page-content')
    <form class="layui-form" action="">
        <input type="hidden" id="id" data-type="0" >
        <div class="layui-form-item">
            <label class="layui-form-label">新币名称</label>
            <div class="layui-input-block">
                <input type="text" name="new_currency_name" id="new_currency_name" value="{{$model->new_currency_name}}" required autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="currency_id" class="layui-form-label">币种</label>
            <div class="layui-input-block">
                <select name="currency_id" lay-verify="required" id="currency_id" value="{{$model->currency_id}}" disabled lay-search>
                    @foreach ($currencies as $currency)
                        <option  value="{{ $currency->id }}" @if($currency->id == $model->currency_id) selected @endif> {{ $currency->name }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新币兑换率</label>
            <div class="layui-input-block">
                <input type="text" name="change_rate" id="change_rate" value="{{$model->change_rate}}" required autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">申购时间</label>
            <div class="layui-input-block">
                <div class="layui-input-inline date_time111" >
                    <input type="text" style="width: 156px" name="start_time" id="start_time" value="{{$model->send_start}}" placeholder="请输入开始时间" autocomplete="off" class="layui-input" value="">
                </div>
{{--                <div class="layui-input-inline date_time111" style="margin-left: 10px;">--}}
{{--                    <input type="text" style="width: 156px" name="end_time" id="end_time" value="{{$model->send_end}}" placeholder="请输入结束时间" autocomplete="off" class="layui-input" value="">--}}
{{--                </div>--}}
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">锁仓时间(天)</label>
            <div class="layui-input-block">
                <input type="text" name="day" id="day" required autocomplete="off" value="{{$model->day}}" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">预计上线时间</label>
            <div class="layui-input-block">
                <div class="layui-input-inline date_time111" >
                    <input type="text" style="width: 156px" name="online_time" id="online_time" value="{{$model->online_time}}" placeholder="请输入时间" autocomplete="off" class="layui-input" value="">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">申购总数</label>
            <div class="layui-input-block">
                <input type="text" name="num" id="num" value="{{$model->num}}" required autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">最小申购数</label>
            <div class="layui-input-block">
                <input type="text" name="buy_num" id="buy_num" value="{{$model->buy_num}}" required autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">总收益%</label>
            <div class="layui-input-block">
                <input type="text" name="interest_rate" id="interest_rate" value="{{$model->interest_rate}}" required autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">预计收益</label>
            <div class="layui-input-block">
                <input type="text" name="predict_rate" id="predict_rate" value="{{$model->predict_rate}}" required autocomplete="off" placeholder="例如 1.8%~5%" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">介绍</label>
            <div class="layui-input-block">
                <input type="text" name="introduction" id="introduction" value="{{$model->introduction}}" required autocomplete="off"   class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

@endsection

@section('scripts')
    <script>

        let url=window.location.href;
        layui.use(['form','laydate'],function () {
            var form = layui.form
                ,$ = layui.jquery
                ,laydate = layui.laydate
                ,index = parent.layer.getFrameIndex(window.name);
            //监听提交
            form.on('submit(demo1)', function(data){
                var data = data.field;

                $.ajax({
                    url:'{{url('admin/send/edit_deposit_config')}}?id='+{{$model->id}}
                    ,type:'post'
                    ,dataType:'json'
                    ,data : data
                    ,success:function(res){
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
            laydate.render({
                elem: '#start_time'
                ,type: 'datetime'
            });
            laydate.render({
                elem: '#online_time'
                ,type: 'datetime'
            });
        });
    </script>

@endsection