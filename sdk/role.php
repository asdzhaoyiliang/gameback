<?php
	require_once 'conf/main.php';
	header('Access-Control-Allow-Origin:*');    
	header('Access-Control-Allow-Methods:GET');   
	header('Access-Control-Allow-Headers:x-requested-with,content-type');

	if(!$server || !account || !role)
		return;
	
	$check_key = "4ee76f735fa8c1bb";

    $server_info = (new ServerModel())->handle('getOne',array("where"=>"server_id={$server}"), 'server');
        if(!$server_info) return;
	//hjy
	if(strstr($account,"10386_") != false)
	{
		$isCreateRole = "false";
		$gameId = 245;
		$nowtime = time();
		$roleCreateTime = 0;
		$key = "d37930e690e7286fffe45e70c49e9688";

		$mysql = Util::getMysqlCon(GAMEHOST, GAMEUSER, GAMEPASS, GAMEDBNAME,GAMEPORT);
		$sql = "SELECT userid,createtime from `globaluser` where account = '{$account}'";
		$query = $mysql->query($sql);
		$row = $query->fetch_assoc();
		if($row)
		{	
			$userid = $row['userid'];
			$roleCreateTime = strtotime($row['createtime']);
			if( ($now - $roleCreateTime) < 60 )
			{
				$isCreateRole = "true";
			}
			$serverName = $server_info['name'];
			//role
			$GAMESQL = Util::getMysqlCon($server_info['mysql_host'],$server_info['mysql_user'],$server_info['mysql_passwd'],$server_info['actor_table'],$server_info['mysql_port']);
			$sql = "select * from `actors` where accountid = '{$userid}' limit 1";
			$row = $GAMESQL->query($sql)->fetch_assoc();
            if($row)
			{	
				$userRoleId = $row['actorid'];
				$userRoleName = $row['actorname'];
				$userRoleBalance = $row['nonbindyuanbao'];
				$vipLevel = $row['viplevel'];
				$userRoleLevel = $row['level'];
				$gameRoleMoney = GetRolePayMoney($userRoleId,$server);
				$partyId = $row['gildid'];
				$partyName = GetGuildName($GAMESQL,$partyId);
				if($row['sex'] == 0){
					$gameRoleGender = "male";
				}else{
					$gameRoleGender = "famale";
				}
				$gameRolePower = $row['battlepower'];
				
				$data = array(
					'gameId' => $gameId,
					'gameRoleGender' => $gameRoleGender,
					'gameRolePower' => $gameRolePower,
					'partyId' => $partyId,
					'partyName' => $partyName,
					'roleCreateTime' => $roleCreateTime,
					'serverId' => $server,
					'serverName' => urlencode($serverName),
					'uid' => $account,
					'userRoleBalance' => $userRoleBalance,
					'userRoleId' => $userRoleId,
					'userRoleLevel' => $userRoleLevel,
					'userRoleName' => urlencode($userRoleName),
					'username' => $account,
					'vipLevel' => $vipLevel
				);
				
				$str = "";
				foreach($data as $k => $v)
				{
					$str = $str.$k."=".$v."&";
				}
				$md5data = array(
					'gameId' => $gameId,
					'gameRoleGender' => $gameRoleGender,
					'gameRolePower' => $gameRolePower,
					'partyId' => $partyId,
					'partyName' => $partyName,
					'roleCreateTime' => $roleCreateTime,
					'serverId' => $server,
					'serverName' => $serverName,
					'uid' => $account,
					'userRoleBalance' => $userRoleBalance,
					'userRoleId' => $userRoleId,
					'userRoleLevel' => $userRoleLevel,
					'userRoleName' => $userRoleName,
					'username' => $account,
					'vipLevel' => $vipLevel
				);

				$md5str = "";
				foreach($md5data as $k => $v)
				{
					$md5str = $md5str.$k."=".$v."&";
				}
				$md5str = $md5str."key=".$key;
				
				$url = "http://www.hjygame.com/sdk.php?ac=gamerole&".$str."sign=".md5($md5str);
				geturl($url);
			}
        }

	}

	function GetGuildName($GAMESQL, $guildid){
		if($guildid == 0) return "";
		$sql = "SELECT guildname  from `guildlist` where guildid = '{$guildid}' ";
		$row  = $GAMESQL->query($sql)->fetch_assoc();
        if($row){
			return $row['guildname'];
		}
		return "";
	}
	
	function GetRolePayMoney($roleId,$serverId){
		$mysqli = new mysqli(MYSQLHOST, MYSQLUSER, MYSQLPASS, DB_NAME,MYSQLPORT);
        $res = $mysqli->query("select sum(money) as money from bg_order where actorid = '{$roleId}' and serverId = '{$serverId}' ");
        $row = $res->fetch_assoc();
		if($row){
			return $row['money'];
		}else{
			return 0;
		}
	}
	
	function  geturl($url){
		$ch = curl_init(); 
		$timeout = 5; 
		curl_setopt ($ch, CURLOPT_URL, $url); 
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1); 
		curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout); 
		$file_contents = curl_exec($ch); 
		curl_close($ch); 
		echo $file_contents; 
	}


?>



