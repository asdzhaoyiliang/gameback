<?php
/**
 * Class StatModel
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class StatModel extends Model {

    /**
     * 获取并处理dataTables需要的数据
     * @param $condition
     * @param $tableName
     * @param $case
     *
     * @return string
     */
    function getData($condition, $tableName, $case){
        $data = $this->handle("getList", $condition, $tableName);
        switch($case){
            case "stat_level":
                return $this->level($data, $condition, $tableName);
                break;
            case 'online_time':
                return $this->onlineTime($data, $condition, $tableName);
                break;
            default:
                $aaData = $this->dealData($data, $case);
                return $this->returnJsonData($condition, $aaData);
                break;
        }
    }

    // --------------------------------------------------------------------

    /**
     * 获取并处理等级统计需要的数据
     * @param $data
     * @param $condition
     *
     * @return string
     */
    function level($data, $condition){
        $data = $data[0];
        if( $data ) {
            $content = json_decode($data['content'], true);
            $total = array_sum( array_column($content,'num'));
            foreach($content as $val){
                $aaData[]=array(
                    $data['logdate'],
                    $val['level'],
                    $val['num'],
                    $total ? round($val['num']*100/$total, 2)."%" : 0
                );
            }
            $aaData[] = array('', '合计', $total,"100%");
        }
        return $this->returnJsonData($condition, $aaData?$aaData:array());
    }

    // --------------------------------------------------------------------

    /**
     * 获取并处理在线时长需要的数据
     * @param $data
     * @param $condition
     * @param $tableName
     *
     * @return string
     */
    function onlineTime($data, $condition, $tableName){
        if($data){
            $data = $data[0];
            $content = json_decode($data['content'], true);
            $num = count($content);
            $total_num = array_sum(array_column($content,'num'));
            $total_times = array_sum(array_column($content,'times'));

            $s = gmstrftime('%H:%M:%S',round($total_times/$num))."(平均)";
            $t = ceil($total_num/$num)."次(平均)";
            $aaData[] = array('合计', '', $s, $t);

            foreach($content as $val){
                $aaData[]=array(
                    $data['logdate'],
                    $val['actorid'],
                    gmstrftime('%H:%M:%S',$val['times']),
                    $val['num'],
                );
            }
        }
        return $this->returnJsonData($condition, $aaData?$aaData:array());
    }

    // --------------------------------------------------------------------

    /**
     * 数据整理
     * @param $data
     * @param $case
     * @param array $other
     *
     * @return array
     */
    function dealData($data, $case, $other = array()){
        $aaData=array();
        if($data){
            switch($case){
                case 'stat_reg'://注册统计
                case 'stat_login'://登录统计
                    $amount = 0;
                    $data = $data[0];
                    $content = json_decode($data['content'], true);
                    foreach($content as $val){
                        $aaData[]=array(
                            $data['logdate'] ." ". $val['hour'] .":00",
                            $val['num'],
                        );
                        $amount += $val['num'];
                    }
                    $aaData[] = array('合计', $amount);
                    break;
                case 'economy_all'://产销统计
                    foreach($data as $val){
                        $arr[$val['logdate']][$val['kingdom']] = $val;
                    }
                    foreach($arr as $logdate=>$val){
                        $aaData[] = array(
                            $logdate,
                            $val['expenditure'] ? $val['expenditure']['amount'] : 0,
                            $val['expenditure'] ? $val['expenditure']['num'] : 0,
                            $val['expenditure']&&$val['expenditure']['num'] ? round($val['expenditure']['amount']/$val['expenditure']['num'],2) : 0,
                            $val['earning'] ? $val['earning']['amount'] : 0,
                            $val['earning'] ? $val['earning']['num'] : 0,
                            $val['earning']&&$val['earning']['num'] ? round($val['earning']['amount']/$val['earning']['num'],2) : 0,
                        );
                    }
                    break;
                case 'rank':
                    $sql = "SELECT * FROM bg_expend_type";
                    $expend = $this->handle("find", array('sql'=>$sql));
                    $phylum = $classfield = array();
                    if($expend){
                        foreach($expend as $val){
                            $a = $val['phylum'];
                            $b = $a.$val['classfield'];
                            $phylum[$a] = $val['phylum_name'];
                            $classfield[$b] = $val['classfield_name'];
                        }
                    }

                    $data = $data[0];
                    $content = json_decode($data['content'], true);
                    foreach($content as $val){
                        $a = $val['phylum'];
                        $b = $a.$val['classfield'];

                        $aaData[]=array(
                            $data['logdate'],
                            $val['rank'],
                            $phylum[$a] ? $phylum[$a] : $a,
                            $classfield[$b] ? $classfield[$b] : $b,
                            $val['amount'],
                            $val['radio']."%",
                        );
                        $amount +=  $val['amount'];
                        $radio += $val['radio'];
                    }
                    $aaData[] = array('合计', '', '', '', $amount, round($radio,0)."%");
                    break;
                case 'integrated_data':
                    foreach($data as $val){
                        $aaData[]=array(
                            $val['logdate'],
                            $val['total_reg_num'],
                            $val['new_reg_num'],
                            $val['total_role_num'],
                            $val['new_role_num'],
                            $val['login_num'],
                        );
                    }
                    break;
                case 'keep':
                    foreach($data as $key=>$val){
                        $aaData[$key][] = $val['logdate'];
                        for($i=1 ; $i<8 ; $i++){
                            $day = $val['day'.$i];
                            if( $val['account']==0 || $day==0){
                                $radio = 0;
                            }else{
                                $radio = round($day*100/$val['account'],2)."%";
                            }
                            $aaData[$key][] = $radio."<span style='color:red;'>【{$day}】</span>";
                        }
                        $aaData[$key][] = $val['account'];
                    }
                    break;
                case 'phone_stat':
                    $phoneBrand = CDict::$phoneBrand;

                    $data = $data[0];
                    $content = json_decode($data['content'], true);

                    usort($content, function($a, $b) {
                        $al = $a['brand_num'];
                        $bl = $b['brand_num'];
                        if ($al == $bl)  return 0;
                        return ($al > $bl) ? -1 : 1;
                    });

                    foreach($content as $val){
                        $brand = strtolower($val['brand']);
                        $str = '';
                        $type = $val['type'];
                        uasort($type, function($a, $b) {
                            $al = $a;
                            $bl = $b;
                            if ($al == $bl)  return 0;
                            return ($al > $bl) ? -1 : 1;
                        });
                        foreach($type as $k=>$v){
                            $str .= "$k : <span style='color: #ff0000'>$v</span>,&nbsp;&nbsp;";
                        }

                        $aaData[]=array(
                            $data['logdate'],
                            $phoneBrand[$brand] ? $phoneBrand[$brand] : $val['brand'],
                            $val['brand_num'],
                            $str
                        );
                    }
                    break;
                case 'phone':
                    foreach($data as $val){
                        $phoneBrand = CDict::$phoneBrand;
                        $brand = strtolower($val['phone_brand']);
                        $aaData[]=array(
                            $val['logdate'],
                            $val['actorid'],
                            $val['level'],
                            $phoneBrand[$brand] ? $phoneBrand[$brand] : $val['phone_brand'],
                            $val['phone_type'],
                            $val['phone_version'],
                            $val['dpi'],
                            $val['net_supplier'],
                            $val['net_type'],
                            $val['login_date'],
                        );
                    }
                    break;
            }
        }
        return $aaData;
    }

}
/* End of file StatModel.php */
/* Location: ./model/StatModel.php */