<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class ItemController
 * 道具管理
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class ItemController extends Controller{

    function __construct(){
        parent::__construct();
        $this->Model = new Model();
    }

    // --------------------------------------------------------------------

    function index(){
        $tabs = array(
            array('title'=>'道具列表','url'=>'admin.php?ctrl=item&act=dataTablesRequest'),
            array('title'=>'添加道具','url'=>'admin.php?ctrl=item&act=add'),
        );
        $this->themeTabs($tabs);
    }

    // --------------------------------------------------------------------

    //道具列表
    public function dataTablesRequest(){
        $searchFields = [
            ['type'=>'input','title'=>'道具ID'],
            ['type'=>'input','title' =>'道具名称'],
        ];
        $showFields = [
            ['title' => '道具ID','sortable'=>true],
            ['title' => '道具名称','sortable'=>true],
            ['title' => '操作'],
        ];
        $ajaxSource = 'admin.php?ctrl=item&act=dataTablesRespond';
        $js =<<<END
        function del(item_id){
            if(confirm("确定删除该道具")){
                $.post("admin.php?ctrl=item&act=del",{item_id:item_id},function(msg){
                    $("#tabs").tabs().tabs("load",0);
                })
            }
        }

        function edit(item_id){
           \$tabs.tabs("url",1 ,"admin.php?ctrl=item&act=item_add&item_id="+item_id );
           \$tabs.tabs("select",1);
           \$tabs.tabs("url",1 ,"admin.php?ctrl=item&act=item_add");
        }
END;


        $otherData = array('js'=>$js);

        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function dataTablesRespond(){
        $where = array();
        $_GET['sSearch_0'] && $where[] = "item_id={$_GET['sSearch_0']}";
        $_GET['sSearch_1'] && $where[] = "item_name like '%{$_GET['sSearch_1']}%'";

        $orderF = array('item_id','item_name');

        $condition = array(
            'where' => implode(" AND ",$where),
            'limit' => "{$_GET['iDisplayStart']},{$_GET['iDisplayLength']}",
            'sEcho' => $_GET['sEcho'],
            'order' => $orderF[$_GET['iSortCol_0']] ? $orderF[$_GET['iSortCol_0']]." ".$_GET['sSortDir_0'] : ''
        );
        $res = $this->Model->handle('getList', $condition, 'items');
        if($res) {
            foreach($res as $val){
                $handle  = "<button onclick='edit({$val['item_id']})' class='datatable_search_button gbutton' href='javascript:void(0)'>编辑</button>";
                $handle .= "&nbsp;&nbsp;";
                $handle .= "<button onclick='del({$val['item_id']})' class='datatable_search_button gbutton'  href='javascript:void(0)'>删除</button>";

                $aaData[]=array(
                    $val['item_id'],
                    $val['item_name'],
                    $handle
                );
            }
        }
        echo $this->Model->returnJsonData($condition, $aaData?$aaData:array());
    }

    // --------------------------------------------------------------------

    public function add(){
        (new LogModel())->logAdd("item_id：{$_GET['item_id']}");
       $itemInfo=array('item_id'=>'','item_name'=>'');
       if($_GET['item_id']){
           $itemInfo =$this->Model->handle('getOne',array('where'=>"item_id={$_GET['item_id'] }"), 'items');
       }
        $this->smarty->assign("itemInfo",$itemInfo);
        $this->smarty->display('item/add.tpl');
    }


    // --------------------------------------------------------------------

    public function item_add(){
       $itemInfo=array('item_id'=>'','item_name'=>'');
       if($_GET['item_id']){
           $itemInfo =$this->Model->handle('getOne',array('where'=>"item_id={$_GET['item_id'] }"), 'items');
       }
        $this->smarty->assign("itemInfo",$itemInfo);
        $this->smarty->display('item/add.tpl');
    }

    // --------------------------------------------------------------------

    public function submit(){
        switch( $_REQUEST['type'] ){
            case 'del':
                !$_POST['item_id'] && exit("error");
                $this->Model->handle('delete', array('where'=>"item_id={$_POST['item_id'] }"), 'items');
                $this->LogModel->logAdd("删除道具:{$_POST['item_id']}");
                break;
            case 'add':
                if(!$_POST['con']) exit("内容为空");

                $list = explode("\n",$_POST['con']);

                foreach($list as $val){
                    $item = str_replace("，",",",$val);//把中文制的逗号换成英文制
                    $item = explode(",",$item);
                    $item_id = intval($item['0']);
                    if(!$item_id) continue;//如果道具id不为整数，跳出

                    $data = array("item_id"=>$item[0],'item_name'=>$item[1]);
                    $this->Model->handle('replace', array('data'=>$data), 'items');
                }
                echo 1;
                break;

        }

    }

}
/* End of file ItemController.class.php */
/* Location: ./controller/ItemController.class.php  */