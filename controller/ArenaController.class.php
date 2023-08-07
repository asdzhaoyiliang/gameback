<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class ArenaController
 * 竞技场排名
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class ArenaController extends Controller{
    function __construct(){
        parent::__construct();
        $this->LogModel = new LogModel();
    }
    
    function index(){
        $tabs = array( array('title'=>'竞技场排序信息', 'url'=>'admin.php?ctrl=arena&act=dataTablesRequest'));
        $this->themeTabs($tabs);
	}

    // --------------------------------------------------------------------

    public function dataTablesRequest(){
        $searchFields = [
            ['title'=>'服务器','type'=>'server', 'value'=>$this->serverList()],
        ];

        $showFields = array(
            'a'  => array('title' => '排名','sortable'=>true),
            'b'  => array('title' => '角色ID'),
            'c'  => array('title' => '角色名'),
        );

        $ajaxSource = "admin.php?ctrl=arena&act=dataTablesRespond";
        $otherData[]=array();
        $this->themeDataTables($searchFields, $showFields, $ajaxSource, $otherData, true);
    }
    public function dataTablesRespond(){
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
        $sql = "SELECT f.rank,f.actorid,a.actorname FROM `fightrank` AS f LEFT JOIN `actors` as a ON f.actorid = a.actorid";
        $sql .= " WHERE serverid = {$server_id}";
        $sql .= " ORDER BY rank ASC";
        $sql .= " LIMIT ".intval($_GET['iDisplayStart']).",".intval($_GET['iDisplayLength']);

        $mysql = Util::getMysqlCon($server['mysql_host'],$server['mysql_user'],$server['mysql_passwd'],$server['actor_table'],$server['mysql_port']);
        $query = $mysql->query($sql);
        while($row = $query->fetch_assoc()){
            $aaData[]=array(
                $row['rank'],
                $row['actorid'],
                $row['actorname']
            );
        }

        $sql = "SELECT COUNT(*) AS count_data FROM `fightrank` WHERE serverid = {$server_id}";
        $sql = "SELECT COUNT(*) AS a,({$sql}) AS b FROM  `fightrank`";
        $count = $mysql->query($sql)->fetch_assoc();

        $json_arr = array(
            'sEcho'                => intval($_GET['sEcho']),
            'iTotalRecords'        => $count['a'],
            "iTotalDisplayRecords" => $count['b'],
            'aaData'               => $aaData
        );
        echo json_encode($json_arr);

    }

}
/* End of file ArenaController.class.php */
/* Location: ./controller/ArenaController.class.php  */
