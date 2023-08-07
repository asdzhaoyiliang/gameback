<?php
/**
 * Class OrderModel
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class OrderModel extends Model{

    public function getData($condition,$tableName){
        $res = $this->handle('getList',$condition,$tableName);
        if($res){
            switch($tableName){
                case 'order_stat':
                    foreach($res as $val){
                        $con = array(
                            'where'  => "logdate = '{$val['logdate']}' AND serverid = {$val['serverid']} ",
                            'fields' => 'new_reg_num AS num,total_reg_num'
                        );
                        $reg = $this->handle('getOne', $con, 'integrated_data');
                        
                        $where = " serverid = {$val['serverid']} AND create_time like '%{$val["logdate"]}%'";
                        $sql = "select account,count(*),money from bg_order where {$where} group by account";
                       	$this -> query($sql);
                    	$two = array();
                    	$count = 0;
        				while ($row = $this->fetch_assoc()) {
            				$two[] = $row;
            				if($row['count(*)'] >=2) $count++;
        				}
                        $aaData[]=array(
                            $val['logdate'],
                            $val['num'],
                            $val['times'],
                        	$count,
                            $val['money'],
                            $val['num'] ? round($val['money']/ $val['num'],2) : 0,

							//$reg['num'] ? round($val['num']*100/$reg['num'], 2)."%" : 0,
							//$reg['num'] ? round($val['money']/$reg['num'], 2): 0,
                            //$val['new_role_charge_num'],
                            //$reg['num'] ? round($val['new_role_charge_num']*100/ $reg['num'],2)."%" : 0,

                            $val['f_num'],
                            $reg['num'] ? round($val['f_num']*100/ $reg['num'],2)."%" : 0,
                            //$val['f_money'],
                            //$val['f_num'] ? round($val['f_money']/ $val['f_num'],2) : 0,
                        );
                    }
                    break;
                case 'order_rank':
                    foreach($res as $val){
                        $aaData[]=array(
                            $val['rank'],
                            $val['account'],
                            $val['money'],
                            $val['times'],
                            $val['last_charge_time'],
                            $val['serverid'],
                        );
                    }
                    break;
                case 'order':
                case 'order_fail':
                    foreach($res as $key=>$val){
                        $aaData[$key]=array(
                            $val['create_time'],
                            $val['money'],
                            $val['account'],
                            $val['actorid'],
                            $val['level'],
                            $val['serverid'],
                            $val['cp_orderid'],
                            $val['orderid'],
                        );
                        if($tableName == 'order_fail'){
                            $aaData[$key][]=$val['errorMsg'];
                        }
                    }
                    break;
                default:
                    $aaData = array();
                    break;

            }
        }
        return $this->returnJsonData($condition, $aaData?$aaData:array());
    }
}
/* End of file OrderModel.php */
/* Location: ./model/OrderModel.php */