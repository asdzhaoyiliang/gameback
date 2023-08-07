<?php defined('IN_WEB') || exit('Access Denied');
/**
 * Class RetentionController
 * 留存统计
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class RetentionController extends Controller{
    function __construct(){
        parent::__construct();
        $this->LogModel = new LogModel();
    }
    
    function index(){
        echo "待做";
		$tabs = array(
		);
	    //$this->themeTabs($tabs);
	}


}
