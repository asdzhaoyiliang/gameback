<?php
/**
 * DbMysqli 数据库操作类
 *
 * @copyright       Copyright&copy;2015, ZJL
 * @author          ZJL <vccrazy@qq.com>
 * @version         1.0
 * @since           2015-09-01
 */
ini_set('display_errors', 'off');
error_reporting(E_ALL ^ E_NOTICE ^ E_DEPRECATED);

global  $query_times;
class DbMysqli {
    protected $host;        // 服务器地址
    protected $port;        // 端口
    protected $user;        // 用户名
    protected $passwd;      // 密码
    protected $db;          // 数据库名
    protected $tableName;  // 数据表名
    protected $result;     // 返回的结果集
    protected $fields = array();
    protected $full_fields = array();
    protected $priKey = array();
    protected $link_name;
    public $mysqli;         // $mysqli作为public，在本类中的方法满足不到的情况下，可以直接使用mysqli

    /**
     * 链接数据库
     * @access protected
     * @throws Exception
     */
    protected function __construct () {       
        $this->mysqli = new mysqli($this->host, $this->user, $this->passwd,
            $this->db, $this->port);
        $msg = mysqli_connect_errno();
        if ($msg) {
            echo "连接数据库失败，如果是初次装服请1分钟后刷新数据库";
            throw new Exception('mysql connect failure:' . $msg);
            $this->mysqli = false;
            exit();
        }

        $this->mysqli->set_charset("utf8");
    }

    // --------------------------------------------------------------------

    /**
     * 关闭数据库
     */
    function __destruct () {  
		if($this->mysqli)
			$this->mysqli->close();
		$this->mysqli = false;     
    }

    // --------------------------------------------------------------------

    /**
     * 整理查询条件
     * $where 可以有以下几种写法
     * $where = " `name` ='test' ";
     * $where = array(" `id` =1 ", " `name` ='test' ");
     * $where = array('id' => 1,  'name' => 'test');
     * $where = array(array('id', 1),  array('name', '%test%', 'like'));
     */
    function _where($where){
        switch( gettype($where)){
            case 'string':
                $where_str = $where;
                break;
            case 'array':
                $conditions = array();
                foreach ($where as $k => $arr) {
                    if (is_string($arr) || is_numeric($arr)) {
                        $str = $arr;
                        if(is_string($k) && !is_numeric($k)){
                            $this->_addslashes($str);
                            $str = "`{$k}` = '{$str}'";
                        }
                        $conditions[] = $str;

                    } elseif (is_array($arr)) {
                        $tmp_count = count($arr);
                        if ($tmp_count == 1) {
                            $conditions[] = $arr[0];
                        } elseif ($tmp_count == 3) {
                            $this->_addslashes($arr[1]);
                            $conditions[] = "`{$arr[0]}` {$arr[2]} '{$arr[1]}'";
                        } elseif ($tmp_count == 2) {
                            $this->_addslashes($arr[1]);
                            $conditions[] = "`{$arr[0]}` = '{$arr[1]}'";
                        }
                    }
                }
                $where_str = implode(' AND ', $conditions);
                break;
            default:
                $where_str = 1;
                break;
        }
        return $where_str ? $where_str : 1;
    }

    // --------------------------------------------------------------------

    /**
     * 整理要查找的字段
     * @param $fields_arr
     * $fields_arr = "xx,xc,xv..."
     * $fields_arr = array('xx','xc','xv'...)
     * @return string
     */
    function _fields($fields){
        $tmp_fields_arr = array();
        switch(gettype($fields)){
            case 'string':
                $fields_str = $fields;
                break;
            case 'array':
                foreach ($fields as $v) {
                    $tmp_fields_arr[] = $v;
                }
                $fields_str = implode(',', $tmp_fields_arr);
                break;
            default:
                $fields_str = "*";
                break;
        }

        return $fields_str ? $fields_str : '*';
    }

    // --------------------------------------------------------------------

