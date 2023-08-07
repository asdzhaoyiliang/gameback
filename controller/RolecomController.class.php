<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class RolecomController
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class RolecomController extends Controller{
    function __construct(){
        parent::__construct();
    }

    //盗梦系统
    function daomeng(){
        $tabs = array(array('title'=>'盗梦系统信息查询', 'url'=>'admin.php?ctrl=rolecom&act=dataTableItemDao'));
        $this->themeTabs($tabs);
	}
    public function dataTableItemDao(){
        $searchFields = [
            ['title'=>'服务器','type'=>'server', 'value'=>$this->serverList()],
            ['title'=>'角色ID','type'=>'input'],
        ];

        $showFields = array(
            'b'  => array('title' => '角色ID'),
            'd'  => array('title' => '物品GUID'),
            'e'  => array('title' => '物品的ID，品质等级，强化等级'),
            'f'  => array('title' => '物品的耐久以及耐久上限'),
            'g'  => array('title' => '物品的数量以及标记'),
            'h'  => array('title' => '物品的打孔信息'),
            'i'  => array('title' => '物品的过期时间'),
        );

        $ajaxSource = "admin.php?ctrl=rolecom&act=dataTableAjaxDao";
        $otherData[]=array();
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData, true);
    }
    public function dataTableAjaxDao(){
        $json_arr = array(
            'sEcho'                => intval($_GET['sEcho']),
            'iTotalRecords'        => 0,
            "iTotalDisplayRecords" => 0,
            'aaData'               => array()
        );

        $server_id= $_GET['sSearch_0'];
        $this->validateServer($server_id);

        $server= (new ServerModel())->handle('getOne',array("where"=>"server_id={$server_id}"), 'server');
        if ( ! $server ) exit( json_encode($json_arr) );


        $aaData = array();
        $files = "actorid, itemguid, itemidquastrong, itemduration, itemcountflag, iteminlayhole, itemtime";
        $sql = "SELECT {$files} FROM `actordmkjitem` ";
        $_GET['sSearch_1'] && $sql .= " WHERE actorid = " . $_GET['sSearch_1'];
        $sql .= " LIMIT ".intval($_GET['iDisplayStart']).",".intval($_GET['iDisplayLength']);

        $mysql = Util::getMysqlCon($server['mysql_host'],$server['mysql_user'],$server['mysql_passwd'],$server['actor_table'],$server['mysql_port']);
        $query = $mysql->query($sql);
        while($row = $query->fetch_assoc()){
            $aaData[]=array(
                $row['actorid'],
                $row['itemguid'],
                $row['itemidquastrong'],
                $row['itemduration'],
                $row['itemcountflag'],
                $row['iteminlayhole'],
                $row['itemtime'],
            );
        }

        $sql = "SELECT COUNT(*) AS count_data FROM  `actordmkjitem` ";
        $row = $mysql->query($sql)->fetch_assoc();
        $iTotalRecords = $row['count_data'];

        $sql = "SELECT COUNT(*) AS count_data FROM `actordmkjitem`";
        $_GET['sSearch_1'] && $sql .= " WHERE actorid = " . $_GET['sSearch_1'];
        $row = $mysql->query($sql)->fetch_assoc();
        $iTotalDisplayRecords= $row['count_data'];

        $json_arr = array(
            'sEcho'                => intval($_GET['sEcho']),
            'iTotalRecords'        => $iTotalRecords,
            "iTotalDisplayRecords" => $iTotalDisplayRecords,
            'aaData'               => $aaData
        );
        echo json_encode($json_arr);

    }

    //秘籍系统
    function miji(){
        $tabs = array(array('title'=>'盗梦系统信息查询', 'url'=>'admin.php?ctrl=rolecom&act=dataTableItemMiji'));
        $this->themeTabs($tabs);
    }
    public function dataTableItemMiji(){
        $searchFields = [
            ['title'=>'服务器','type'=>'server', 'value'=>$this->serverList()],
            ['title'=>'角色ID','type'=>'input'],
        ];

        $showFields = array(
            'b'  => array('title' => '角色ID'),
            'c'  => array('title' => '技能ID'),
            'd'  => array('title' => '物品GUID'),
            'e'  => array('title' => '物品的ID，品质等级，强化等级'),
            'f'  => array('title' => '物品的耐久以及耐久上限'),
            'g'  => array('title' => '物品的数量以及标记'),
            'h'  => array('title' => '物品的打孔信息'),
            'i'  => array('title' => '物品的过期时间'),
        );

        $ajaxSource = "admin.php?ctrl=rolecom&act=dataTableAjaxMiji";
        $otherData[]=array();
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData, true);
    }
    public function dataTableAjaxMiji(){
        $json_arr = array(
            'sEcho'                => intval($_GET['sEcho']),
            'iTotalRecords'        => 0,
            "iTotalDisplayRecords" => 0,
            'aaData'               => array()
        );

        $server_id= $_GET['sSearch_0'];
        $this->validateServer($server_id);

        $server= (new ServerModel())->handle('getOne',array("where"=>"server_id={$server_id}"), 'server');
        if ( ! $server ) exit( json_encode($json_arr) );

        $aaData = array();
        $files = "actorid, skillid, itemguid, itemidquastrong, itemduration, itemcountflag, iteminlayhole, itemtime";
        $sql = "SELECT {$files} FROM `actormiji` ";
        $_GET['sSearch_1'] && $sql .= " WHERE actorid = " . $_GET['sSearch_1'];
        $sql .= " LIMIT ".intval($_GET['iDisplayStart']).",".intval($_GET['iDisplayLength']);

        $mysql = Util::getMysqlCon($server['mysql_host'],$server['mysql_user'],$server['mysql_passwd'],$server['actor_table'],$server['mysql_port']);
        $query = $mysql->query($sql);
        while($row = $query->fetch_assoc()){
            $aaData[]=array(
                $row['actorid'],
                $row['itemguid'],
                $row['itemidquastrong'],
                $row['itemduration'],
                $row['itemcountflag'],
                $row['iteminlayhole'],
                $row['itemtime'],
            );
        }

        $sql = "SELECT COUNT(*) AS count_data FROM  `actormiji` ";
        $row = $mysql->query($sql)->fetch_assoc();
        $iTotalRecords = $row['count_data'];

        $sql = "SELECT COUNT(*) AS count_data FROM `actormiji`";
        $_GET['sSearch_1'] && $sql .= " WHERE actorid = " . $_GET['sSearch_1'];
        $row = $mysql->query($sql)->fetch_assoc();
        $iTotalDisplayRecords= $row['count_data'];

        $json_arr = array(
            'sEcho'                => intval($_GET['sEcho']),
            'iTotalRecords'        => $iTotalRecords,
            "iTotalDisplayRecords" => $iTotalDisplayRecords,
            'aaData'               => $aaData
        );
        echo json_encode($json_arr);

    }

    //排行榜
    function rank(){
        $tabs = array(array('title'=>'排行榜查询', 'url'=>'admin.php?ctrl=rolecom&act=dataTableItemRank'));
        $this->themeTabs($tabs);
    }
    public function dataTableItemRank(){
        $searchFields = [
            ['title'=>'服务器', 'type'=>'server', 'value'=>$this->serverList()],
            ['title'=>'类型', 'type'=>'select', 'value'=> CDict::$rankType],
        ];

        $showFields = array(
            'a'  => array('title' => '排行'),
            'b'  => array('title' => '角色ID'),
            'i'  => array('title' => '角色名称'),
            'c'  => array('title' => '排行榜的分数'),
            'd'  => array('title' => '阵营'),
            'e'  => array('title' => '等级'),
            'f'  => array('title' => '职业'),
            'g'  => array('title' => '性别'),
            'h'  => array('title' => '战斗力'),
        );

        $ajaxSource = "admin.php?ctrl=rolecom&act=dataTableAjaxRank";
        $otherData[]=array();
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData, true);
    }
    public function dataTableAjaxRank(){
        $json_arr = array(
            'sEcho'                => intval($_GET['sEcho']),
            'iTotalRecords'        => 0,
            "iTotalDisplayRecords" => 0,
            'aaData'               => array()
        );

        $server_id = $_GET['sSearch_0'];
        $this->validateServer($server_id);

        $server= (new ServerModel())->handle('getOne',array("where"=>"server_id={$server_id}"), 'server');
        if ( ! $server ) exit( json_encode($json_arr) );

        $aaData = array();
        $files = "actorid, actorname, rankpoint, camp, level, job, sex, fightval";
        $sql = "SELECT {$files} FROM `rankdata` WHERE serverindex = {$server_id} AND rankid = " . $_GET['sSearch_1'];
        $sql .= " ORDER BY rankpoint DESC";
        $sql .= " LIMIT ".intval($_GET['iDisplayStart']).",".intval($_GET['iDisplayLength']);

        $mysql = Util::getMysqlCon($server['mysql_host'],$server['mysql_user'],$server['mysql_passwd'],$server['actor_table'],$server['mysql_port']);
        $query = $mysql->query($sql);
        $i = intval($_GET['iDisplayStart']);
        while($row = $query->fetch_assoc()){
           $i++;
            $aaData[]=array(
                $i,
                $row['actorid'],
                $row['actorname'],
                $row['rankpoint'],
                $row['camp'],
                $row['level'],
                CDict::$job[$row['job']],
                CDict::$sex[$row['sex']],
                $row['fightval'],
            );
        }

        $sql = "SELECT COUNT(*) AS count_data FROM  `rankdata`";
        $row = $mysql->query($sql)->fetch_assoc();
        $iTotalRecords = $row['count_data'];

        $sql = "SELECT COUNT(*) AS count_data FROM `rankdata` WHERE serverindex = {$server_id} AND rankid = " . $_GET['sSearch_1'];
        $row = $mysql->query($sql)->fetch_assoc();
        $iTotalDisplayRecords= $row['count_data'];

        $json_arr = array(
            'sEcho'                => intval($_GET['sEcho']),
            'iTotalRecords'        => $iTotalRecords,
            "iTotalDisplayRecords" => $iTotalDisplayRecords,
            'aaData'               => $aaData
        );
        echo json_encode($json_arr);

    }
}
/* End of file RolecomController.class.php */
/* Location: ./controller/RolecomController.class.php  */
