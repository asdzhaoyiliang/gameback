<?php
/**
 * Class UserModel
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class LoginModel extends Model{

    /**
     *
     * @param $local true为本地登录，false为远程登录，本地登录需要验证login_token，验证码
     * @param unknown_type $username
     * @param $password 如果为远程登录，$password需要是已加密的
     * @param unknown_type $agent
     * @param unknown_type $server
     * @param unknown_type $ip
     * @return string
     */
    public function doLogin ($username, $password, $local=true, $login_flag='') {
        $ip = get_ip();



        //如果是中央服本地登录，则判断login_token和验证码
        if($local){
            if ($_POST['login_token'] != $this->sessionDo('get','login_token')) {
                //return 'can not login'; //不允许登录
            }
            if(!$this->sessionDo('get','login_verify') && strtolower($_POST['verification_code']) != strtolower($this->sessionDo('get','verification_code'))){
                //return 'verification code error';//验证码错误
            }
        }


        //一小时内账号登录错误5次进行封禁账号处理
        if(!$this->failedLogin('', $username, 'failedLogin5times')){
            return 'fail login many times';
        }


        //一小时内同ip错误登录10次以上进行封ip处理
        if(!$this->failedLogin($ip, '', 'failedLoginIp')){
            return 'fail login many times';
        }


        if($login_flag){
            $user = $this->handle('getOne', array('where' => "username='{$username}'"), 'user');
        }else{
            $password = $local ? $this->secretPassword($password): $password;
            $where = "username = '{$username}' AND password = '{$password}'" ;
			//return $where;
            $user = $this->handle('getOne', array('where' => $where), 'user');
        }


        if (empty($user)) { //用户名密码错误
            $this->failedLogin($ip,$username,'failedLoginSave');
            return 'user error';
        }


        if($user['status'] != USER_STATUS_NORMAL){//账号状态异常
            return 'status error';
        }
        if($user['expiration'] > 0 && $user['expiration'] < time()){
            //return 'expirate';//账号过期
        }

        if($local){
            $this->setLoginSession($user);
            //更新用户最后登录时间和ip
            $data = array('uid' => $user['uid'],'last_login_time' => time(),'last_login_ip' => $ip );
            $this->handle('update', array('data'=>$data), 'user');
        }

        return 'success'; //登录成功
    }

    // --------------------------------------------------------------------

    /**
     * 退出登录
     */
    public function logout () {
        if($this->sessionDo('get', 'admin')){
            $this->sessionDo('del', 'admin');
        }
    }

    // --------------------------------------------------------------------


    /**
     * 登录成功后设置session
     * @param $user
     */
    function setLoginSession($user){
        $this->sessionDo('set', 'uid', $user['uid']);
        $this->sessionDo('set', 'username', $user['username']);
        $this->sessionDo('set', 'groupid', $user['groupid']);
        $this->sessionDo('set', 'admin', true);
        $this->sessionDo('set', 'login_time', time());

        $groupid = $user['groupid'];
        $group = (new UsergroupModel())->groupGetOne($groupid);
        $_SESSION['group_channel'] = $group['channel'];
    }

    // --------------------------------------------------------------------

    function makeLoginToken(){
        return $this->sessionDo('set','login_token', random(10));
    }

    // --------------------------------------------------------------------

    function secretPassword($password){
        return md5(SALT. $password);
    }

    // --------------------------------------------------------------------

    //登录错误处理
    public function failedLogin($ip='', $username='', $case){
        $tableName = 'failed_login';
        switch($case){
            case 'failedLogin5times':
                //一小时内账号登录错误5次进行封禁账号处理
                $where = "`created` >".(time()-3600)." AND `username`='{$username}'";
                $failTimes = $this->handle('count', array('where'=>$where), $tableName);
                return $failTimes >= 5 ? FALSE : TRUE;
                break;
            case 'failedLoginIp':
                //一小时内同ip错误登录10次以上进行封ip处理
                $where = "created >".(time()-3600)." AND ip='{$ip}'";
                $failTimes = $this->handle('count', array('where'=>$where), $tableName);
                return $failTimes >= 10 ? FALSE : TRUE;
                break;
            case 'failedLoginSave':
                //所有错误登录均进行记录，但登录ip白名单中的ip不进行封禁
                $data = array('ip' => $ip,'username' => $username,'created' => time());
                $this->handle('insert', array('data'=>$data), 'failed_login');
                break;
        }
    }

    // --------------------------------------------------------------------

    //session处理
    public function sessionDo($case, $name, $value=''){
        switch($case){
            case 'set': //设置用户session
                return $_SESSION[$name] = $value;
                break;
            case 'get': //获取用户session
                return $_SESSION[$name];
                break;
            case 'del':  //删除用户session
                unset($_SESSION[$name]);
                break;
        }
    }

    // --------------------------------------------------------------------

    /**
     * 权限判断
     * @param string $ctrl
     * @param string $act
     * @return int
     */
    public function hasPurview($ctrl='', $act=''){
        global $__global;
        $noPermissionPage = $__global['noPermissionPage'];
        $mustPassPage = $__global['mustPassPage'];
        $ctrl = $ctrl? $ctrl: 'index';
        $act = $act? $act: 'index';
        $permission = "{$ctrl}_{$act}";


        //如果是登录页面和显示验证码的页面则不需要权限，直接通过
        if(in_array($permission, $noPermissionPage)){
            return 1;
        }

        $user = $this->adminIsLogin();

        //未登录
        if(!$user){
            return -1;
        }

        //如果用户状态不正确也不能通过，实现在线封禁
        if($user['status'] != USER_STATUS_NORMAL){
            return -4;
        }
  
  
		//对特定的用户组权限判断 2017-1-19
		if($user['groupid'] == 1 || $user['groupid'] == 6){	
			$pass = "pass";
			$now = time();
            $this->sessionDo('set', 'login_time', $now);
			return 1;
		}
		
		
        $usergroupModel = new UsergroupModel();
        $group = $usergroupModel->groupGetOne($user['groupid']);

        //用户组ip白名单过滤
        if($group['allow_ip_data'] && !in_array(get_ip(), $group['allow_ip_data'])){
            return -2;
        }

        //已登录用户访问必选权限页面必须通过，如index_index
        if(in_array("{$ctrl}_*", $mustPassPage) || in_array($permission, $mustPassPage)){
            $pass = "pass";
        }
        /**
         * 已登录用户
         * 如果具有所有权限
         * 或者具有所在组的权限
         * 或者具有当前页面权限
         * 则通过
         */
        if($group && (in_array('all', $group['center_modules_data'])
                || in_array("{$ctrl}_*", $group['center_modules_data'])
                || in_array($permission, $group['center_modules_data']))){
            $pass = "pass";

        }
        if($pass == "pass"){
            $now = time();
            $this->sessionDo('set', 'login_time', $now);
            return 1;
        }else{
            //没有访问权限
            return -3;
        }
    }

    // --------------------------------------------------------------------

    /**
     * 判断是否是管理者登录
     * @return bool|mixed
     */
    public function adminIsLogin () {
        $now = time();
        $login_time = $this->sessionDo('get', 'login_time');

        if ($this->sessionDo('get', 'admin') != true || ! $login_time || $login_time < $now - 43200 || !$this->sessionDo('get', 'uid')) {
            return false;
        }

        $uid = $this->sessionDo('get', 'uid');
        $user = $this->handle('getOne', array('where'=>"uid=$uid"), 'user');

        if(!$user)  return false;

        //已登录用户重新获取用户信息保存在session中
        $this->setLoginSession($user);
        return $user;
    }

}
/* End of file LoginModel.php */
/* Location: ./model/LoginModel.php */
