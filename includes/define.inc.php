<?php
//开发模式
//define('ENVIRONMENT','DEV');

//网站名、语言、时区设置
define('WEB_NAME','游戏后台管理系统');
define('SALT','uiR5DSIPv2');
define('LANGUAGE','zh-hans');
define('DEFAULT_LANGUAGE','zh-hans');
define('TIMEZONE','Asia/Chongqing');

//数据库设置
define('MYSQLHOST','127.0.0.1');
define('MYSQLPORT',3306);
define('MYSQLUSER','root');
define('MYSQLPASS','61SrOG4Lwuy7');
define('DB_NAME','gameback');
define('TABLE_PREFIX','bg_gm');

//游戏库
define('GAMEHOST','127.0.0.1');
define('GAMEPORT',3306);
define('GAMEUSER','root');
define('GAMEPASS','61SrOG4Lwuy7');
define('GAMEDBNAME','bg_cq_account');

//游戏后台数据库
define('GAMECMDHOST','127.0.0.1');
define('GAMECMDPORT',3306);
define('GAMECMDUSER','root');
define('GAMECMDPASS','61SrOG4Lwuy7');
define('GAMECMDDBNAME','bg_cq_gstatic');


//菜单设置
define('MENU_STATUS_SHOW',1);  //菜单显示
define('MENU_STATUS_HIDDEN',2); //菜单隐藏
define('MENU_TYPE_CENTER','tree'); //央服菜单类型
define('MENU_TYPE_SINGLE','leaf'); //单服菜单类型

//用户状态设置
define('USER_STATUS_NORMAL',1); //用户状态：正常
define('USER_STATUS_FORBID',2); //用户状态：封号

//日志设置
define('LOG_DIR',ROOT.'/log/');  //日志保存路径
define('LOG_TYPE_ACCESS','access');//日志类型：访问日志
define('LOG_TYPE_CUSTOM','custom');//日志类型：自定义日志
define('LOG_TYPE_WRONG_PASSWORD','wrong_password');//日志类型：密码错误
define('PASSWORD_LENGTH',8);//密码长度
define('DEFAULT_PAGE_COUNT',50);//默认每页显示数据量
define('LOGIN_URL','admin.php?ctrl=index&act=login');//登录页面链接
define('TRANSLATE_CACHE_DIR',ROOT.'/runtime/cache/translate/');
define("GAMEKEY",'2b0351468c0a25a0e17fa412ed1de293');
define('WWW_PATH',str_replace('\\','/',realpath(dirname(__FILE__).'/../'))); 
define("NETWORKTYPE",'outer');//定义网络类型，inner：内网，outer:外网

