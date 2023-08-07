<?php define("SDK",TRUE);
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');

require_once 'conf/main.php';

	$fee = $_REQUEST['fee'];
	$feeid = $_REQUEST['feeid'];
	$check = md5($fee.$feeid.SECRET_KEY);

    $data = array(
        'fee'        =>  $fee,
        'feeid'      =>  $feeid,
        'check'    	 =>  $check
    );
	exit(json_encode($data))
?>
