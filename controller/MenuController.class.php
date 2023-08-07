<?php  defined('IN_WEB') ||  exit('Access Denied');
/**
 * Class MenuController
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class MenuController extends Controller{

    function __construct(){
        parent::__construct();
        $this->menuModel = new MenuModel();
        $this->logModel = new LogModel();
        $this->type = trim($_REQUEST['type']);
        $this->smarty->assign('type', $this->type);
        
    }

    // --------------------------------------------------------------------

    public function main(){
        $this->smarty->display('menu/main.tpl');
    }
    public function index(){
        $this->smarty->display('menu/index.tpl');
    }

    // --------------------------------------------------------------------

    /**
     * 菜单列表
     */
    public function items(){
        $menuTree = $this->menuModel->menuTree($this->type);
        $this->smarty->assign('menuTree', $menuTree);
        $this->smarty->display('menu/items.tpl');
    }

    // --------------------------------------------------------------------

    /**
     * 添加编辑菜单
     */
    public function edit(){
        $mid = intval($_GET['mid']);
        $mid && $menu = $this->menuModel->handle('getOne', array('where' => "mid=$mid"), 'menu');

        $type = $this->type;
        $contidion = array('where' => "`type` ='{$type}' AND `parent`= 0 ORDER BY weight");
        $menuRoot = $this->menuModel->handle('getList', $contidion, 'menu');
        
        $this->smarty->assign('menu', $menu);
        $this->smarty->assign('menuRoot', $menuRoot);
        $this->smarty->display('menu/edit.tpl');
    }

    // --------------------------------------------------------------------

    public function submit(){
        switch($_REQUEST['t']){
            case 'del':
                $mid = intval($_POST['mid']);
                $result = $this->menuModel->handle('delete', array('where' => "mid = $mid"), 'menu');
                echo $result? 'success': 'fail';
                $this->logModel->logAdd("删除菜单，菜单id:".$_POST['mid']);
                break;
            case 'edit':
                $mid = intval($_POST['mid']);
                $data = array(
                    'name' => trim($_POST['name']),
                    'url' => trim($_POST['url']),
                    'parent' => intval($_POST['parent']),
                    'weight' => intval($_POST['weight']),
                    'status' => 1,
                    'icon' => trim($_POST['icon']),
                );
                if($mid){
                    //修改菜单
                    $data['mid'] = $mid;
                    $result = $this->menuModel->handle('update', array('data' => $data), 'menu');
                    $result && $result = $mid;
                    $this->logModel->logAdd("编辑菜单:".$_POST['name']);
                }else{
                    //增加菜单
                    $data['type'] = $this->type;
                    $result = $this->menuModel->handle('insert', array('data' => $data), 'menu');
                    $this->logModel->logAdd("添加菜单:".$_POST['name']);
                }
                echo $result;
                break;
            case 'save_field':
                $mid = intval($_POST['id']);
                $field = trim($_POST['field']);
                $value = htmlspecialchars_decode(trim($_POST['value']));

                if($mid <= 0) exit('save fail');

                $data = array('mid' => $mid, $field => $value);
                $this->menuModel->handle('update', array('data' => $data), 'menu');
                echo $value;
                $this->logModel->logAdd("更新菜单字段:{$field}=>{$value}, 菜单id:{$mid}");
                break;
            case 'save_weight'://保存菜单排序
                $menu_root_ids = $_POST['menu_root_ids'];
                $menu_sub_ids = $_POST['menu_sub_ids'];
                $result = $this->menuModel->save_weight($menu_root_ids, $menu_sub_ids);
                echo $result? 1: 0;
                $this->logModel->logAdd("保存菜单排序");
                break;

        }


    }
}
/* End of file MenuController.class.php */
/* Location: ./controller/MenuController.class.php  */