<?php

class whiteIP{

    public static function _37wan($ip){
        $ips = array(
            "121.201.11.240",
            "121.201.12.233",
            "121.201.25.203",
            "121.201.25.236",
            "121.201.25.237",
            "121.201.25.238",
            "121.201.25.246",
            "121.201.55.233",
            "122.13.66.185",
            "122.13.66.70",
            "14.17.122.60",
            "14.18.204.185",
            "14.18.204.70",
            "14.18.237.203",
            "14.18.237.236",
            "14.18.237.237",
            "14.18.237.238",
            "14.18.237.246",
            "163.177.179.60",
            "183.232.52.82",
            "183.232.52.93",
            "183.232.59.115",
            "183.232.59.116",
            "183.232.59.117",
            "183.232.59.118",
            "183.232.59.119",
            "221.5.32.203",
            "221.5.32.236",
            "221.5.32.237",
            "221.5.32.238",
            "221.5.32.246",
        );
        return array_search($ip,$ips);
    }

public static function _dongji($ip){
        $ips = array(           
            "123.59.62.161",
            "123.59.66.75",
        );
        return array_search($ip,$ips);
    }


    public static function _channelIp($ip){
       $arr =array(

       );
        return $arr[$ip] ? $arr[$ip] : FALSE;
    }


}