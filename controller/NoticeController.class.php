<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class NoticeController 公告管理
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

//ini_set("display_errors","On");
//error_reporting(E_ALL);


class NoticeController extends Controller{

    public function __construct(){
        parent::__construct();
        $this->Model = new Model();
    }

    // --------------------------------------------------------------------

	public function index() {
	    $tabs = array(
            ['title' => '添加公告', 'url' => 'admin.php?ctrl=notice&act=add'],
            ['title' => '查看公告', 'url' => 'admin.php?ctrl=notice&act=dataTablesRequest'],
	    );
	    $this->themeTabs($tabs);
	}

    // --------------------------------------------------------------------

    //查看公告
    public function dataTablesRequest(){
        $searchFields = [
            ['title' => '日期', 'type' => 'range_date'],
        ];
        $showFields = [
            ['title' => '公告ID','sortable'=>true],
            ['title' => '内容'],
            ['title' => '发送类型'],
            ['title' => '公告类型'],
            ['title' => '服务器'],
            ['title' => '开始时间'],
            ['title' => '结束时间'],
            ['title' => '发布人'],
            ['title' => '发布时间'],
            ['title' => '操作',],
        ];
        $ajaxSource = 'admin.php?ctrl=notice&act=dataTablesRespond';
        $js=<<<END
        function del(id){
            if(confirm('确定要删除该公告吗？')){
                $.post("admin.php?ctrl=notice&act=submit&type=del",{id:id},function(msg){
                    $("#tabs").tabs().tabs("load",1);
                })
            }
        }
END;
        $otherData=array('js'=>$js);
        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function dataTablesRespond(){
        $orderBy=array('id');
        $condition = $this->_DataTablesCondition($_GET, $orderBy, "*",  array('S`erverIsNotNeed'=>TRUE));

        $res = $this->Model->handle('getList', $condition, 'notice');
        if($res) {
            foreach($res as $val){
                if($val['delete']){
                    $tmp = '已删除';
                }elseif(!$val['delete'] && strtotime($val['etime'])<time()){
                    $tmp = '已过期';
                }else{
                    $tmp = "<button onclick='del({$val['id']})' class='gbutton'>删除</button>";
                }
                $aaData[]=array(
                    $val['id'],
                    $val['content'],
                    CDict::$noticeSendType[$val['send_type']],
                    CDict::$noticeType[$val['notice_type']],
                    $val['serverid'],
                    $val['stime'],
                    $val['etime'],
                    $val['gm'],
                    $val['logdate'],
                    $tmp
                );
            }
        }
        echo $this->Model->returnJsonData($condition, $aaData?$aaData:array());
    }

    // --------------------------------------------------------------------

    //添加公告
    public function add() {
        $this->smarty->assign('noticeType', CDict::$noticeType);
        $this->smarty->assign('server', $this->multiSelectServer());
        $this->smarty->display('notice/add.tpl');
    }

    // --------------------------------------------------------------------

    public function submit(){
        switch($_REQUEST['type']){
            case 'del':
                $id = $this->getParam('id');

                $notice =  $this->Model->handle('getOne',array('where'=>"id=$id"),  'notice');

				$data = array(
					'operindex'  => 10009,
					'nstate'    => '1',
					'username' => '',
					'logdate' => date("Y-m-d H:i:s"),
					'reser1' => '1',
					'strcom' => $notice['content']
				);
                foreach(explode(",",$notice['serverid']) as $serverid){
                    $data['serverindex'] = $serverid;
                    Util::sync("command",$serverid,$data);
                }
                echo $this->Model->handle('update',array('where'=>"id=$id",'data'=>array('delete'=>1)), 'notice');
                break;
            case 'add':
                $post = $_POST;
                //内容检测和处理
                    /* 设置内部字符编码为 UTF-8 */
                    mb_internal_encoding("UTF-8");
                $content = trim($post['content']);
                if( ! $content) exit("请输入公告内容");
                if( 900 < mb_strlen($content) ) exit("公告内容不能超过900个字符");
                for( $i=0; $i<= mb_strlen($content); $i+=30){
                   $aa[] = mb_substr($content, $i, 30);
                }
                $str_content = "#FF". $post['color'] . $aa[0];
                $aa[1] && $str_content .= "/n#FF". $post['color'] . $aa[1];
                $aa[2] && $str_content .= "/n#FF". $post['color'] . $aa[2];

                //时间检测和处理
                $stime = trim($post['stime']); $etime = trim($post['etime']);
                switch($post['send_type']){
                    case 0:
                        $stime = $stime ? $stime : date("Y-m-d H:i:s");
                        $etime = $etime ? $etime : date("Y-m-d H:i:s", strtotime("+1 day"));
                        break;
                    case 1:
                    case 2:
                        if( !$stime || !$etime) exit("开始时间或结束时间不能为空");
                        if( strtotime($stime) > strtotime($etime) ) exit("结束时间不能小于开始时间");
                        if( strtotime($etime) < time() ) exit("结束时间不能小于现在时间");
                        break;
                }

                //服务器检测
                $notice_type = $post['notice_type'];
                $serverid_arr = $post['serverid'];
                if($notice_type != 255){
                    if( !isset($serverid_arr)) exit("请选择服务器");
                }else{
                    $serverid_arr = "999999";
                }
				$ntype = 8;
				$n_stime = strtotime($stime);
                $n_etime = strtotime($etime);
				$interval = $post['time_interval'];

                //数据入库
                $post['gm']=$_SESSION['username'];
                $post['logdate']=date("Y-m-d H:i:s");
                $post['content'] = $post['content'];
                unset($post['color']);
                if(!$post['time_interval']) unset($post['time_interval']);
                $data = array(
                    'logdate'     => date("Y-m-d H:i:s"),
                    'serverid'    => implode(",", $serverid_arr),
                    'content'     => $post['content'],
                    'send_type'   => $post['send_type'],
                    'notice_type' => $post['notice_type'],
                    'stime'       => $stime,
                    'etime'       => $etime,
                    'gm'          => $_SESSION['username'],
                );
				//exit(var_dump($data));
                $post['time_interval'] &&  $data['time_interval'] = $post['time_interval'];
				$id = $this->Model->handle('insert', array('data'=>$data), 'notice');
                if($notice_type != 255 && $id)
				{
					$strcom  = $id."|".$content."|".$interval."|".$ntype."|".$n_stime."|".$n_etime;	
					//向单服发送gm命令 ID|内容|间隔时间(秒)|显示位置|开始时间|结束时间
					$syncData = array(
						'operindex'  => 10008,
						'nstate'    => '1',
						'username' => '',
						'logdate' => date("Y-m-d H:i:s"),
						'reser1' => '1',
						'strcom' => $strcom
					);
					foreach($serverid_arr as $serverid){
						$syncData['serverindex'] = $serverid;
						Util::sync('command', $serverid, $syncData);
					}
					
				}
                exit("success");
                break;
        }

    }

    // --------------------------------------------------------------------

    //获取距离 2010-01-01 00:00:00 的秒数
    public function getMiniTime($n=''){
        $n || $n=time();
        $t = strtotime('2010-01-01 00:00:00');
        $minitime = $n - $t;
        return $minitime;
    }

}
/* End of file NoticeController.class.php */
/* Location: ./controller/NoticeController.class.php  */