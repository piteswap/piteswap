@extends('admin._layoutNew')
@section('page-head')
<link rel="stylesheet" type="text/css" href="{{URL("layui/css/layui.css")}}" media="all">
<link rel="stylesheet" type="text/css" href="{{URL("admin/common/bootstrap/css/bootstrap.css")}}" media="all">
<link rel="stylesheet" type="text/css" href="{{URL("admin/common/global.css")}}" media="all">
<link rel="stylesheet" type="text/css" href="{{URL("admin/css/personal.css")}}" media="all">
@endsection
@section('page-content')
	<form class="layui-form" method="POST">
		<input type="hidden" name="project_id" id="projectId">
		{{ csrf_field() }}
		<div class="layui-form-item">
			<label class="layui-form-label">标题</label>
			<div class="layui-input-block">
				<input class="layui-input newsName" name="title" id="title" lay-verify="required" placeholder="请输入标题" type="text">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">图片</label>
			<div class="layui-input-block">
				<button class="layui-btn" type="button" id="upload_test">选择图片</button>
				<br>
				<img src="" style="display:none" id="logoImg">
				<input type="hidden" name="logo" id="logo" >
			</div>
		</div>
	   	<div class="layui-form-item">
            <label for="currency_id" class="layui-form-label">项目币种</label>
            <div class="layui-input-block">
                <select name="currency_id" lay-verify="required" id="currency_id" lay-search>
                    @foreach ($currencies as $currency)
                        <option value="{{ $currency->id }}"> {{ $currency->name }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="layui-form-item" style="display:none">
            <label for="currency_id" class="layui-form-label">支付币种</label>
            <div class="layui-input-block">
                <select name="pay_currency_id" lay-verify="required"  lay-search>
                    <!--@foreach ($currencies as $currency)-->
                        <option value="3" selected="selected">USDT</option>
                    <!--@endforeach-->
                </select>
            </div>
        </div>
		<div class="layui-inline">		
			<label class="layui-form-label">发行总量</label>
			<div class="layui-input-inline">
				<input class="layui-input "  name="amount" type="text"  id="amount">
			</div>
		</div>
		<div class="layui-inline">		
			<label class="layui-form-label">发行价格(U本位)</label>
			<div class="layui-input-inline">
				<input class="layui-input " name="price" type="text"  id="price">
			</div>
		</div>
		<div class="layui-inline">		
			<label class="layui-form-label">开始时间</label>
			<div class="layui-input-inline">
				<input class="layui-input " id="start_at" name="start_at" type="text" >
			</div>
		</div>
    	<div class="layui-inline">		
			<label class="layui-form-label">结束时间</label>
			<div class="layui-input-inline">
				<input class="layui-input " id="end_at"  name="end_at" type="text">
			</div>
		</div>
		<div class="layui-inline">		
			<label class="layui-form-label">官网链接</label>
			<div class="layui-input-inline">
				<input class="layui-input "  name="link" type="text"  id="link">
			</div>
		</div>
		<div class="layui-inline">		
			<label class="layui-form-label">白皮书链接</label>
			<div class="layui-input-inline">
				<input class="layui-input "  name="white_book" type="text"  id="white_book">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">发布状态</label>
			<div class="layui-input-inline">
				<select name="status" class="" id="status" lay-filter="status" lay-verify="required">
				    
					<option value="1">已上架</option>
					<option value="2">已下架</option>
			    </select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">内容摘要</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入内容摘要" class="layui-textarea" name="summary" id="summary"></textarea>
			</div>
		</div>
	
		<div class="layui-form-item">
			<label class="layui-form-label">文章内容</label>
			<div class="layui-input-block">
				<script id="news_content" name="content" type="text/plain" style="width:100%; height:300px;"></script>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="submit">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
@endsection
@section('scripts')
<script type="text/javascript" src="{{ URL('vendor/ueditor/1.4.3/ueditor.config.js') }}"></script>
<script type="text/javascript" src="{{ URL('vendor/ueditor/1.4.3/ueditor.all.js') }}"> </script>
<script type="text/javascript" src="{{ URL('vendor/ueditor/1.4.3/lang/zh-cn/zh-cn.js') }}"></script>
<script type="text/javascript" src="{{URL("/admin/js/projectFormSubmit.js?v=").time()}}"></script>
<script>    

    let url=window.location.href;
    let id='';
   
    
	layui.use('upload', function(){
		var upload = layui.upload;
		//执行实例
		var uploadInst = upload.render({
			elem: '#upload_test' //绑定元素
			,url: '{{URL("api/upload")}}?scene=admin' //上传接口
			,done: function(res){
				//上传完毕回调
				if (res.type == "ok"){
					$("#logo").val(res.message)
					$("#logoImg").show()
					$("#logoImg").attr("src",res.message)
				} else{
					alert(res.message)
				}
			}
			,error: function(){
				//请求异常回调
			}
		});

	});
</script>
@endsection