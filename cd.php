<?php
                for($i = 18000; $i < 20000; $i++){
                   echo   substr(md5("comcard76_".$i),8,16);
                   echo  "<br>";
                }
                die(0);
?>