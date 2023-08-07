<?php
/**
 * Class MenuModel
 * 后台菜单
 * 包含获取菜单列表、获取子菜单、增加菜单、修改菜单、删除菜单、菜单排序等功能
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class MenuModel extends Model {

    /**
     * 获取菜单列表
     * @param $type   获取中央服为tree，获取单服菜单为
     * @param int $parent
     * @param bool|true $showAll
     * @return array
     */
    function menuTree($type, $parent=0, $showAll = true){
        static $list;
        if(empty($list[$type])){
            $where['type'] = $type;
            if($showAll == false) {
                $where['status'] = MENU_STATUS_SHOW;
            }
            $list[$type] = $this->handle('getList',array('where'=>$where,'order'=>'weight'), 'menu');
        }

        if(empty($list[$type])) return array();
        
        $menuTree = array();
        foreach($list[$type] as $menu){
            if($menu['parent'] == $parent){
                $menu['children'] = $this->menuTree($type, $menu['mid'], $showAll);
                
                //判断权限是否显示
                $hasPurview = 1;
                if($menu['url'] && $showAll == false){
                    $ctrl = $act = '';
                    $parse_url = parse_url($menu['url']);
                    $query = $parse_url['query'];
                    parse_str($query);
                    
                    $hasPurview = has_purview($ctrl, $act);
                }
                
                if($menu['parent'] == 0 && empty($menu['children']) && empty($menu['url'])) $hasPurview = 0;
                $hasPurview == 1 && $menuTree[$menu['mid']] = $menu;
            }
        }

        return $menuTree;
    }

    // --------------------------------------------------------------------

    /**
     *更改菜单排序
     * @param $menu_root_ids
     * @param $menu_sub_ids
     * @return int
     * @throws Exception
     */
    function save_weight($menu_root_ids, $menu_sub_ids){
        $data = array();
        $weight = 0;
        $menu_root_arr = array_filter(explode(',', $menu_root_ids));
        $menu_sub_arr = array_filter(explode('|', $menu_sub_ids));
        foreach($menu_root_arr as $k=>$root_id){
            $row = array(
                'mid' =>  $root_id,
                'weight' => $weight,
                'parent' => 0, 
            );
            $data[] = $row;
            
            $weight++;
            $tmp_sub_arr = array_filter(explode(',', $menu_sub_arr[$k]));
            foreach($tmp_sub_arr as $sub_id){
                $row = array(
                    'mid' =>  $sub_id,
                    'weight' => $weight,
                    'parent' => $root_id,
                );
                $data[] = $row;
                $weight++;
            }
        }

        foreach($data as $row){
            $this->handle('update', array('data'=>$row), 'menu');
        }
        return 1;
        
    }
    
}
/* End of file MenuModel.php */
/* Location: ./model/MenuModel.php */
