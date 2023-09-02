<?php

class Util {

    public static function logDir() {
        return ROOT . '/log/';
    }
    public static function log($msg, $category = 'info', $depth = 1) {
        $debugInfo = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, $depth);
        $file = $debugInfo[$depth - 1]['file'];
        $line = $debugInfo[$depth - 1]['line'];

        if (is_array($msg) || is_object($msg))
            $msg = print_r($msg, true);
        else if ($msg === null)
            $msg = 'NULL';
        else if ($msg === true)
            $msg = 'true';
        else if ($msg === false)
            $msg = 'false';
        $msg = "[" . date('Y-m-d H:i:s') . "] file $file line $line:\n$msg\n";

        $logfile = self::logDir() . "$category.txt";
        @file_put_contents($logfile, $msg, FILE_APPEND);
    }

    public static function requestGame()
    {
        $gameUrl = "http://10.10.10.2:9001/?Handler=Kick&RoleGuid=2020495863936745472&GroupId=2&ZoneId=3&sign=1";

        $this_header = array(
            "content-type: application/x-www-form-urlencoded; 
            charset=UTF-8"
        );
        self::log($gameUrl);
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_HTTPHEADER,$this_header);
        curl_setopt($ch, CURLOPT_URL, $gameUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_ENCODING, 'gzip');
        $ouput = curl_exec($ch);
        curl_close($ch);
        $ouput = mb_convert_encoding($ouput, 'UTF-8','GB2312');
        self::log($ouput);

        return $ouput;
    }

    public static function requestGameForKick($ip,$port,$groupId,$zoneId,$roleGuid)
    {
        $gameUrl = "http://$ip:$port/?Handler=Kick&GroupId=$groupId&ZoneId=$zoneId&sign=1&RoleGuid=$roleGuid";

        $this_header = array(
            "content-type: application/x-www-form-urlencoded; 
            charset=UTF-8"
        );
        self::log($gameUrl);
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_HTTPHEADER,$this_header);
        curl_setopt($ch, CURLOPT_URL, $gameUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_ENCODING, 'gzip');
        $ouput = curl_exec($ch);
        curl_close($ch);
        $ouput = mb_convert_encoding($ouput, 'UTF-8','GB2312');
        self::log($ouput);

        return $ouput;
    }


    public static function requestGameForBenefit($ip,$port,$groupId,$zoneId,$benefitId,$firstMailId,$commonMailId,$cycle,$day,$sendTime,$roleGuid=0,$addRole=0)
    {
        $gameUrl = "http://$ip:$port/?Handler=Benefit&GroupId=$groupId&ZoneId=$zoneId&sign=1&BenefitId=$benefitId&FirstMailId=$firstMailId&CommonMailId=$commonMailId&Cycle=$cycle&Day=$day&SendTime=$sendTime&RoleGuid=$roleGuid&AddRole=$addRole";

        $this_header = array(
            "content-type: application/x-www-form-urlencoded; 
            charset=UTF-8"
        );
        self::log($gameUrl);
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_HTTPHEADER,$this_header);
        curl_setopt($ch, CURLOPT_URL, $gameUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_ENCODING, 'gzip');
        $ouput = curl_exec($ch);
        curl_close($ch);
        $ouput = mb_convert_encoding($ouput, 'UTF-8','GB2312');
        self::log($ouput);

        return $ouput;
    }

    public static function requestGameForUser($ip,$port,$groupId,$zoneId,$roleGuid,$isDetail=0)
    {
        $gameUrl = "http://$ip:$port/?Handler=User&RoleGuid=$roleGuid&GroupId=$groupId&ZoneId=$zoneId&sign=1&IsDetail=$isDetail";

        $this_header = array(
            "content-type: application/x-www-form-urlencoded; 
            charset=UTF-8"
        );
        self::log($gameUrl);
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_HTTPHEADER,$this_header);
        curl_setopt($ch, CURLOPT_URL, $gameUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_ENCODING, 'gzip');
        $ouput = curl_exec($ch);
        curl_close($ch);
//        $ouput = mb_convert_encoding($ouput, 'UTF-8','GB2312');
        self::log($ouput);
        $res = json_decode($ouput, true);

        return $res['Data'];
    }

    public static function requestGameForUserDetail($ip,$port,$groupId,$zoneId,$roleGuid)
    {
        $gameUrl = "http://$ip:$port/?Handler=User&RoleGuid=$roleGuid&GroupId=$groupId&ZoneId=$zoneId&sign=1";

        $this_header = array(
            "content-type: application/x-www-form-urlencoded; 
            charset=UTF-8"
        );
        self::log($gameUrl);
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_HTTPHEADER,$this_header);
        curl_setopt($ch, CURLOPT_URL, $gameUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_ENCODING, 'gzip');
        $ouput = curl_exec($ch);
        self::log($ouput);
        curl_close($ch);
