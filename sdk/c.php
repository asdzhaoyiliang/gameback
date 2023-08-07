<?php
header("Content-type: text/html; charset=utf8");
header('Access-Control-Allow-Origin:*');    
header('Access-Control-Allow-Methods:GET');   
header('Access-Control-Allow-Headers:x-requested-with,content-type');
	
require_once 'conf/main.php';

class user_card{
	public function  check($card){
		for($i = 0; $i < 10000; $i++)
		{
			$type1 = substr(md5("hjycard1_".$i),8,16);
			$type2 = substr(md5("hjycard2_".$i),8,16);
			$type3 = substr(md5("hjycard3_".$i),8,16);
			
			if($type1 == $card){
				return 1;
			}elseif($type2 == $card){
				return 2;
			}elseif($type3 == $card){
				return 3;
			}
		}
		for($i = 0; $i < 20000; $i++)
		{
			$type1 = substr(md5("dfzscard1_".$i),8,16);
			$type2 = substr(md5("dfzscard2_".$i),8,16);
			$type3 = substr(md5("dfzscard3_".$i),8,16);
			$type4 = substr(md5("dfzscard4_".$i),8,16);
			$type5 = substr(md5("dfzscard5_".$i),8,16);
			
			$type7 = substr(md5("dfzscard7_".$i),8,16);
			$type8 = substr(md5("dfzscard8_".$i),8,16);
			$type10 = substr(md5("dfzscard10_".$i),8,16);
				
				
			$type11 = substr(md5("comcard1_".$i),8,16);
			$type12 = substr(md5("comcard2_".$i),8,16);
			$type13 = substr(md5("comcard3_".$i),8,16);
			$type14 = substr(md5("comcard4_".$i),8,16);
			$type15 = substr(md5("comcard5_".$i),8,16);
			
			$type11_1 = substr(md5("comcard11_".$i),8,16);
			$type12_1 = substr(md5("comcard12_".$i),8,16);
			$type13_1 = substr(md5("comcard13_".$i),8,16);
			
			
			$type21 = substr(md5("comcard21_".$i),8,16);
			$type22 = substr(md5("comcard22_".$i),8,16);
			$type23 = substr(md5("comcard23_".$i),8,16);
	
			$type26 = substr(md5("comcard26_".$i),8,16);
			$type27 = substr(md5("comcard27_".$i),8,16);
			$type28 = substr(md5("comcard28_".$i),8,16);
			$type29 = substr(md5("comcard29_".$i),8,16);
			$type30 = substr(md5("comcard30_".$i),8,16);	
			
			//小七新手卡
			$type36 = substr(md5("comcard36_".$i),8,16);
			$type37 = substr(md5("comcard37_".$i),8,16);
			$type38 = substr(md5("comcard38_".$i),8,16);
			$type39 = substr(md5("comcard39_".$i),8,16);
			$type40 = substr(md5("comcard40_".$i),8,16);	
	
			$type46 = substr(md5("comcard46_".$i),8,16);
			$type47 = substr(md5("comcard47_".$i),8,16);
			$type48 = substr(md5("comcard48_".$i),8,16);
			
			
			$type49 = substr(md5("comcard49_".$i),8,16);
			$type50 = substr(md5("comcard50_".$i),8,16);
			$type51 = substr(md5("comcard51_".$i),8,16);
			$type52 = substr(md5("comcard52_".$i),8,16);
			$type53 = substr(md5("comcard53_".$i),8,16);
			$type54 = substr(md5("comcard54_".$i),8,16);
			$type55 = substr(md5("comcard55_".$i),8,16);
			$type56 = substr(md5("comcard56_".$i),8,16);
			$type57 = substr(md5("comcard57_".$i),8,16);
			$type58 = substr(md5("comcard58_".$i),8,16);
			$type59 = substr(md5("comcard59_".$i),8,16);
			$type60 = substr(md5("comcard60_".$i),8,16);
			$type61 = substr(md5("comcard61_".$i),8,16);
			$type62 = substr(md5("comcard62_".$i),8,16);
			$type63 = substr(md5("comcard63_".$i),8,16);
			$type64 = substr(md5("comcard64_".$i),8,16);
			
			$type65 = substr(md5("comcard65_".$i),8,16);
			$type66 = substr(md5("comcard66_".$i),8,16);
			$type67 = substr(md5("comcard67_".$i),8,16);
			$type68 = substr(md5("comcard68_".$i),8,16);
			$type69 = substr(md5("comcard69_".$i),8,16);
			
			//小七双旦
			$type70 = substr(md5("comcard70_".$i),8,16);
			$type71 = substr(md5("comcard71_".$i),8,16);
			$type72 = substr(md5("comcard72_".$i),8,16);
			$type73 = substr(md5("comcard73_".$i),8,16);
			$type74 = substr(md5("comcard74_".$i),8,16);
			$type75 = substr(md5("comcard75_".$i),8,16);
			$type76 = substr(md5("comcard76_".$i),8,16);
			
			//应用宝
			$type77 = substr(md5("comcard77_".$i),8,16);
			$type78 = substr(md5("comcard78_".$i),8,16);
			$type79 = substr(md5("comcard79_".$i),8,16);
			$type80 = substr(md5("comcard80_".$i),8,16);
			$type81 = substr(md5("comcard81_".$i),8,16);
			$type82 = substr(md5("comcard82_".$i),8,16);
			$type83 = substr(md5("comcard83_".$i),8,16);
			$type84 = substr(md5("comcard84_".$i),8,16);
			$type85 = substr(md5("comcard85_".$i),8,16);
			$type86 = substr(md5("comcard86_".$i),8,16);
			$type87 = substr(md5("comcard87_".$i),8,16);

			//春节
			$type88 = substr(md5("comcard88_".$i),8,16);
			$type89 = substr(md5("comcard89_".$i),8,16);
			$type90 = substr(md5("comcard90_".$i),8,16);
			$type91 = substr(md5("comcard91_".$i),8,16);
			$type92 = substr(md5("comcard92_".$i),8,16);
			$type93 = substr(md5("comcard93_".$i),8,16);
			$type94 = substr(md5("comcard94_".$i),8,16);
			$type95 = substr(md5("comcard95_".$i),8,16);
			
			//屠龙攻沙
			$type96 = substr(md5("comcard96_".$i),8,16);
			$type97 = substr(md5("comcard97_".$i),8,16);
			$type98 = substr(md5("comcard98_".$i),8,16);
			$type99 = substr(md5("comcard99_".$i),8,16);
			$type100 = substr(md5("comcard100_".$i),8,16);
			$type101 = substr(md5("comcard101_".$i),8,16);
			$type102 = substr(md5("comcard102_".$i),8,16);
			$type103 = substr(md5("comcard103_".$i),8,16);
			$type104 = substr(md5("comcard104_".$i),8,16);
			$type105 = substr(md5("comcard105_".$i),8,16);
			$type106 = substr(md5("comcard106_".$i),8,16);
			$type107 = substr(md5("comcard107_".$i),8,16);
			$type108 = substr(md5("comcard108_".$i),8,16);
			$type109 = substr(md5("comcard109_".$i),8,16);
			$type110 = substr(md5("comcard110_".$i),8,16);
			$type111 = substr(md5("comcard111_".$i),8,16);
			$type112 = substr(md5("comcard112_".$i),8,16);
			$type113 = substr(md5("comcard113_".$i),8,16);
			
			//小7新春
			$type114 = substr(md5("comcard114_".$i),8,16);
			$type115 = substr(md5("comcard115_".$i),8,16);
			$type116 = substr(md5("comcard116_".$i),8,16);
			$type117 = substr(md5("comcard117_".$i),8,16);
			$type118 = substr(md5("comcard118_".$i),8,16);
			$type119 = substr(md5("comcard119_".$i),8,16);
			$type120 = substr(md5("comcard120_".$i),8,16);
			$type121 = substr(md5("comcard121_".$i),8,16);
			
			if($type1 == $card){
				return 1;
			}elseif($type2 == $card){
				return 2;
			}elseif($type3 == $card){
				return 3;
			}elseif($type4 == $card){
				return 4;
			}elseif($type5 == $card){
				return 5;
			}elseif($type11 == $card){
				return 11;
			}elseif($type12 == $card){
				return 12;
			}elseif($type13 == $card){
				return 13;
			}elseif($type11_1 == $card){
				return 11;
			}elseif($type12_1 == $card){
				return 12;
			}elseif($type13_1 == $card){
				return 13;
			}elseif($type14 == $card){
				return 14;
			}elseif($type15 == $card){
				return 15;
			}elseif($type7 == $card){
				return 7;
			}elseif($type8 == $card){
				return 8;
			}elseif($type10 == $card){
				return 10;
			}elseif($type21 == $card){
				return 21;
			}elseif($type22 == $card){
				return 22;
			}elseif($type23 == $card){
				return 23;
			}elseif($type26 == $card){
				return 26;
			}elseif($type27 == $card){
				return 27;
			}elseif($type28 == $card){
				return 28;
			}elseif($type29 == $card){
				return 29;
			}elseif($type30 == $card){
				return 30;
			}elseif($type36 == $card){
				return 36;
			}elseif($type37 == $card){
				return 37;
			}elseif($type38 == $card){
				return 38;
			}elseif($type39 == $card){
				return 39;
			}elseif($type40 == $card){
				return 40;
			}elseif($type46 == $card){
				return 46;
			}elseif($type47 == $card){
				return 47;
			}elseif($type48 == $card){
				return 48;
			}elseif($type49 == $card){
				return 49;
			}elseif($type50 == $card){
				return 50;
			}elseif($type51 == $card){
				return 51;
			}elseif($type52 == $card){
				return 52;
			}elseif($type53 == $card){
				return 53;
			}elseif($type54 == $card){
				return 54;
			}elseif($type55 == $card){
				return 55;
			}elseif($type56 == $card){
				return 56;
			}elseif($type57 == $card){
				return 57;
			}elseif($type58 == $card){
				return 58;
			}elseif($type59 == $card){
				return 59;
			}elseif($type60 == $card){
				return 60;
			}elseif($type61 == $card){
				return 61;
			}elseif($type62 == $card){
				return 62;
			}elseif($type63 == $card){
				return 63;
			}elseif($type64 == $card){
				return 64;
			}elseif($type65 == $card){
				return 65;
			}elseif($type66 == $card){
				return 66;
			}elseif($type67 == $card){
				return 67;
			}elseif($type68 == $card){
				return 68;
			}elseif($type69 == $card){
				return 69;
			}elseif($type70 == $card){
				return 70;
			}elseif($type71 == $card){
				return 71;
			}elseif($type72 == $card){
				return 72;
			}elseif($type73 == $card){
				return 73;
			}elseif($type74 == $card){
				return 74;
			}elseif($type75 == $card){
				return 75;
			}elseif($type76 == $card){
				return 76;
			}elseif($type77 == $card){
				return 77;
			}elseif($type78 == $card){
				return 78;
			}elseif($type79 == $card){
				return 79;
			}elseif($type80 == $card){
				return 80;
			}elseif($type81 == $card){
				return 81;
			}elseif($type82 == $card){
				return 82;
			}elseif($type83 == $card){
				return 83;
			}elseif($type84 == $card){
				return 84;
			}elseif($type85 == $card){
				return 85;
			}elseif($type86 == $card){
				return 86;
			}elseif($type87 == $card){
				return 87;
			}elseif($type88 == $card){
				return 88;
			}elseif($type89 == $card){
				return 89;
			}elseif($type90 == $card){
				return 90;
			}elseif($type91 == $card){
				return 91;
			}elseif($type92 == $card){
				return 92;
			}elseif($type93 == $card){
				return 93;
			}elseif($type94 == $card){
				return 94;
			}elseif($type95 == $card){
				return 95;
			}elseif($type96 == $card){
				return 96;
			}elseif($type97 == $card){
				return 97;
			}elseif($type98 == $card){
				return 98;
			}elseif($type99 == $card){
				return 99;
			}elseif($type100 == $card){
				return 100;
			}elseif($type101 == $card){
				return 101;
			}elseif($type102 == $card){
				return 102;
			}elseif($type103 == $card){
				return 103;
			}elseif($type104 == $card){
				return 104;
			}elseif($type105 == $card){
				return 105;
			}elseif($type106 == $card){
				return 106;
			}elseif($type107 == $card){
				return 107;
			}elseif($type108 == $card){
				return 108;
			}elseif($type109 == $card){
				return 109;
			}elseif($type110 == $card){
				return 110;
			}elseif($type111 == $card){
				return 111;
			}elseif($type112 == $card){
				return 112;
			}elseif($type113 == $card){
				return 113;
			}elseif($type114 == $card){
				return 114;
			}elseif($type115 == $card){
				return 115;
			}elseif($type116 == $card){
				return 116;
			}elseif($type117 == $card){
				return 117;
			}elseif($type118 == $card){
				return 118;
			}elseif($type119 == $card){
				return 119;
			}elseif($type120 == $card){
				return 120;
			}elseif($type121 == $card){
				return 121;
			}
			
		}
		

		return 0;
	}
    public  function run($param) {
		$server = $param['server'];
		$user = $param['user'];
		$role = $param['role'];
		$level = $param['level'];
		$card = trim($param['card']);
		if(!$server || !$role || !$card){
			exit(json_encode(array('ret'=>7,'msg'=>"param error")));
		}
		if(!$level){
			$level = 0;
		}
		$cardtype = $this->check($card);
		if($cardtype == 0){
			exit(json_encode(array('ret'=>1,'msg'=>"card error")));
		}	
		$mysqli = new mysqli(MYSQLHOST, MYSQLUSER, MYSQLPASS, DB_NAME,MYSQLPORT);
		//$queryStr = "select cdkey from bg_cdkey_use  where actorid = '{$role}' and serverid ='{$server}' and cardtype  = '{$cardtype}' ";
		//$res = $mysqli->query("$queryStr");
		//$row = $res->fetch_assoc();
		//if($row){
			//exit(json_encode(array('ret'=>5,'msg'=>"card used")));
		//}
		$cardtype = $this->check($card);
		$oldcardtype = $cardtype;
		//小七的不准其他渠道的卡入
		$arr = array(49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,70,71,72,73,74,75,76,114,115,116,117,118,119,120,121);
		if($server >= 50001 && $server <= 59999){
			if(!in_array($cardtype,$arr)){
				$cardtype = 0;
			}
		}
		if(in_array($cardtype,$arr) && ($server < 50000 || $server > 59999)){
			$cardtype = 0;
		}

		//应用宝
		$arr = array(77,78,79,80,81,82,83,84,85,86,87);
		if(in_array($cardtype,$arr) && ($server < 30000 || $server > 39999)){
			$cardtype = 0;
		}
		if($oldcardtype >= 11 && $oldcardtype <= 13){
			$cardtype =  $oldcardtype;
		}
		if($oldcardtype >= 36 && $oldcardtype <= 40){
			$cardtype =  $oldcardtype;
		}
		if($cardtype == 0){
			exit(json_encode(array('ret'=>1,'msg'=>"card error")));
		}
		//小七充值卡
		$sql = "";
		if( ($cardtype >= 49 && $cardtype <= 64) ||  ($cardtype >= 71 && $cardtype <= 76) ||  ($cardtype >= 116 && $cardtype <= 121)  ){
			$sql = "select cdkey from bg_cdkey_use  where cdkey = '{$card}' ";
		}else{
			$sql = "select cdkey from bg_cdkey_use  where cardtype = '{$cardtype}' and actorid = '{$role}' ";
		}

		//应用宝累充同类型只能用一次
		if($cardtype >= 77 && $cardtype <=87){
		    $sql = "select cdkey from bg_cdkey_use  where cdkey = '{$card}' ";
			$res = $mysqli->query($sql);
			$row = $res->fetch_assoc();
			if($row){
				exit(json_encode(array('ret'=>5,'msg'=>"card used")));
			}
			
		}
		if($cardtype >= 77 && $cardtype <= 82){
			$sql = "select cdkey from bg_cdkey_use  where cardtype = '{$cardtype}' and actorid = '{$role}' ";
		}
		//应用宝单笔累充，同类型不同码可用多次
		if($cardtype >= 83 && $cardtype <= 87){
			$sql = "select cdkey from bg_cdkey_use  where cdkey = '{$card}' ";
		}
        $res = $mysqli->query($sql);
        $row = $res->fetch_assoc();
		$date = date("Y-m-d");
		$time = time();
		if(!$row)
		{
			$sql = "INSERT INTO `bg_cdkey_use` (actorid,cdkey,serverid,logdate,account,level,cardtype) VALUES('{$role}','{$card}','{$server}','{$date}','{$user}','{$level}','{$cardtype}')";
			if($mysqli->query($sql))
			{
				//GAMECMD
				$mysql = Util::getMysqlCon(GAMECMDHOST,GAMECMDUSER,GAMECMDPASS,GAMECMDDBNAME,GAMECMDPORT);
				$cmdsql = "INSERT INTO `command` (serverindex, operindex, strcom, nstate,username,logdate,reser1) VALUES ('{$server}','18001','{$cardtype}','1','{$role}','{$date}',1)";
				if(!$mysql->query($cmdsql)){
					exit(json_encode(array('ret'=>7,'msg'=>"gm error")));
					logMsg($cmdsql);
				}else{
					exit(json_encode(array('ret'=>0,'msg'=>"ok")));
				}
			}else
			{
				exit(json_encode(array('state'=>7,'msg'=>"system error")));
				logMsg($sql);
			}
		}else
		{
			exit(json_encode(array('ret'=>5,'msg'=>"card used")));
		}
    }
}
$param  = addslashes_deep($_REQUEST);
(new user_card()) -> run($param);