    /**
     *  获得一个数据列表
     * @param string $fields
     * @param null $where
     * @param null $limit
     * @param string $order
     * @return array
     */
    function getList ($fields="*", $where=NULl, $order=NULL, $limit=NULl, $group=NULL) {
        //整理要查找的字段
        $fields_str = $this->_fields($fields);

        //整理查询条件
        $where_str = $this->_where($where);
        $group &&  $where_str .= " GROUP BY $group";
        $order &&  $where_str .= " ORDER BY $order";
        $limit &&  $where_str .= " LIMIT $limit";

        $sql = "SELECT $fields_str FROM `{$this->tableName}` WHERE $where_str";
        $this->query($sql);

        //echo "<br/>$sql";

        $data = array();
        while ($row = $this->fetch_assoc()) {
            $data[] = $row;
        }

        return $data;
    }

    // --------------------------------------------------------------------

    /**
     * 获得一条数据
     * @param NULl $where
     * @param string $fields
     * @return mixed
     */
    function getOne ($where=NULl, $fields="*", $order=NULL, $limit=NULl, $group=NULL) {
        $list = $this->getList($fields, $where, $order, $limit, $group);
        return $list[0] ? $list[0] : array();
    }

    // --------------------------------------------------------------------

    /**
     * 执行增删查改等sql语句
     * @param string $sql  要执行的sql语句
     * @param array $args
     * @return mixed
     */
    function query ($sql, $args=array()) {
        if($args){
            $this->_addslashes($args);
            foreach ($args as $key => $value) {
                $key[0] == '@' &&  $args[$key] = check_plain($value);
            }
            $sql = strtr($sql, $args);
        }
        global $query_times;
        $query_times++;
        $this->result = $this->mysqli->query($sql);

        if (! $this->result) {
            try{
                throw new Exception(mysqli_error($this->mysqli));
            }catch(Exception $e){
                $time = date('Y-m-d H:i:s');
                $message = "[ {$time} ]error sql: {$sql}\n";

                $dir = LOG_DIR."error";
                if(!file_exists($dir)){
                    echo $dir;
                    xmkdir($dir,0777);
                }
                $file = $dir.'/' . date("Y-m") . '.sql.log';
                //echo $message;
                error_log($message, 3, $file);
            }
        }
        return $this->result;
    }

    // --------------------------------------------------------------------