//BackStage命令定义
define('MSS_REGIST_SERVER_RET',10000);//回应注册服务器结果(tag为0表示成功)
define('MSS_KEEP_ALIVE',10001); //保持连接
define('MSS_RELOADNPC',10002); //刷新NPC(数据段为Encode(地图名称 + \n + NPC名称))
define('MSS_RELOADNOTICE',10003); //刷新公告
define('MSS_KICKPLAY',10004); //踢角色下线（数据段为编码后的角色名称）
define('MSS_KICKUSER',10005); //踢账号下线（数据段为编码后的账号字符串）
define('MSS_QUERYPLAYONLINE',10006); //查询角色是否在线（数据段为编码后的角色名称）
define('MSS_QUERYUSERONLINE ',10007); //查询账号是否在线（数据段为编码后的账号字符串）
define('MSS_ADDNOTICE',10008); //添加公告
define('MSS_DELNOTICE',10009); //删除公告
define('MSS_DELAY_UPHOLE',10010); //进入倒计时维护状态(param倒计时秒数)
define('MSS_CANLCE_UPHOLE',10011); //取消倒计时维护状态
define('MSS_SET_EXPRATE',10012); //设置经验倍率(param为倍率，1表示1倍，2表示2倍)
//define('MSS_SHUTUP',10013); //禁言(Param  时间,单位是分钟,数据段为编码后的角色名称)
//define('MSS_RELEASESHUTUP',10014); //解禁言（数据段为编码后的角色名称）
define('MSS_RELOAD_FUNCTION',10015); //刷新功能脚本
define('MSS_APPLY_ACROSS_SERVER_RET',10016);//后台返回的申请跨服结果  Tag  0 为成功,1 为失败  数据段为:  申请的角色名
define('MSS_GET_ARENA_SCORE_RANK',10017); //后台引擎请求获取擂台积分排行榜
define('MSS_RELOAD_LOGIN_SCRIPT',10018); //后台重新加载登陆脚本
define('MSS_RELOAD_ROBOTNPC',10019); //后台重新加载机器人脚本
define('MSS_RELOAD_SHOP',10020); //后台重新加载商城物品
define('MSS_GET_CURR_PROCESS_MEM_USED',10021); //获取引擎当前的内存使用量(接近2G处于危险状态,即容易崩溃)
define('MSS_ADD_PLAYER_RESULTPOINT',10022); //增加玩家的返点数(绑定元宝),Recog为绑定元宝数值,可以是正负,当为负数时就是减少玩家的绑定元宝,数据段为角色名称.
define('MSS_RELOAD_ABUSEINFORMATION',10023); //重新加载文字发言过滤信息库
define('MSS_RELOAD_MONSTER_SCRIPT',10024); //重新加载怪物脚本（数据段为编码后的角色名称)
define('MSS_OPEN_GAMBLE',10025); // 开启赌博系统
define('MSS_CLOSE_GAMBLE',10026); // 关闭赌博系统
define('MSS_OPEN_COMMONSERVER',10027); // 开启跨服
define('MSS_CLOSE_COMMONSERVER',10028); // 关闭跨服
define('MSS_SEND_OFFMSGTOACOTOR',10029);	//后台给玩家直接发送离线消息 数据段为:(角色名称 + \n + 回复的消息内容)
define('MSS_OPEN_COMPENSATE',10030);	//后台开启补偿 数据段为：(param为补偿方案ID Tag表示补偿时间(分钟))
define('MSS_CLOSE_COMPENSATE',10031);	//后台关闭补偿 数据段为：()
define('MSS_ADD_FILTERWORDS',10032);	//后台添加屏蔽字
define('MSS_SET_DROPRATE',10033);	//后台设置红白名掉落概率 param:1白背，2白装，3红背，4红装,Tag：概率（百分数)
define('MSS_SET_QUICKSOFT',10034);	//后台设置外挂的设置
define('MSS_SET_CHATLEVEL',10035);	//后台设置聊天等级
define('MSS_SET_DELGUILD',10036);	//后台删除行会
define('MSS_SET_HUNDREDSERVER',10037);	//后台设置百服活动
define('MSS_SET_RELOADCONFIG',10038);	//后台加载引擎配置
define('MSS_SET_REMOVEITEM',10039);	//删除玩家的物品  名字 物品GUID 位置
define('MSS_SET_REMOVEMONEY',10040);	//删除玩家金钱		字符串：角色名|类型(1 金币 2 绑定元宝 3 元宝)|数量
define('MSS_DELAY_COMBINE',10041);	//后台设置合服倒计时(param为时间（小时），最后跟开启时间,格式如：2013-01-01 10:0:0)
define('MSS_GET_NOTICESTR',10042);	//后台请求公告列表
define('MSS_SET_REFRESHCORSS',10043);	//后台刷新跨服配置
define('MSS_SET_COMMON_SRVID',10044);	//设置跨服的服务器ID
define('MSS_GET_COMMON_SRVID',10045);	//获取跨服的服务器Id
define('MSS_SET_SURPRISERET',10046);	//后台设置惊喜回馈(Tag:库ID（ID=0表示查看开启状态），param为持续的时间（小时）（持续时间为0表示关闭），最后跟开启时间,格式如：2013-01-01 10:0:0)
define('MSS_RESET_GAMBLE',10047);	//重置盗梦元宝消耗
define('MSS_SET_CHANGENAME',10048);	//开启改名字功能	0 关闭 1 开启
define('MSS_SET_OLDPLAYERBACK',10049);	//设置老玩家回归
define('MSS_SET_RELOADLANG',10050);	//加载语言包
define('MSS_SET_GROUPON',10051);	//后台设置团购(Tag:库ID（ID=0表示查看开启状态），param为持续的时间（小时）（持续时间为0表示关闭），最后跟开启时间,格式如：2013-01-01 10:0:0)
define('MSS_SET_CROSSBATTLE',10052);	//开启开启跨服降魔战场	0 关闭 1 开启
define('MSS_SET_CROSSBATTLENUM',10053);   //设置跨服降魔战场的人数 
//define('MSS_RELOAD_ITEMFUNCTION',10054);	//刷新道具脚本
define('MSS_VIEW_STATE',10055);	//查看系统各种状态
define('MSS_OPEN_MYSTIC',10056);	//开启或关闭神秘商店 字符串：开启或关闭（1 开启 0 关闭）|开启的时长（单位分钟）
define('MSS_OPEN_DOM',10057);	//开启或关闭寻宝 字符串：开启或关闭（1 开启 0 关闭）
define('MSS_OPEN_EGGS',10058);	//开启或关闭彩蛋 字符串：开启或关闭（1 开启 0 关闭）
define('MSS_CLOSE_NOTICE',10059);	//删除所有公告  OK
define('MSS_ADD_FUNCTIONNAME',10060);	//添加脚本函数名 字符串：脚本名称
define('MSS_CLEAR_ACTOR',10061);	//角色清理 (等级|充值数|登陆游戏天数)
define('MSS_DELTE_NOTICEBYID',10062);	//删除公告（根据id） 字符串：公告id
define('MSS_ENCRPTY_FUNCTION',10063);	//设置是否对脚本加密 字符串：开启或关闭（0 开启 1 关闭）
define('MSS_SET_SPEED_CHECK',10064);   //设置加速外挂检测的参数  字符串:时间比率|开始检测的次数|加速检查值
define('MSS_SETCHECK_SPEED',10065);	//设置检测外挂的标志 字符串:状态(0关闭 1开启)
define('MSS_SET_ACCOUNTID',10066);	//设置账号id  字符串:玩家的账户|修改后的账户id
define('MSS_SET_RIDE_CHECK',10067);   //设置检测坐骑上下的参数  字符串:上下坐骑多少次|间隔多久算|间隔这么久清除
define('MSS_SET_NEWCHECK_CHECK',10068);	//设置新检测参数 字符串：参数类型(1:是否为肯定在加速百分比上限参数 2:是否为肯定在加速百分比下限参数 3:可能在加速百分比上限参数 4:误判百分比下限)|参数值(1到100的数值)
define('MSS_SET_LOGIN_TOOLS',10069);	//使用登陆器登陆杀怪奖励倍率 字符串：奖励倍率(30：表示百分之30)
define('MSS_SET_THOUSANDSERVER',10070);	//后台开启千服活动 字符串：开始时间(格式：2013-09-25-16:20:21)|持续天数
define('MSS_CLOSE_THOUSAND',10071);	//关闭千服活动 字符串：无
define('MSS_SUPER_BUYING',10072);	//开启超值抢购 字符串：开始时间(格式：2013-09-25-16:20:21)|只需天数
define('MSS_THANKS_ACTIVITY',10073);	//开启惠民消费活动 字符串：开始时间(格式：2013-09-25-16:20:21)|持续天数|开启的活动(111111 从左到右依次表示:坐骑提升,法宝猎魔,翅膀羽化,幻武启灵,足迹升阶,经验提升 如果某位为0表示关闭)
define('MSS_OPEN_MYGICSHOP',10074);	//定时开启神秘商店 字符串：开始时间(格式：2013-09-25-16:20:21)|开启天数
define('MSS_OPEN_DOUBLEEXP',10075);	//定时开启双倍经验 字符串：开始时间(格式：2013-09-25-16:20:21)|开启小时|倍率(1：1倍 2：2倍 )
define('MSS_OPEN_FCM',10076);	//后台开启防沉迷
define('MSS_OPEN_DISCOUNTSITEM',10077);	//开启或关闭特价商品翻倍 字符串：开启或关闭（1 开启 0 关闭）
define('MSS_SET_IP_LOGIN_LIMIT',10078);	//设置登陆IP数量限制，0和负数则不限制
define('MSS_SET_FUND',10079);	//后台设置基金活动
define('MSS_SET_SMALLACTIVITY',10080);	//后台设置基金活动
define('MSS_SET_GUILD_LEADER',10081);	//后台设置行会会长
define('MSS_ACTIVE_BAG_CHANGED',10082);	//活动背包数据改变
define('MSS_SPEED_DEVIATION_TIME',10083);	//设置校验加速的误差时间 单位毫秒
define('MSS_SYSREWARDMAIL',10084);	//系统奖励邮件		参数：MaileType|uActorId|szTitle|szDesc|type,id,count,bin;type,id,count,bin;type,id,count,bin; OK
define('MSS_OPERATION_ACT',10085);	//运营活动			参数：str  OK
define('MSS_DEL_OPERATION_ACT',10086);	//删除运营活动		参数：cmd_id|act_id|cmd_flag
define('MSS_SHUTUP_BYID',10087);   //禁言,参数: 角色ID|时间(结束的时间点)
define('MSS_RELEASESHUTUP_BYID',10088);   //解禁言,参数: 角色ID
define('MSS_REGAIN_ACTOR',10089);   //恢复角色,参数: 角色ID
define('MSS_SET_GUILD_NOTICE',10090);	//后台设置行会公告,参数： 行会ID|行会公告内容
define('MSS_SET_CORSS_SWITCH',10091);	//后台设置跨服入口,参数： 开启或关闭(1开启 0关闭)
define('MSS_SET_USER_TYPE',10092);	//后台设置内玩参数,参数： 角色ID|是否内玩(1是 0否)
define('MSS_SET_TRADE_BAN',10093);	//后台设置交易封禁,参数： 角色ID|是否封禁(1是 0否)
define('MSS_SET_ACTIVITY_STATUS',10094);	//后台设置日常活动,参数：活动ID|开启或关闭(1开 0关)
define('MSS_SET_EAT_CHICKEN_LIMIT',10095);	//后台设置吃鸡活动，参数：开启所需限制
define('MSS_PAY',10096);  //后台模拟充值
define('MSS_DAILY_RECHARGE',10100);	//后台每日充值	字符串：开始时间(格式：2013-09-25-16:20:21)|持续天数|方案
define('MSS_TIME_LIMIT_SHOPPING',10101);	//后台限时商品	字符串：开始时间(格式：2013-09-25-16:20:21)|持续天数|方案
define('MSS_TOTAL_RECHARGE',10102);	//后台累积充值	字符串：开始时间(格式：2013-09-25-16:20:21)|持续天数|方案
define('MSS_TOTAL_COST',10103);	//后台累积消费	字符串：开始时间(格式：2013-09-25-16:20:21)|持续天数|方案
define('MSS_SET_SESSIONCMD',19999);	//转发后台消息给会话服 字符串