//        $ouput = mb_convert_encoding($ouput, 'UTF-8','GB2312');
        self::log($ouput);
        $res = json_decode($ouput, true);

        return $res['Data'];
    }

    public static function requestGameForMail($ip,$port,$groupId,$zoneId,$mailId,$reward,$param,$limitRoleGuids,$startTime,$endTime)
    {
        $gameUrl = "http://$ip:$port/?Handler=Mail&GroupId=$groupId&ZoneId=$zoneId&sign=1&MailId=$mailId&reward=$reward&param=$param&LimitRoleGuids=$limitRoleGuids&StartTime=$startTime&EndTime=$endTime";

        $this_header = array(
            "content-type: application/x-www-form-urlencoded; 
            charset=UTF-8"
        );
        self::log($gameUrl);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HTTPHEADER, $this_header);
        curl_setopt($ch, CURLOPT_URL, $gameUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_ENCODING, 'gzip');
        $ouput = curl_exec($ch);
        curl_close($ch);
        $ouput = mb_convert_encoding($ouput, 'UTF-8', 'GB2312');
        self::log($ouput);

        return $ouput;
    }
    /******************************************************************************************************************/
    /************************************************ 导出excel ********************************************************/
    /******************************************************************************************************************/
    /**
     *
     * @param array $data
     * @param $filename
     * @param bool $attach
     */
    public static function exportExcel(array $data, $filename, $attach = true) {
        if (!$data) return;

        $objPHPExcel = new PHPExcel();

        //二维数组， 单个worksheet
        if (!is_array(current(current($data)))) {
            $worksheet = $objPHPExcel->getSheet();
            $row_pos = 1;
            foreach ($data as $row) {
                $col_pos = 0;
                foreach ($row as $cell) {
                    $worksheet->setCellValueByColumnAndRow($col_pos, $row_pos, $cell);
                    $col_pos++;
                }
                $row_pos++;
            }
        }
        //三维数组， 多个worksheet
        else {
            $objPHPExcel->removeSheetByIndex(0);
            foreach ($data as $title => $content) {
                $title === '' and $title = 'empty';
                $worksheet = new PHPExcel_Worksheet($objPHPExcel, (string)$title);
                $objPHPExcel->addSheet($worksheet);
                $row_pos = 1;
                foreach ($content as $row) {
                    $col_pos = 0;
                    foreach ($row as $cell) {
                        $worksheet->setCellValueByColumnAndRow($col_pos, $row_pos, $cell);
                        $col_pos++;
                    }
                    $row_pos++;
                }
            }
        }

        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        if (!$attach)
            $objWriter->save($filename . '.xlsx');
        else {
            $filename = iconv('UTF-8', 'GBK', $filename);
            header('Content-Type: application/vnd.ms-excel');
            header("Content-Disposition: attachment;filename={$filename}.xlsx");
            header('Cache-Control: max-age=0');
            $objWriter->save('php://output');
        }

        $objPHPExcel->disconnectWorksheets();
        unset($objPHPExcel);
    }


    /******************************************************************************************************************/
    /****************************************** 数据库切换方式取单服数据 *************************************************/
    /******************************************************************************************************************/
    /**
     * 链接数据库
     * @param $host
     * @param $user
     * @param $passwd
     * @param $db
     * @param $port
     *
     * @return mysqli
     * @throws Exception
     */
    public static function getMysqlCon($host,$user,$passwd,$db,$port) {
        $mysql= new mysqli($host, $user, $passwd, $db, $port);
        if ($mysql->errno){
            throw new Exception($mysql>error);
        }
        $mysql->set_charset('utf8');
        return $mysql;
    }

    /**
     * @param $database
     * @param $table
     * @param $server_id
     * @param string $field
     * @param string $where
     * @param string $type
     * @param string $order
     * @param string $limit
     *
     * @return array
     */
    public static function get_single_data_byMysql($database, $table, $server_id, $field="*", $where='', $type='getList', $order='', $limit = '')
    {
        $server_info = (new ServerModel())->handle('getOne',array("where"=>"server_id={$server_id}"), 'server');
        if(!$server_info) return;

        if($database == 'log'){
            $base = $server_info['log_table'];
        }elseif($database == 'actor'){
            $base = $server_info['actor_table'];
        }

        $sql = "SELECT {$field} FROM `{$table}`";
        $where && $sql .= " WHERE $where";
        $order && $sql .= " ORDER BY $order";
        $limit && $sql .= " LIMIT $limit";

        $mysql = self::getMysqlCon($server_info['mysql_host'],$server_info['mysql_user'],$server_info['mysql_passwd'],$base,$server_info['mysql_port']);
        $query = $mysql->query($sql);
        if(!$query) return array();

        switch($type){
            case 'getOne':
                $res = $query->fetch_assoc();
                break;
            case 'getList':
                while($row = $query->fetch_assoc()){
                    $res[] = $row;
                }
                break;
            case 'dataTable':
                while($row = $query->fetch_assoc()){
                    $res[] = array_values($row);
                }

                $sql = "SELECT COUNT(*) AS count_data FROM  `{$table}`";
                $where && $sql= " WHERE $where";

                $query = $mysql->query($sql);
                $row = $query->fetch_assoc();
                $iTotalRecords = $row['count_data'];

                $sql = "SELECT COUNT(*) AS count_data FROM  `{$table}`";
                $query = $mysql->query($sql);
                $row = $query->fetch_assoc();
                $iTotalDisplayRecords= $row['count_data'];

                $res = array('aaData'=>$res,'iTotalRecords'=>$iTotalRecords,'iTotalDisplayRecords'=>$iTotalDisplayRecords);
                break;
        }
        $mysql->close();
        return $res;
    }


    /******************************************************************************************************************/
    /********************************************** GM功能 同步 ********************************************************/
    /******************************************************************************************************************/
    public static function sync($table,$server_id,array $data){
        $server= (new ServerModel())->handle('getOne',array("where"=>"server_id={$server_id}"), 'server');
        if(!$server) return false;

        $mysql = self::getMysqlCon(GAMECMDHOST,GAMECMDUSER,GAMECMDPASS,GAMECMDDBNAME,GAMECMDPORT); //dragon_h5

        $fields = $value = array();
        foreach ($data as $k => $v) {
            $fields[] = "`$k`";
			$v = addslashes(trim($v));
            $value[] = "'$v'";
        }
        $insert_fields = implode(',', $fields);
        $insert_value = "(".implode(',', $value).")";

        $sql = "INSERT INTO `{$table}` ({$insert_fields}) VALUES {$insert_value}";

        if($mysql->query($sql)){
            return true;
        }else{
            return false;
        }
    }



    /******************************************************************************************************************/
    /****************************************************** 纯js图表库 *************************************************/
    /******************************************************************************************************************/
    //参数意义分别是显示图表的div id(重要，请参考前台模版内容) ，显示数据，标题，X轴名字，Y轴名字，X步长
    public static function init_highchart($contains,$arrData=array(),$title='',$xname='',$yname='',$size=1){

        if(!is_array($arrData))//
            $arrData = array();

        require_once (ROOT . '/library/Highchart.php');
        $hc = new Highchart(null,10);
        //存放图表数据
        $chart_data = array();
        $chart_data['chart'] = array("type"=>"line",
                                     "renderTo"=>$contains
        );
        $chart_data['title']=array('text'=>$title);
        $chart_data['xAxis']['title']=array('text'=>$xname);
        $chart_data['xAxis']['categories']=array();
        $chart_data['xAxis']['tickInterval']=$size;

        /*$arrData目前只能支持原程序里生成的数据
            格式类似
            $arrData = array(
                array('1','123'),
                array('2','412'),
                .....
            )
            每条数据存放一个坐标点(x,y)
        */
        foreach($arrData as $key=>$value){
            isset($value[0])&&$chart_data['xAxis']['categories'][] = $value[0];
        }
        $chart_data['yAxis']['title']=array('text'=>$yname);
        $chart_data['plotOptions']=array("line"=>
                                             array('dataLables'=>array('enabled'=>true))
        );
        $chart_data['series']=array();
        $seri_data = array();
        foreach($arrData as $value){
            isset($value[1])&&$seri_data[]= intval($value[1]);
        }
        $chart_data['series'][]=array("name"=>$yname,'data'=>$seri_data);

        foreach($chart_data as $key=>$value){
            $hc->offsetSet($key,$value);
        }
        //次数分布
        $times_chart = $hc->render();
        $times_chart = "<script language='javascript'>"
            .$times_chart.
            "</script>";
        return $times_chart;
    }


    /******************************************************************************************************************/
    /************************************* 获取道具配置文件items.txt内容转化为数组 ****************************************/
    /******************************************************************************************************************/
    public static function itemsToArray(){
        $filename = __DIR__."/items.txt";
        $re = explode("\r\n",file_get_contents($filename));
        foreach($re as $val){
            if( ! $val) continue;
            $foo = explode("|", $val);
            $items[$foo[0]] = $foo[1];
        }
        return $items;
    }

}
