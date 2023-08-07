<?php
/**
 * Class ApiController
 * 激活码
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */


 abstract class ApiController{

    function __construct(){
    	/*
        if( ! $this->getParam('gamekey'))
            exit( json_encode(array('ErrorCode'=>2,'msg'=>'invalid gamekey','data'=>array())) );

        if ( GAMEKEY !== $this->getParam('gamekey'))
            exit( json_encode(array('ErrorCode'=>1,'msg'=>'invalid gamekey','data'=>array())) );
	 	*/
    }

    function getParam($key){
        return $_GET[$key] ? $_GET[$key] : ($_POST[$key] ? $_POST[$key] : FALSE);
    }

} 