<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class SystemController
 * 系统信息
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class SystemController extends Controller{

    public function index(){
        $tabs = array(
            array('title'=>'系统信息', 'url'=>'admin.php?ctrl=system&act=items'),
        );
        $this->themeTabs($tabs);
    }

    public function items(){

        $html = '<table class="itable itable-color">';

        $html .= '<tr>';
        $html .= '<th width="140px">操作系统：</th>';
        $html .= '<td>' .  PHP_OS . '</td>';
        $html .= '</tr>';

        $html .= '<tr>';
        $html .= '<th>IP：</th>';
        $html .= '<td>' . $_SERVER["HTTP_HOST"] .'</td>';
        $html .= '</tr>';

        $html .= '<tr>';
        $html .= '<th>服务器软件：</th>';
        $html .= '<td>' .  $_SERVER['SERVER_SOFTWARE'] .' PHP/'. PHP_VERSION .'</td>';
        $html .= '</tr>';

        $html .= '<tr>';
        $html .= '<th>apache模块：</th>';
        $html .= '<td>' .  implode('|', apache_get_modules()) . '</td>';
        $html .= '</tr>';

        $html .= '<tr>';
        $html .= '<th>最大上传限制：</th>';
        $html .= '<td>' .  get_cfg_var ("upload_max_filesize") . '</td>';
        $html .= '</tr>';

        $html .= '<tr>';
        $html .= '<th>最大执行时间：</th>';
        $html .= '<td>' .  get_cfg_var ("max_execution_time") . '秒</td>';
        $html .= '</tr>';

        $html .= '<tr>';
        $html .= '<th>脚本运行占用最大内存：</th>';
        $html .= '<td>' .  get_cfg_var ("memory_limit") . '</td>';
        $html .= '</tr>';



        $html .= '<tr>';
        $html .= '<th>MYSQL支持：</th>';
        $html .= '<td>';
        $html .=  function_exists ('mysql_close')?"是":"否";
        $html .= '</td>';
        $html .= '</tr>';

        $html .= '<tr>';
        $html .= '<th>MySQL数据库版本：</th>';
        $html .= '<td>' .  @mysql_get_server_info() . '</td>';
        $html .= '</tr>';

        $html .= '<tr>';
        $html .= '<th>MySQL数据库状态：</th>';
        $html .= '<td>' .  @mysql_stat() . '</td>';
        $html .= '</tr>';

        $html .= '<tr>';
        $html .= '<th>MySQL Host：</th>';
        $html .= '<td>' .  @mysql_get_host_info() . '</td>';
        $html .= '</tr>';

        $html .= '<tr>';
        $html .= '<th>MySQL最大连接数：</th>';
        $html .= '<td>';
        $html .=  @get_cfg_var("mysql.max_links")==-1 ? '不限' : get_cfg_var("mysql.max_links");
        $html .= '</td>';
        $html .= '</tr>';

        $html .= '<tr>';
        $html .= '<th>MySQL数据库持续连接：</th>';
        $html .= '<td>';
        $html .=   @get_cfg_var("mysql.allow_persistent")?'是':'否';
        $html .=  '</td>';
        $html .= '</tr>';

        $html .= '</table>';
        echo $html;

        //print_r($_SERVER);
    }
}
/* End of file SystemController.class.php */
/* Location: ./controller/SystemController.class.php  */
