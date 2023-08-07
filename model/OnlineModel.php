<?php
/**
 * Class OnlineModel
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class OnlineModel extends Model{


    /**
     * 实时在线数据
     *
     * @param $stime     int 开始时间
     * @param $server_id int 服务器id
     *
     * @return array
     */
    public function olData($stime, $server_id) {
		date_default_timezone_set('PRC');
        $data = array();
        $etime = $stime + 24 * 3600;

        if($stime<strtotime("today")){
            $where= "unix_timestamp(logdate)>=$stime AND unix_timestamp(logdate)<$etime AND serverindex=$server_id";
            $res = $this->handle('getOne', array('where'=>$where), 'online');
            if($res){
               $content = json_decode($res['content'], true);
                foreach($content as $key=>$val){
                    foreach($val as $k=>$v){
                        $data[$key][$k] = $v;
                    }
                }
            }else{
                $data['min'] = $data['hour'] = array();
            }

            return $data;
        }

        //如果是时间是今天，到单服取数据
        $etime = $stime + 24 * 3600;
        $etime > time() and $etime = time() - time() % 300;
        $where= "unix_timestamp(logdate)>=$stime AND unix_timestamp(logdate)<$etime AND serverindex=$server_id";
        $res = Util::get_single_data_byMysql('log','log_onlinecount_'.date("Ymd",$stime),$server_id,"*",$where);
        if($res){
            foreach($res as $row){
                if($row['onlinecount'] == 0) continue;

                $t = strtotime($row['logdate']);
                $data['min'][date('H:i', $t)]  += $row['onlinecount'];

                if( date('i', $t) == '0'){
                    $data['hour'][date('H:00', $t)] = $row['onlinecount'];
                }
            }
        }else{
            $data['min'] = $data['hour'] = array();
        }

        return $data;
    }

    // --------------------------------------------------------------------

    /**
     * 综合在线
     * @param $stime      int  开始时间
     * @param $etime      int  结束时间
     * @param $server_id  int  服务器id
     *
     * @return array
     */
    public function olDatac( $stime, $etime, $server_id) {
        $condition=array(
            'where'=> "unix_timestamp(logdate)>=$stime AND unix_timestamp(logdate)<$etime AND serverindex=$server_id",
            'order'=>" logdate ASC"
        );
        $list = $this->handle('getList', $condition, 'online');
        $result = $tem_date=$tem=$res=[];
        if($list){
            foreach($list as $row){
                $date= date('m-d', strtotime($row['logdate']));
                $tem_date[$date]=$date;
                $result[$date]['role_max'] = $row['max']?intval($row['max']):0;
                $result[$date]['role_avg'] = $row['avg']?intval($row['avg']):0;
                $result[$date]['role_min'] = $row['min']?intval($row['min']):0;
            }
        }
        foreach ($result as $k => $v) {
            foreach($v as $key=>$val){
                $tem[$key] []= $val;
            }
        }
        foreach($tem as $k=>$v){
            $res[$k]=json_encode($v);
        }
        $res['x']=json_encode(array_values($tem_date));
        $res['num'] = count($res['x']);
        return $res;
    }

}
/* End of file OnlineModel.php */
/* Location: ./model/OnlineModel.php */