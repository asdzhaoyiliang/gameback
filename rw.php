<?php
	
	function echoPram($name){
		if( isset($_GET[$name]))
			echo  $name.'='.$_GET[$name]  .'<br>';
		else
			echo  $name.' is NULL<br>';
	}
	echoPram('m');
	echoPram('f');
	echoPram('a');
	echo $_SERVER['REQUEST_URI'] ;