global $__global;
//不需要权限的页面
$__global['noPermissionPage'] = array('index_verification_code','index_login','index_user_status');
//用户登录成功但不需要后台设置权限的页面
$__global['mustPassPage'] = array(
    'index_index',
    'index_item_info',
    'index_setChannelDisplay',
);

//检查是否在开发环境下
function is_dev() {
    if (defined('ENVIRONMENT') && ENVIRONMENT == 'DEV'){
        return true;
    }else{
        return false;
    }
}


/**
 * 获取用户ip
 * @return string
 */
function get_client_ip() {
    if ($ip = getenv('HTTP_CLIENT_IP'));
    elseif ($ip = getenv('HTTP_X_FORWARDED_FOR'));
    elseif ($ip = getenv('HTTP_X_FORWARDED'));
    elseif ($ip = getenv('HTTP_FORWARDED_FOR'));
    elseif ($ip = getenv('HTTP_FORWARDED'));
    else    $ip = $_SERVER['REMOTE_ADDR'];
    return  $ip;
}

function logMsg($str){
        //preg_match_all("/.+gameback/",getcwd(),$matches,PREG_PATTERN_ORDER );
        //file_put_contents( $matches[0][0] . "/log/game.txt","[". date("Y-m-d H:i:s") . "]". $str ."\r\n" ,FILE_APPEND );
		file_put_contents(WWW_PATH. "/log/game.txt","[". date("Y-m-d H:i:s") . "]". $str ."\r\n" ,FILE_APPEND );
}
