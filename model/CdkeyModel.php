<?php
/**
 * Class CdkeyModel
 * 激活码
 * @copyright       Copyright&copy;2015, ZJL
 * @author          ZJL <vccrazy@qq.com>
 * @version         1.0
 * @since           2015-09-01
 */
class CdkeyModel extends Model{

    public function getData($type,$conditon, $tableName) {
        $res = $this->handle($type, $conditon, $tableName);
        if($res){
            switch($tableName){
                case 'cdkey':
                    foreach($res as $row){
                        $aaData[] = [
                            $row['cdkey'],
                            $row['batch_id'],
                            $row['name'],
                            $row['item_id'],
                            $row['limit_times'],
                            $row['use_times'],
                            $row['limit_pi'],
                            $row['mutex'],
                            $row['serverid']==999999999 ? '全服' : $row['serverid'],
                            $row['stime']."<br/>".$row['etime'],
                            $row['des'],
                        ];
                    }
                    break;
                case 'cdkey_use':
                    foreach($res as $row){
                        $aaData[] = [
                            $row['cdkey'],
                            $row['actorid'],
                            $row['serverid'],
                            $row['batch_id'],
                            $row['logdate'],
                        ];
                    }
                    break;
            }
        }
        return $this->returnJsonData($conditon, $aaData?$aaData:array());
    }

}
/* End of file CdkeyModel.php */
/* Location: ./model/CdkeyModel.php */
