<?php
/**
 * Class LogModel
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class LogModel extends Model{

    public function getData($conditions){
        $res = $this->handle('getList', $conditions, 'log');

        if($res){
            foreach ($res as $log) {
                $aaData[] = array(
                    "<img src=\"style/images/details_open.png\" /><span style=\"display:none;\" class=\"log_id\">{$log['log_id']}</span>",
                    $log['log_id'],
                    $log['ctrl'],
                    $log['act'],
                    $log['desc'],
                    $log['username'],
                    $log['ip'],
                    date('Y-m-d H:i:s', $log['created']),
                );
            }
        }
        return $this->returnJsonData($conditions, $aaData ?: array());
    }

    // --------------------------------------------------------------------

    /**
     * 添加日志
     * @param  string $desc 描述
     * @return bool   true添加成功,false添加失败
     * @throws Exception
     */
    public function logAdd($desc){
        $ctrl = isset($_GET['ctrl']) ? trim($_GET['ctrl']) : 'index';
        $act =  isset($_GET['act']) ? trim($_GET['act']) : 'index';
        

        $canNotLogData = array('user&change_password', 'index&login');
        if(!in_array($ctrl.'&'.$act, $canNotLogData)){
            $data = array('POST' => $_POST, 'GET' => $_GET);
        }else{
            $data = array('POST' => '不保存用户密码明文');
        }

        $data = array(
            'uid' => $_SESSION['uid'],
            'username' => $_SESSION['username'],
            'ip' => get_ip(),
            'ctrl' => $ctrl,
            'act' => $act,
            'desc' => $desc,
            'data' => serialize($data),
            'created' => time(),
        );
        return $this->handle('insert', array('data'=>$data), 'log');
    }

}
/* End of file LogModel.php */
/* Location: ./model/LogModel.php */
