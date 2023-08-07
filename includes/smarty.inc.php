<?php
/**
 * Class Controller
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class Controller {

    public $smarty;

    public $method;

    function __construct () {
        $this->method = $_SERVER['REQUEST_METHOD'];

        require_once (ROOT . '/library/smarty/Smarty.class.php');
        $this->smarty = new Smarty();
        $this->smarty->debugging = false;
        $this->smarty->template_dir = ROOT . '/templates'; //设置模板目录
        $this->smarty->compile_dir = ROOT . '/templates_c'; //设置编译目录
        $this->smarty->left_delimiter = '<{';
        $this->smarty->right_delimiter = '}>';
        $this->smarty->php_handling = SMARTY_PHP_ALLOW;

        $this->smarty->assign('_username', (new LoginModel())->sessionDo('get', 'username'));
        $this->smarty->assign('web_name', WEB_NAME);
        $this->smarty->assign('login_url', LOGIN_URL);
    }

    /**
     * datatables模板调用方法
     *
     * @param $searchFields     array   搜索字段
     * @param $showFields       array   显示字段
     * @param $ajaxSource       string  ajax会掉地址，用来获取数据
     * @param array $otherData  array   其他数据，如js
     * @param bool $output      bool    缓存设置
     *
     * @return string
     */
    function themeDatatables($searchFields, $showFields, $ajaxSource, $otherData=array(), $output=true){
        if(!$this->_validSearchField($searchFields)){
            echo 'search fields error';
            return;
        }
        if(!$this->_validotherData($otherData)){
            echo 'other data error';
            return;
        }

        if($output == false){
            ob_start();
        }

        $searchTypes = array();
        if ($searchTypes) {
            foreach ($searchFields as $k => $v) {
                $searchTypes[$k] = $v['type'];
            }
        }
        $searchTypes = json_encode($searchTypes);
        $aoColumns = $this->_render_aoColumns($showFields);
        $this->smarty->assign('searchTypes', $searchTypes);
        $this->smarty->assign('searchFields', $searchFields);
        $this->smarty->assign('showFields', $showFields);
        $this->smarty->assign('ajaxSource', $ajaxSource);
        $this->smarty->assign('otherData', $otherData);
        $this->smarty->assign('aoColumns', $aoColumns);
        $this->smarty->display('common/data_tables.tpl');

        if($output == false){
            $ret_val = ob_get_contents();
            ob_end_clean();
            return $ret_val;
        }
    }
    //处理显示字段
    function _render_aoColumns($showFields){
        $aoColumns = array();
        foreach($showFields as $item){
            if($item['sortable'] == true){
                $aoColumns[] = '{ "asSorting": [ "desc", "asc" ] }';
            }else{
                $aoColumns[] = '{ "bSortable": 0}';
            }
        }
        return implode(",", $aoColumns);
    }
    //处理其他数据
    function _validotherData(&$otherData){
        !$otherData['iDisplayLength'] && $otherData['iDisplayLength'] = DEFAULT_PAGE_COUNT;
        $otherData['sortCol'] = intval($otherData['sortCol']);
        !$otherData['sortDir'] && $otherData['sortDir'] = 'desc';
        !$otherData['id'] && $otherData['id'] = 'dataTable';
        if(!isset($otherData['bSort'])){
            $otherData['bSort'] = "true";
        } else{
            $otherData['bSort'] = $otherData['bSort']? "true": "false";
        }
        return true;
    }
    //处理搜索字段
    function _validSearchField(&$searchFields){
        if (!$searchFields) return true;
        foreach($searchFields as $key=>$searchField){
            empty($searchField['type']) && $searchField['type'] = 'input';
            $types = array('scp', 'cp', 'input', 'checkbox', 'date', 'range', 'select', 'range_date', 'range_time','checkboxlist','server');
            //类型限制
            if(!in_array($searchField['type'], $types)){
                return false;
            }

            //如果是下拉菜单类型，必须定义下拉菜单的值
            if($searchField['type'] == 'select' && empty($searchField['value'])){
                return false;
            }

            //默认宽度
            !$searchField['input_width'] && $searchField['input_width'] = 120;

            if($searchField['type'] == 'range_time'){
                //$searchField['input_width'] < 200 && $searchField['input_width'] = 200;
            }

            $searchFields[$key] = $searchField;
        }
        return true;
    }


    /**
     * 菜单
     *
     * @param array  $tabs      array(array('title'=>'','url'=>''))
     * @param string $tabs_id
     * @param array $otherData
     *
     */
    function themeTabs($tabs, $tabs_id = 'tabs', $otherData=array()){
        $new_tabs = array();
        foreach($tabs as $row){
            $ctrl = $act = '';
            $parse_url = parse_url($row['url']);
            $query = $parse_url['query'];
            parse_str($query);

            $ctrl = empty($ctrl) ? 'frame' : $ctrl;
            $act = empty($act) ? 'index' : $act;
            $hasPurview = has_purview($ctrl, $act);
            $hasPurview === 1 && $new_tabs[] = $row;
        }

        if($new_tabs){
            $this->smarty->assign('id', $tabs_id);
            $this->smarty->assign('tabs', $new_tabs);
            $this->smarty->assign('otherData', $otherData);
			$this->smarty->clear_all_cache();  
            $this->smarty->display('common/tabs.tpl');
        }else{
            echo 'no tabs';
        }

    }
    function _validSetting(&$setting){
        foreach($setting as $key=>$config){
            empty($config['type']) && $config['type'] = 'input';
            $types = array('input', 'select', 'checkbox');
            //类型限制
            if(!in_array($config['type'], $types)){
                return false;
            }

            //如果是下拉菜单类型，必须定义下拉菜单的值
            if($config['type'] == 'select' && empty($config['value'])){
                return false;
            }

            $setting[$key] = $config;
        }
        return true;
    }

    function getParam($name, $default = '') {
        return isset($_GET[$name]) ? $_GET[$name] : (isset($_POST[$name]) ? $_POST[$name] : $default);
     }

    function cookie($name, $default = '') {
        return isset($_COOKIE[$name]) ? $_COOKIE[$name] : $default;
    }
    function sessionGet($name, $default = '') {
        return isset($_SESSION[$name]) ? $_SESSION[$name] : $default;
    }


    //服务器选择列表
    public function currentServer() {
        return isset($_SESSION['server_id']) ? $_SESSION['server_id'] : 0;
    }
    public function serverList($all=false) {
        $tmp = array('server_id'=>999999999,'name'=>'全服');
        $list = (new ServerModel())->handle('getList',array('fields'=>'name,server_id,id,channel','where'=>' 1=1 order by channel desc,server_id'), 'server');

        $all && array_unshift($list,$tmp);
        $this->smarty->assign('list',$list);
        $this->smarty->assign('currentServer', $this->currentServer());
        return $this->smarty->fetch('common/server_list.tpl');
    }
    public function validateServer(&$server_id){
        if($server_id == ''){
            $server_id = isset($_COOKIE['selected_server']) ? $_COOKIE['selected_server'] : $this->currentServer();
        }
        $_SESSION['server_id'] = $server_id;
        return $server_id;
    }

    //服务器多选
    //$selected array 已选择的服务器
    public function  multiSelectServer($selected=array()){
        $list = (new ServerModel())->handle('getList',array('fields'=>'name,server_id,id,channel','where'=>' 1=1 order by channel desc,server_id'), 'server');
        $this->smarty->assign('list',$list);
        $this->smarty->assign('selected',$selected);
        return $this->smarty->fetch('common/multiSelectServer.tpl');
    }

    /**
     * 使用datatables时对查询条件的整理
     * @param $get        array
     * @param $orderBy    array
     * @param $fields     string
     * @param $condition  array  有以下值
     *    ServerIsNotNeed    ：查询条件是否需要服务器，默认需要，
     *    allServerIsNotNeed ： 是否需要全服查询，默认需要
     *    timeIsNotNeed      ：查询条件是否需要时间，默认需要
     *    timeIsToday        ：查询条件时间是否是今天，默认一个月
     *    otherWhere         ：是否加入其它查询条件，默认没有
     * @return array
     */
    public function _DataTablesCondition( $get, $orderBy=array(), $fields="*", $condition=array()){

        $where = array();
        for($i=0;$i<2;$i++){
            $ssSearch=$get["sSearch_$i"];
            switch($i){
                case 0:
                    if (  TRUE == $condition['ServerIsNotNeed'] )   break;
                    if (  TRUE == $condition['allServerIsNotNeed'] && $ssSearch == 999999999)   break;

                    $where[] = "serverid = $ssSearch";
                    $this->validateServer($ssSearch);
                    break;
                case 1:
                    if (  TRUE == $condition['timeIsNotNeed'] )   break;

                    $time = explode("|",$ssSearch);
                    $sTime = $eTime = '';
                    isset($time[0]) && $sTime=strtotime($time[0]);
                    isset($time[1]) && $eTime=strtotime($time[1]);

                    if($sTime && $eTime){
                        $where[] = "unix_timestamp(logdate)>={$sTime} AND unix_timestamp(logdate)<={$eTime}";
                    }elseif(!$sTime && $eTime){
                        $where[] = "unix_timestamp(logdate)={$eTime}";
                    }elseif($sTime && !$eTime){
                        $where[] = "unix_timestamp(logdate)={$sTime}";
                    }else{
                        if( TRUE == $condition['timeIsToday']){
                            $where[] = "logdate = ' " . date("Y-m-d") . "'";
                        }else{
                            $stime = strtotime("-1 month");
                            $etime = time();
                            $where[] = "unix_timestamp(logdate)>={$stime} AND unix_timestamp(logdate)<{$etime}";
                        }
                    }
                    break;
            }
        }
        $condition['otherWhere'] && $where[]= $condition['otherWhere'];

        $order = $orderBy[$get['iSortCol_0']] ? $orderBy[$get['iSortCol_0']]." ".$get['sSortDir_0'] : '';
        $limit = intval($get['iDisplayStart']).",".intval($get['iDisplayLength']);

        return array(
            'where'=>implode(" AND ",$where),
            'order'=>$order,
            'limit'=>$limit,
            'fields'=>$fields,
            'sEcho'=>$get['sEcho']
        );
    }
}