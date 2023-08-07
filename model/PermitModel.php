<?php
/**
 * Class PermitModel
 *
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class PermitModel extends Model {

    function permitTree(){
        $list = $this->handle('getList', array(), 'permit');
        $tree = array();
        foreach($list as $row){
            $row["modules_show"] = $this->modulesShow($row["modules"]);
            $tree[$row['group']][$row['name']] = $row;
        }
        return $tree;
    }
    
    function modulesShow($modules=array()){
        return implode(" | ", unserialize($modules));
    }
    
    function modulesSaveFormat($modules=array()){
        return serialize($modules);
    }

    function permitUpdate($pid, $field, $value){
        if($field == "modules"){
            $value = $this->modulesSaveFormat(textareaStrToArr($value));
        }
        $data = array(
            'pid' => $pid,
            $field => $value,
        );
        return $this->handle('update', array('data'=>$data), 'permit');
    }

    
    function permitListByIds($ids){
        $list = array();
        if(empty($ids)){
            return $list;
        }
        if(is_numeric($ids)){
            $ids = array($ids);
        }
        $where = "pid IN (".implode(",", $ids).")";
        return $this->handle('getList', array('where'=>$where), 'permit');
    }
    
}
/* End of file PermitModel.php */
/* Location: ./model/PermitModel.php */