    function find($sql){
        $this->query($sql);
        $data = array();
        while ($row = $this->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }

    // --------------------------------------------------------------------

    /**
     * @param $data
     * @param bool|FALSE $batch  FALSE为单条插入，TRUE为批量插入
     * @return mixed
     * @throws Exception
     */
    function insert($data,$batch=FALSE){
        $this->_addslashes($data);
        if (empty($data)) {throw new Exception('No data to insert');}

        $insert_fields=$insert_value="";
        if(!$batch){
            $fields = $value = array();
            foreach ($data as $k => $v) {
                $fields[] = "`$k`";
                $value[] = "'$v'";
            }
            $insert_fields = implode(',', $fields);
            $insert_value = "(".implode(',', $value).")";
        }else{
            foreach ($data as $tmp_data) {
                $fields= $value_tmp = array();
                foreach ($tmp_data as $k => $v) {
                    $fields[] = "`$k`";
                    $value_tmp[] = "'$v'";
                }
                $insert_fields = implode(',', $fields);
                $value[] = "(".implode(',', $value_tmp).")";
            }
            $insert_value = implode(",", $value);
        }

        $sql = "INSERT ignore INTO `{$this->tableName}` ({$insert_fields}) VALUES $insert_value";

        //echo $sql;die;

        $this->result = $this->mysqli->query($sql);

        if ($this->result && $this->mysqli->affected_rows > 0) {
            if ($this->mysqli->insert_id && !$batch) {
                return $this->mysqli->insert_id;
            }else{
                return $this->mysqli->affected_rows;
            }
        } else {
            return FALSE;
        }
    }

    // --------------------------------------------------------------------

    //如果数组$data中包含有主键，并且更新条件为主键，则不需要传入$where参数
    function update ($data, $where = array()) {
        $this->_addslashes($data);
        if (empty($data)) { throw new Exception('No data to update'); }

        $this->getFields();
        $where_str = $this->_render_where($where, $where ? 0 : 1, $data);
        if (empty($where_str)) { throw new Exception( 'what is the conditions in update function ');}

        $set_fields_str = $this->_render_set_fields($data);

        $sql = "UPDATE `{$this->tableName}` SET $set_fields_str WHERE $where_str";
        //echo $sql;
        return $this->query($sql);
    }

    // --------------------------------------------------------------------

    /**
     * 替代操作
     * @param $data
     *
     * @return bool
     * @throws Exceptio
     */
    function replace($data){
        $this->_addslashes($data);
        if (empty($data)) throw new Exception('No data to replace');

        $set = array();
        foreach ( $data as $k => $v ){
            $set[] = "`{$k}` = '{$v}'";
        }

        $sql = "REPLACE INTO `{$this->tableName}` SET ". implode(', ', $set);

        //print_r($sql);

        $this->query($sql);

        if ( $this->result && $this->mysqli->affected_rows > 0 ){
        	return TRUE;
        }else{
        	return FALSE;
        }
    }

    // --------------------------------------------------------------------

    //删除数据
    function delete ($where = array()) {
        if (empty($where)) {return FALSE;}

        $where_str = $this->_render_where($where);
        $sql = "DELETE FROM `{$this->tableName}` WHERE $where_str ";
        return $this->query($sql);
    }

    // --------------------------------------------------------------------

    function deleteById ($id) {
        $where = $this->_render_where_from_id($id);
        return $this->delete($where);
    }

    // --------------------------------------------------------------------

    function getOneById ($id) {
        $where = $this->_render_where_from_id($id);
        return $this->getOne($where);
    }

    // --------------------------------------------------------------------

    function _render_set_fields ($data) {
        $set_fields_arr = array();
        foreach ($data as $k => $v) {
            //不更新主键
            if (in_array($k, $this->fields) && !in_array($k, $this->priKey)) {
                $set_fields_arr[] = " `$k` = '$v' ";
            }
        }
        $set_fields_str = implode(', ', $set_fields_arr);
        return $set_fields_str;
    }

    // --------------------------------------------------------------------

    /**
     * $where 可以有以下几种写法
     * $where = " `name` ='test' ";
     * $where = array(" `id` =1 ", " `name` ='test' ");
     * $where = array('id' => 1,  'name' => 'test');
     * $where = array(array('id', 1),  array('name', '%test%', 'like'));
     */
    function _render_where ($where = NULl, $set_default = 0, $data = NULl) {
        if ($set_default && $this->priKey && $data) {
            foreach ($this->priKey as $k) {
                if (isset($data[$k])) {
                    $where[] = array($k, $data[$k]);
                }
            }
        }
        $conditions = array();
        $where_str = '';
        if (is_string($where)) {
            $where_str = $where;
        } elseif (is_array($where)) {
            foreach ($where as $k => $arr) {
                if (is_string($arr) || is_numeric($arr)) {
                    $str = $arr;
                    if(is_string($k) && !is_numeric($k)){
                        $this->_addslashes($str);
                        $str = "`{$k}` = '{$str}'";
                    }
                    $conditions[] = $str;
                } elseif (is_array($arr)) {
                    $tmp_count = count($arr);
                    if ($tmp_count == 1) {
                        $conditions[] = $arr[0];
                    } elseif ($tmp_count == 3) {
                        $this->_addslashes($arr[1]);
                        $conditions[] = "`{$arr[0]}` {$arr[2]} '{$arr[1]}'";
                    } elseif ($tmp_count == 2) {
                        $this->_addslashes($arr[1]);
                        $conditions[] = "`{$arr[0]}` = '{$arr[1]}'";
                    }
                }

            }
            $where_str = implode(' AND ', $conditions);
        }

        return $where_str;
    }

    // --------------------------------------------------------------------

    function _render_where_from_id ($id) {
        $this->_addslashes($id);

        $where = array();
        $this->getFields();
        if ($id > 0 && count($this->priKey) == 1) {
            $where[] = array($this->priKey[0], $id);
        }
        return $where;
    }

    // --------------------------------------------------------------------

    //获得表字段，如果设置参数$full=TRUE，则会返回表字段的完整信息，否则只会返回表字段名称的数组
    function getFields ($full = FALSE) {
        if (! empty($this->fields) && $full==FALSE) {return $this->fields;}
        if (! empty($this->full_fields) && $full==FALSE) {
            return $this->full_fields;
        }
        $this->result = NULl;
        if (empty($this->tableName)) {throw new Exception(
            'No tableName, you must setTableName() first');}
        $sql = "SHOW FULL COLUMNS FROM `{$this->tableName}`";
        $this->query($sql);

        while ($row = $this->fetch_assoc()) {
            if ($full) {
                $this->full_fields[] = $row;
            } else {
                $this->fields[] = $row['Field'];
            }

            if ($row['Key'] == 'PRI') {
                $this->priKey[] = $row['Field'];
            }
        }
        return $full? $this->full_fields: $this->fields;
    }

    // --------------------------------------------------------------------

    /**
     * 统计数量
     * @param NULl $where
     * @return mixed
     */
    function count ($where = NULl) {
        $where_str = $this->_where($where);
        $sql = "SELECT COUNT(*) AS count_data FROM `{$this->tableName}` WHERE $where_str ";
        $this->query($sql);
        $row = $this->fetch_assoc();
        return $row['count_data'];
    }

    // --------------------------------------------------------------------

    /**
     * 累加
     * @param $field
     * @param NULl $where
     * @return mixed
     */
    function sum ($field, $where = NULl) {
        //整理查询条件
        $where_str = $this->_where($where);

        $sql = "SELECT SUM(`$field`) AS sum_data FROM `{$this->tableName}` WHERE $where_str ";
        $this->query($sql);
        $row = $this->fetch_assoc();
        return $row['sum_data'];
    }

    // --------------------------------------------------------------------

    /**
     * 删除表中所有记录
     * @return mixed
     * @throws Exception
     */
    function truncate(){
        return $this->query("TRUNCATE TABLE {$this->tableName}");
    }

    // --------------------------------------------------------------------

    /**
     * 返回影响的行数
     * @return mixed
     */
    function affected_rows(){
        if($this->result) return $this->mysqli->affected_rows;
    }

    // --------------------------------------------------------------------

    function _addslashes(&$string){
        $magic_quotes_gpc = function_exists('get_magic_quotes_gpc') && get_magic_quotes_gpc();
        if ( ! $magic_quotes_gpc) {
            if (is_array($string)) {
                $keys = array_keys($string);
                foreach ($keys as $key) {
                    $val = $string[$key];
                    unset($string[$key]);
                    $string[addslashes($key)] = $this->_addslashes($val);
                }
            } else {
                $string = addslashes($string);
            }
            return $string;
        }
    }

    // --------------------------------------------------------------------

    /**
     * 返回根据从结果集取得的行生成的数组
     * @return mixed
     * return ex:Array([0]=>Adams,[LastName]=>Adams,[1]=>John,[FirstName]=>John,[2]=>London,[City]=>London)
     */
    function fetch_array () {
        if ($this->result) return $this->result->fetch_array();
    }

    // --------------------------------------------------------------------

    /**
     * 从结果集中取得一行作为关联数组
     * @return mixed
     * return ex:Array([LastName]=>Adams,[FirstName]=>John,[City]=>London)
     */
    function fetch_assoc () {
        if ($this->result) return $this->result->fetch_assoc();
    }

    // --------------------------------------------------------------------

    /**
     * 从结果集（记录集）中取得一行作为对象
     * @return mixed
     */
    function fetch_object () {
        if ($this->result) return $this->result->fetch_object();
    }
}
/* End of file database.inc.php */
/* Location: ./includes/database.inc.php  */

