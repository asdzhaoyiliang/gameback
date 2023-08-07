<?php
/**
 * Class UsergroupModel
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class UsergroupModel extends Model{

    /**
     * 更新用户组
     * @param $data
     * @return mixed
     * @throws Exception
     */
    function usergroupUpdate($data){
        return $this->handle('update', array('data'=>$data), 'user_group');
    }

    // --------------------------------------------------------------------

    /**
     * 根据用户组id获取用户组信息
     * @param $groupid
     * @return mixed
     */
    function groupGetOne($groupid){
        $usergroup = $this->handle('getOne', array('where'=>"groupid=$groupid"), 'user_group');
        return $this->renderUsergroup($usergroup);
    }

    // --------------------------------------------------------------------

    function renderUsergroup($usergroup){

        $usergroup['center_permit_data'] = unserialize($usergroup['center_permit'])? unserialize($usergroup['center_permit']): array();
        $usergroup['single_permit_data'] = unserialize($usergroup['single_permit'])? unserialize($usergroup['single_permit']): array();

        $usergroup['center_modules_data'] = unserialize($usergroup['center_modules'])? unserialize($usergroup['center_modules']): array();
        $usergroup['single_modules_data'] = unserialize($usergroup['single_modules'])? unserialize($usergroup['single_modules']): array();

        $usergroup['agent_data'] = unserialize($usergroup['agent'])? unserialize($usergroup['agent']): array();
        $usergroup['server_data'] = unserialize($usergroup['server'])? unserialize($usergroup['server']): array();

        $usergroup['allow_ip_data'] = unserialize($usergroup['allow_ip'])? unserialize($usergroup['allow_ip']): array();
        $usergroup['allow_ip_data_show'] = implode("\n", $usergroup['allow_ip_data']);

        $usergroup['channel'] = $usergroup['channel'] == 'all' ? 'all' : json_decode($usergroup['channel'], true);
        return $usergroup;
    }

    // --------------------------------------------------------------------

    function serverPurview($group, $agent, $server){
        if($group && (is_array($group['agent_data']) && in_array('all', $group['agent_data'])
                || is_array($group['agent_data']) &&  in_array($agent, $group['agent_data'])
                || $server && is_array($group['server_data']) &&  in_array($server, $group['server_data'][$agent]))){
            return true;
        }else{
			//对特定的用户组的处理 2017-1-19
	        if($group == 1 || $group == 6)
			   return true;
            //没有访问权限
            return false;
        }
    }

    // --------------------------------------------------------------------

    /**
     * 更新用户组权限
     * @param $groupid
     * @param $type
     * @param $permits
     * @param bool|false $all
     * @return mixed
     */
    function permitUpdate($groupid, $type, $permits, $all=false){
        $permitModel = new PermitModel();
        $permitList = $permitModel->permitListByIds($permits);
        $modules = $all? array("all"): array();
        foreach($permitList as $row){
            $modules = array_merge($modules, unserialize($row['modules']));
        }

        $data = array(
            "groupid" => $groupid,
            "{$type}_permit" => serialize($permits),
            "{$type}_modules" => serialize($modules),
        );
        return $this->usergroupUpdate($data);

    }

    // --------------------------------------------------------------------

    /**
     * 更新所有用户组
     * @return string
     */
    function updateAllGroup(){
        $permitModel = new PermitModel();
        $groupList = $this->handle('getList',array(), 'user_group');
        foreach($groupList as $group){
            $data['groupid'] = $group['groupid'];
            foreach(array('center', 'single') as $type){
                $permits = unserialize($group[$type.'_permit']);
                $modules = unserialize($group[$type.'_modules']);

                if( is_array($modules) && in_array('all', $modules)) {
                    $new_modules = array("all");
                }else{
                    $new_modules = array();
                }

                $permitList = $permitModel->permitListByIds($permits);
                foreach($permitList as $row){
                    $new_modules = array_merge($new_modules, unserialize($row['modules']));
                }
                $data["{$type}_modules"] = serialize($new_modules);
            }
            $result = $this->usergroupUpdate($data);
            $result && $msg_arr[] = $group['name'];
        }
        return "更新用户组:".implode(', ', $msg_arr);
    }

}
/* End of file UsergroupModel.php */
/* Location: ./model/UsergroupModel.php */
