<?php
/**
 * Class UserModel
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class UserModel extends Model{

    /**
     * 获取用户列表
     * @return array
     */
    public function getData(){
        $sql = "SELECT u.*,ug.name FROM bg_user AS u LEFT JOIN bg_user_group AS ug ON u.groupid=ug.groupid";
        $userList = $this->handle('find', array('sql'=>$sql), 'user');

        foreach($userList as $k=>$user){
            $user['groupname']              = $user['name'];
            $user['created_format']         = $user['created']? date('Y-m-d', $user['created']): '-';
            $user['last_login_time_format'] = $user['last_login_time']? date('Y-m-d', $user['last_login_time']): '-';
            $user['expiration_format']      = $user['expiration']? date('Y-m-d', $user['expiration']): '-';

            if($user['status'] != USER_STATUS_NORMAL || ($user['expiration'] > 0 && $user['expiration'] < time())){
                $user['status_msg'] = '异常';
            }else{
                $user['status_msg'] = '正常';
            }

            $userList[$k] = $user;
        }
        return $userList;
    }

    // --------------------------------------------------------------------

    /**
     * 更新
     * @param $data
     *
     * @return array|bool|mixed
     */
    public function userUpdate($data){
        return $this->handle('update', array('data' => $data), 'user');
    }

    // --------------------------------------------------------------------

    /**
     * 重置密码
     * @param int $uid
     * @return array
     */
    public function resetPassword($uid=0){
        if($uid>0){
            $randomPassword = $this->_randomPassword();
            $password = $randomPassword['secret'];
            $data = array('uid' => $uid, 'password' => $password);
            $this->userUpdate($data);
            return $randomPassword['str'];
        }

        $users = $this->userGetList();
        $now = time();
        foreach($users as $user){
            $user_data = $user['data']? unserialize($user['data']): array();
            if($now - $user_data['change_password_time'] > 86400*720){
                $randomPassword = $this->_randomPassword();
                $password = $randomPassword['secret'];
                $data = array('uid' => $user['uid'], 'password' => $password);
                $this->userUpdate($data);
                $resetUsers[] = $user['username'];
            }
        }
        return $resetUsers;
    }

    // --------------------------------------------------------------------

    /**
     * 通过uid获取用户信息
     * @param $uid
     * @return mixed
     */
    function getUserByUid ($uid) {
        return $this->handle('getOne', array('where' => "uid=$uid"), 'user');
    }

    // --------------------------------------------------------------------

    /**
     * 添加用户
     * @param $data
     * @return array
     * @throws Exception
     */
    function addUser ($data) {
        $now = time();
        if(!preg_match("/^[a-z|\d|_]{3,14}$/",$data['username'])){
            return array('code' => -6);
        }

        $data['expiration'] = strtotime($data['expiration']);
        if($data['expiration'] < $now){
            return array('code' => -5);
        }

        $data['username'] = trim($data['username']);
        $user = $this->handle('getOne',array('where'=>"username='{$data['username']}'"), 'user');

        if ($user) {
            //将超级管理员的组别重置
            if($data['groupid'] == 1 && $user['groupid'] != 1)
            {
                $data_t = array(
                    'uid' => $user['uid'],
                    'groupid' => 1,
                );
                $this->userUpdate($data_t);
            }
            return array('code' => -2);; //已存在的用户名
        }

        $randomPassword = $this->_randomPassword();
        $data['password'] = $randomPassword['secret'];
        $data['status'] = USER_STATUS_NORMAL;
        $data['created'] = $now;

        $result = $this->handle('insert', array('data'=>$data), 'user');

        return $result ? array('code' => 1, 'msg'=>$randomPassword['str']) : array('code' => -1);; //成功：失败
    }

    // --------------------------------------------------------------------

    /**
     * @return array
     */
    function _randomPassword(){
        $str = create_rand_code(12);
        $secret = $this->secretPassword($str);
        return array('str' => $str, 'secret' => $secret);
    }

    // --------------------------------------------------------------------

    /**
     * 修改密码
     * @param $data  array
     * @param null $uid  用户id
     * @return array
     */
    public function changePassword($data, $uid = null){
        $now = time();
        if($data['password'] != $data['password2'])
            return array('code' => -3);//两次密码输入不同

        $validPassword = $this->validPassword($data['password']);
        if($validPassword <= 0){
            return array('code' => $validPassword);
        }

        if(!$uid){
            $uid = $_SESSION['uid'];
        }
        $user = $this->getUserByUid($uid);
        if($user['password'] != $this->secretPassword($data['old_password'])){
            return array('code' => -2);
        }
        $user_data = unserialize($user['data']);
        $password_history = $user_data['password_history']? $user_data['password_history']:array();
        //判断密码是否在最近5次以内使用过的
        if(!empty($password_history)){
            foreach($password_history as $tmp){
                $arr = explode('|', $tmp);
                if($this->secretPassword($data['password']) == $arr[0]){
                    return array('code' => -4, 'msg' => date('Y-m-d H:i:s', $arr[1]));
                }
            }
        }

        //记录密码历史
        if(count($password_history) >=5 ){
            array_shift($password_history);
        }
        array_push($password_history, $this->secretPassword($data['password']).'|'.$now);
        $user_data['password_history'] = $password_history;

        //记录最后修改密码时间
        $user_data['change_password_time'] = $now;
        $data = array(
            'uid' => $uid,
            'password' => $this->secretPassword($data['password']),
            'data' => serialize($user_data),
        );
        return array('code' => $this->userUpdate($data));
    }

    // --------------------------------------------------------------------

    /**
     * 验证密码
     * @param $password
     * @return int
     */
    public function validPassword($password){
        if(strlen($password) < PASSWORD_LENGTH){
            return -11;//密码长度小于PASSWORD_LENGTH位
        }
        if(!preg_match("/\d+/",$password) || !preg_match("/[a-zA-Z]+/",$password)){
            return -12;//密码必须同时包含数字和字母
        }
        return 1;
    }

    // --------------------------------------------------------------------

    function secretPassword($password){
        return md5(SALT. $password);
    }

}
/* End of file UserModel.php */
/* Location: ./model/UserModel.php */

