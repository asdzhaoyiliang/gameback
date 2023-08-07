<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class ExpendController
 * 消费类型管理
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class ExpendController extends Controller{

    function __construct(){
        parent::__construct();
        $this->LogModel = new LogModel();
        $this->Model = new Model();
    }

    // --------------------------------------------------------------------

    function index(){
        $tabs = array(
            array('title'=>'消费类型','url'=>'admin.php?ctrl=expend&act=dataTablesRequest'),
            array('title'=>'添加类型','url'=>'admin.php?ctrl=expend&act=add'),
        );
        $this->themeTabs($tabs);
    }

    // --------------------------------------------------------------------

    //消费类型
    public function dataTablesRequest(){
        $searchFields = [
            ['type'=>'input','title' =>'消费系统'],
            ['type'=>'input','title' =>'消费点'],
        ];
        $showFields = [
            ['title' => '消费系统'],
            ['title' => '消费点'],
            ['title' => 'phylum'],
            ['title' => 'classfield'],
            ['title' => '操作'],
        ];
        $ajaxSource = 'admin.php?ctrl=expend&act=dataTablesRespond';
        $js =<<<END
        function del(id){
            if(confirm("确定删除该类型")){
                $.post("admin.php?ctrl=expend&act=submit&type=del",{id:id},function(msg){
                    $("#tabs").tabs().tabs("load",0);
                })
            }
        }
        function edit(id){
           \$tabs.tabs("url",1 ,"admin.php?ctrl=expend&act=expend_add&id="+id);
           \$tabs.tabs("select",1);
           \$tabs.tabs("url",1 ,"admin.php?ctrl=expend&act=expend_add");
        }
END;
        $otherData = array('js'=>$js);
        $this->themeDatatables($searchFields, $showFields, $ajaxSource, $otherData);
    }
    public function dataTablesRespond(){
        $where = array();
        $_GET['sSearch_0'] && $where[] = "phylum_name='{$_GET['sSearch_0']}'";
        $_GET['sSearch_1'] && $where[] = "classfield_name='{$_GET['sSearch_1']}'";

        $condition = array(
            'where' => implode(" AND ",$where),
            'limit' => "{$_GET['iDisplayStart']},{$_GET['iDisplayLength']}",
            'sEcho' => $_GET['sEcho']
        );

        $res = $this->Model->handle('getList', $condition, 'expend_type');
        if($res) {
            foreach($res as $val){
                $handle  = "<button onclick=edit({$val['id']}) class='datatable_search_button gbutton' href='javascript:void(0)'>编辑</button>";
                $handle .= "&nbsp;&nbsp;";
                $handle .= "<button onclick='del({$val['id']})' class='datatable_search_button gbutton'  href='javascript:void(0)'>删除</button>";

                $aaData[]=array(
                    $val['phylum_name'],
                    $val['classfield_name'],
                    $val['phylum'],
                    $val['classfield'],
                    $handle
                );
            }
        }
        echo $this->Model->returnJsonData($condition, $aaData?$aaData:array());

    }

    // --------------------------------------------------------------------

    //添加类型
    public function add(){
        $data = array();
        if ($_GET['id']) {
            $data =   $this->Model->handle('getOne', array('where'=>"id={$_GET['id']}"), 'expend_type');
        }
        $con=<<<END
消费系统名称：<input type='text' name='phylum_name' value="{$data['phylum_name']}"><br/><br/>
消费点名称：<input type='text' name='classfield_name' value="{$data['classfield_name']}"><br/><br/>
phylum：<input type='text' name='phylum' value="{$data['phylum']}"><br/><br/>
classfield：<input type='text' name='classfield' value="{$data['classfield']}"><br/><br/>
<input type='hidden' name='id' value="{$data['id']}">
<button class="gbutton" onclick="tj()">提交</button>
<script type="text/javascript">
function tj(){
    var data = {};
    var id = $("input[name=id]").val().trim();
    var phylum_name = $("input[name=phylum_name]").val().trim();
    var classfield_name = $("input[name=classfield_name]").val().trim();
    var phylum = $("input[name=phylum]").val().trim();
    var classfield = $("input[name=classfield]").val().trim();

    if(phylum_name == ''){alert('消费系统名称不能为空');return;}
    if(phylum == ''){alert('phylum不能为空');return;}

    data['id'] = id;
    data['phylum_name'] = phylum_name;
    data['classfield_name'] = classfield_name;
    data['phylum'] = phylum;
    data['classfield'] = classfield;

    $.post("admin.php?ctrl=expend&act=submit&type=add",{data:data},function(msg){
        if(msg == 'success'){
            $("#tabs").tabs().tabs("select",0);
        }else{
            alert(msg)
        }
    })
}
</script>
END;
        echo $con;
    }

    // --------------------------------------------------------------------

    public function submit(){
        switch($_REQUEST['type']){
            case 'add':
                $post = $_POST['data'];
                if(!$post) exit("内容为空");

                if($post['id']){
                    $res = $this->Model->handle('update',array('data'=>$post), 'expend_type');
                }else{
                    unset($post['id']);
                    $res = $this->Model->handle('insert',array('data'=>$post), 'expend_type');
                }

                $msg = $res ?  'success' :  'fali';
                echo $msg;
                break;
            case 'del':
                $this->Model->handle('delete', array('where'=>"id={$_POST['id'] }"), 'expend_type');
                $this->LogModel->logAdd("删除道具：{$_POST['id']}");
                break;
        }
    }

}
/* End of file ExpendController.class.php */
/* Location: ./controller/ExpendController.class.php  */