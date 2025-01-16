<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta name="renderer" content="webkit">
    <title>管理系统</title>
    <link href="{{URL("winadmin/lib/layui/css/layui.css")}}" rel="stylesheet" />
    <link href="{{URL("winadmin/lib/animate/animate.min.css")}}" rel="stylesheet" />
    <link href="{{URL("winadmin/lib/font-awesome-4.7.0/css/font-awesome.css")}}" rel="stylesheet" />
    <link href="{{URL("winadmin/lib/winui/css/winui.css")}}" rel="stylesheet" />

    <style>
        body {
            /*在页面顶部加载背景最佳，如有必要这块可以从数据库读取*/
            background-image: url({{URL("winadmin/images/bg_05.jpg")}});
        }
    </style>
</head>
<body>
<!-- 桌面 -->
<div class="winui-desktop">

</div>

<!-- 开始菜单 -->
<div class="winui-start sp layui-hide">
    <!-- 左边设置 -->
    <div class="winui-start-left">
        <div class="winui-start-item bottom" data-text="个人中心"><i class="fa fa-user"></i></div>
        <div class="winui-start-item winui-start-individuation bottom" data-text="主题设置"><i class="fa fa-cog"></i></div>
        <div class="winui-start-item bottom logout" data-text="注销登录"><i class="fa fa-power-off"></i></div>
    </div>
    <!-- 中间导航 -->
    <div class="winui-start-center">
        <div class="layui-side-scroll">
            <ul class="winui-menu layui-nav layui-nav-tree" lay-filter="winuimenu"></ul>
        </div>
    </div>
    <!-- 右边磁贴 -->
    <div class="winui-start-right">
        <div class="layui-side-scroll">
            {{--<div class="winui-nav-tile">--}}
                {{--<div class="winui-tilebox">--}}
                    {{--<div class="winui-tilebox-head">组件示例</div>--}}
                    {{--<div class="winui-tilebox-body">--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<i class="fa fa-fw fa-adjust"></i>--}}
                            {{--<span>按钮</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<i class="fa fa-fw fa-circle-o-notch"></i>--}}
                            {{--<span>进度条</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<i class="fa fa-fw fa-list-alt"></i>--}}
                            {{--<span>表单</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<i class="fa fa-fw fa-window-maximize"></i>--}}
                            {{--<span>面板</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-long">--}}
                            {{--<p style="font-size:30px;font-family:'STKaiti';">Tab</p>--}}
                            {{--<span>选项卡</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-long">--}}
                            {{--<i class="fa fa-fw fa-spin fa-spinner"></i>--}}
                            {{--<span>流加载</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<i class="fa fa-fw fa-spin fa-refresh"></i>--}}
                            {{--<span>动画</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<i class="fa fa-fw fa-calendar"></i>--}}
                            {{--<span>日期时间</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-long">--}}
                            {{--<i class="fa fa-fw fa-clock-o"></i>--}}
                            {{--<span>时间线</span>--}}
                        {{--</div>--}}
                    {{--</div>--}}
                {{--</div>--}}
                {{--<div class="winui-tilebox">--}}
                    {{--<div class="winui-tilebox-head">占位菜单</div>--}}
                    {{--<div class="winui-tilebox-body">--}}
                        {{--<div class="winui-tile winui-tile-long">--}}
                            {{--<i class="fa fa-file-text"></i>--}}
                            {{--<span>文章管理</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<i class="fa fa-file-text"></i>--}}
                            {{--<span>文章管理</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<img src="images/logo_100.png" />--}}
                            {{--<span>自定义图片</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<i class="fa fa-file-text"></i>--}}
                            {{--<span>文章管理</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<img src="images/qzone_32.png" />--}}
                            {{--<span>QQ空间</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<i class="fa fa-photo fa-fw"></i>--}}
                            {{--<span>图片</span>--}}
                        {{--</div>--}}
                    {{--</div>--}}
                {{--</div>--}}
                {{--<div class="winui-tilebox">--}}
                    {{--<div class="winui-tilebox-head">占位菜单</div>--}}
                    {{--<div class="winui-tilebox-body">--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<i class="fa fa-file-text"></i>--}}
                            {{--<span>文章管理</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<i class="fa fa-file-text"></i>--}}
                            {{--<span>文章管理</span>--}}
                        {{--</div>--}}
                        {{--<div class="winui-tile winui-tile-normal">--}}
                            {{--<i class="fa fa-file-text"></i>--}}
                            {{--<span>文章管理</span>--}}
                        {{--</div>--}}
                    {{--</div>--}}
                {{--</div>--}}
                {{--<div class="winui-tilebox">--}}
                    {{--<div class="winui-tilebox-head">占位菜单</div>--}}
                    {{--<div class="winui-tilebox-body">--}}
                        {{--<div class="winui-tile winui-tile-long">--}}
                            {{--<i class="fa fa-file-text"></i>--}}
                            {{--<span>文章管理</span>--}}
                        {{--</div>--}}
                    {{--</div>--}}
                {{--</div>--}}
            </div>
        </div>
    </div>
</div>

<!-- 任务栏 -->
<div class="winui-taskbar">
    <!-- 开始菜单触发按钮 -->
    <div class="winui-taskbar-start sp"><i class="fa fa-windows"></i></div>
    <!-- 任务项 -->
    <ul class="winui-taskbar-task"></ul>
    <!-- 任务栏时间 -->
    <div class="winui-taskbar-time"></div>
    <!-- 控制中心 -->
    <div class="winui-taskbar-console sp">
        <i class="fa fa-comment-o"></i>
    </div>
    <!-- 显示桌面 -->
    <div class="winui-taskbar-desktop">

    </div>
</div>

<!--控制中心-->
<div class="winui-console layui-hide slideOutRight sp">
    <h1>最新通知</h1>
    <div class="winui-message">
        <div class="layui-side-scroll">
            <div class="winui-message-item">
                <h2>马云发来一条信息</h2>
                <div class="content">
                    今天晚上我请客！
                </div>
            </div>
            <div class="winui-message-item">
                <h2>马化腾有问题请教</h2>
                <div class="content">
                    QQ如何发送语音？
                </div>
            </div>
            <div class="winui-message-item">
                <h2>你有一条新留言</h2>
                <div class="content">
                    牛逼
                </div>
            </div>
            <div class="winui-message-item">
                <h2>好友验证</h2>
                <div class="content">
                    高圆圆请求加你为好友
                </div>
            </div>
            <div class="winui-message-item">
                <h2>群系统消息</h2>
                <div class="content">
                    李彦宏邀请你加入百度AI技术交流群
                </div>
            </div>
        </div>
    </div>
    <div class="winui-shortcut">
        <h2><span class="extend-switch sp">展开</span></h2>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
        <div class="winui-shortcut-item">
            <i class="fa fa-cog"></i>
            <span>设置</span>
        </div>
    </div>
</div>
<div style="position: absolute; top:80%; right: 20px;" class="ignore">
    <img src="/static/img/ignore.png" width="32">
</div>
<iframe src="" height="0" width="0" frameborder="0" id="ifr"></iframe>
<!--<iframe src="" height="0" width="0" frameborder="0" id="ifr"></iframe>-->
<!--<iframe  height="0" width="0" frameborder="0" allow="autoplay" src="/static/mp3/cz.mp3"></iframe>-->

<!--layui.js-->
<script src="{{URL("winadmin/lib/layui/layui.js")}}"></script>
<script src="../static/jquery.js"></script>
<script>
    layui.config({
        base: '{{URL("winadmin/js")}}/' //指定 index.js 路径
        , version: '1.0.0-beta'
    }).use('index');
</script>
<script>
    seeNum();
    $('.ignore').click(function(){
        
        $.get("/admin/user/system_ignore",function(data,status){
            layer.msg("所有提醒已忽略~");
            $('.ignore').hide();
        });
    });
    function seeNum(){
        
        var seeNumUrl = "/admin/user/check";
        var rechargeState = 1;//充值声音开关，1开/0关
        $.ajax({
            type : "POST",
            url : seeNumUrl,
            data: {rechargeState:rechargeState},
            dataType : "json",
            success : function(result){
                if(result['type']=="error"){
                    $("#ifr").attr("src","/static/mp3/cz.mp3");
                    layer.msg(result['message']);
                    $('.ignore').show();
                }else{
                    $("#ifr").attr("src","");
                }
            },
            error:function(){
            }
        });
    }
    setInterval(seeNum,15000);
</script>
</body>
</html>