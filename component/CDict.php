<?php
/**
 * Created by PhpStorm.
 * User: lsq
 * Date: 14-5-23
 * Time: 上午9:43
 */

class CDict {
    /*
     * 服务器状态
     */
    public static $serverStatus = [
        0 => '未开服',
        1 => '正常',
        2 => '顺畅',
        3 => '拥挤',
        4 => '火爆',
        5 => '新区',
    ];

    public static $sex = array(
        0 => '男性',
        1 => '女性',
    );

    //职业
    public static $job = array(
        1 => '战',
        2 => '法',
        3 => '道',
    );

    //金钱类型
    public static $moneyType = array(
        'gold'=>'绑元',
        'yuanbao'=>'元宝',
    );

    //公告类型
    public static $noticeType = array(
        255 => '客户端弹窗公告',
        8=>'全服公告(屏幕中央)',
		4=>'聊天框',
		16=>'喇叭'
    );

	
    //公告发送类型
    public static $noticeSendType = array(
        '立即发送',
        '定时发送',
        '循环发送'
    );

    //排行榜类型
    public static $rankType = array(
        1 => '战斗力排行',
        2 => '等级',
        3 => '灵根',
        4 => '成就',
        5 => '坐骑',
        6 => '法宝',
        7 => '魅力',
        8 => '每周魅力',
        9 => '翅膀',
        10 => '宠物敏捷',
        11 => '宠物防御',
        12 => '宠物攻击',
        13 => '宠物身法',
    );

    //ios充值档次和ID的对应关系
    private static $applePay = array(
        6      => 'sdbgj.m37.applepay.repation_6',
        30     => ' sdbgj.m37.applepay.repation_30',
        68     => 'sdbgj.m37.applepay.repation_60',
        128    => 'sdbgj.m37.applepay.repation_128',
        328    => 'sdbgj.m37.applepay.repation_328',
        648    => 'sdbgj.m37.applepay.repation_648',
    );

    //手机品牌
    public static $phoneBrand = array(
        "coolpad" => "酷派",
        "xiaomi"  => "小米",
        "meizu"   => "魅族",
        "huawei"  => "华为",
        "lenovo"  => "联想",
        "htc"     => "HTC",
        "zte"     => "中兴",
        "oppo"    => "OPPO",
        "vivo"    => "vivo",
        "samsung" => "三星",
        "honor"   => "华为荣耀",
        "tcl"     => "TCL王牌",
        "iphone"  => "苹果",
        "hisense" => "海信",
        "haier"   => "海尔",
        "nubia"   => "努比亚",
        "sony"    => "索尼",
        "meitu"   => "美图",
        "chuwi"   => "驰为",
        "dell"    => "戴尔",
        "hasee"   => "神州",
        "yusun"   => "语信",
        "zhuomi"  => "卓米",
        "konka"   => "康佳",
        "smartisan"=> "锤子",
        "xiaolajiao"=> "小辣椒",

     );
	

}