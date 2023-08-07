
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>巅峰战神</title>
    <meta name="viewport" content="width=device-width,initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="full-screen" content="true" />
    <meta name="screen-orientation" content="portrait" />
    <meta name="x5-fullscreen" content="true" />
    <meta name="360-fullscreen" content="true" />
    <style>
        html, body {
            -ms-touch-action: none;
			background: url("http://cdn.988973.com/resource/agentAssets/dev/loading_bg2.jpg");
			background-repeat: none;
			background-size: 100%;
			background-attachment: fixed;
            padding: 0;
            border: 0;
            margin: 0;
            height: 100%;
        }
    </style>
</head>

<body>
    <div style="margin: auto;width: 100%;height: 100%;" class="egret-player"
         data-entry-class="Main"
         data-orientation="auto"
         data-scale-mode="showAll"
         data-frame-rate="30"
         data-content-width="640"
         data-content-height="1136"
         data-show-paint-rect="false"
         data-multi-fingered="2"
         data-show-fps="false" data-show-log="false"
         data-show-fps-style="x:0,y:0,size:12,textColor:0xffffff,bgAlpha:0.9">
    </div>
<script>


	function isWeiXin(){
		var ua = window.navigator.userAgent.toLowerCase();
		//通过正则表达式匹配ua中是否含有MicroMessenger字符串*
		if(ua.match(/MicroMessenger/i) == 'micromessenger'){
			return 1;
		}else{
			return 0;
		}
	}
	var wxflag = isWeiXin();
	ARGS = '';
    var loadScript = function (list, callback) {
        var loaded = 0;
        var loadNext = function () {
            loadSingleScript(list[loaded], function () {
                loaded++;
                if (loaded >= list.length) {
                    callback();
                }
                else {
                    loadNext();
                }
            })
        };
        loadNext();
    };

    var loadSingleScript = function (src, callback) {
        var s = document.createElement('script');
        s.async = false;
        s.src = src;
        s.addEventListener('load', function () {
            s.parentNode.removeChild(s);
            s.removeEventListener('load', arguments.callee, false);
            callback();
        }, false);
        document.body.appendChild(s);
    };
	var t = Date.now();
	function slp(d){
		while(Date.now - t <= d);
	}
	//sdk 加载完毕回调
	window.zmInitSucc = function() {
		//TODO 必须在这里或者该方法调用之后进行 sdk 调用
		ZmSdk.getInstance().init(function(data){
			//初始化成功之后调用其他 sdk 能力 如 获取用户信息、支付、角色上报、设置
			//享信息、分享等…
			//示例：
			if(data.retcode === "0"){
				console.log("sdk连接成功");
				var userinfo = ZmSdk.getInstance().getUserInfo();
				console.log("UserInfo:" + JSON.stringify(userinfo));
				var argsXHR = new XMLHttpRequest();
				var argsUrl = 'http://game.988973.com/sdk/ssargs.php?channel='+ userinfo.common.channel + '&uid=' + userinfo.userdata.uid + '&v=' + Math.random();
				argsXHR.open('GET', argsUrl, true);
				argsXHR.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
				argsXHR.addEventListener("load", function () {
					ARGS = argsXHR.response;
				});
				argsXHR.send(null);
				slp(200);
				var xhr = new XMLHttpRequest();
				xhr.open('GET', 'http://ss.988973.com/manifest.json?v=' + Math.random(), true);
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
				xhr.addEventListener("load", function () {
					var manifest = JSON.parse(xhr.response);
					var list = manifest.initial.concat(manifest.game);
					loadScript(list, function () {
						/**
						 * {
						 * "renderMode":, //引擎渲染模式，"canvas" 或者 "webgl"
						 * "audioType": 0 //使用的音频类型，0:默认，2:web audio，3:audio
						 * "antialias": //WebGL模式下是否开启抗锯齿，true:开启，false:关闭，默认为false
						 * "retina": //是否基于devicePixelRatio缩放画布
						 * }
						 **/
						egret.runEgret({ renderMode: "webgl", audioType: 0 });
					});
				});
				xhr.send(null);
				
			}else if(data.retcode === "1"){
				//初始化失败处理
			}
		});
	}
</script>
<script type="text/javascript" src="http://cdn.988973.com/js/zm_engine_v2.js"></script>
</body>

</html>