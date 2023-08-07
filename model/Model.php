<?php
/**
 * Class DbCenterModel 数据库
 *
 * @copyright       Copyright&copy;2015, ZJL
 * @author          ZJL <vccrazy@qq.com>
 * @version         1.0
 * @since           2015-09-01
 */
class Model extends DbMysqli {

    /**
     * 定义数据库主机
     * @var string
     * @access protected
     */
    protected $host = MYSQLHOST;

    // --------------------------------------------------------------------

    /**
     * 设置数据库端口
     * @var string
     * @access protected
     */
    protected $port = MYSQLPORT;

    // --------------------------------------------------------------------

    /**
     * 设置数据库用户
     * @var string
     * @access protected
     */
    protected $user = MYSQLUSER;

    // --------------------------------------------------------------------

    /**
     * 设置数据库密码
     * @var string
     * @access protected
     */
    protected $passwd = MYSQLPASS;

    // --------------------------------------------------------------------

    /**
     * 设置数据库名字
     * @var string
     * @access protected
     */
    protected $db = DB_NAME;

    // --------------------------------------------------------------------

    /**
     *
     * @var string
     * @access protected
     */
    protected $link_name = DB_NAME;

    // --------------------------------------------------------------------

    /**
     * 设置数据表
     * @var string
     * @access protected
     */
    protected $tableName;

    // --------------------------------------------------------------------

    function __construct () {
        parent::__construct();
    }

    // --------------------------------------------------------------------

    /**
     *
     * @param string $type
     * @param array  $data
     * @param string $tableName
     * @return array|bool|mixed
     * @throws Exception
     *
     * @return viod
     */
    public function handle($type, array $condition, $tableName=''){
        $tableName && $this->tableName = TABLE_PREFIX.$tableName;

        @$fields    = $condition['fields'] ? $condition['fields'] : "*";  //"id,flag,server"
        @$where     = $condition['where']  ? $condition['where']  : NULL; //"id=3 AND flag='test'"
        @$order     = $condition['order']  ? $condition['order']  : NULL; //"id DESC"
        @$limit     = $condition['limit']  ? $condition['limit']  : NULL; //"2,5"
        @$data      = $condition['data']   ? $condition['data']   : '';   //array()
        @$sql       = $condition['sql']    ? $condition['sql']    : '';   //string
        @$batch     = $condition['bacth']  ? $condition['bacth']  : FALSE;//boolen
        @$group     = $condition['group']  ? $condition['group']  : FALSE;//boolen

        switch($type){
            case 'getList':
                return $this->getList($fields,$where,$order,$limit,$group);
                break;
            case 'getOne':
                return $this->getOne($where,$fields);
                break;
            case 'insert':
                return $this->insert($data,$batch);
                break;
            case 'replace':
                return $this->replace($data);
                break;
            case 'update':
                return $this->update($data,$where);
                break;
            case 'delete':
                return $this->delete($where);
                break;
            case 'find': //主要针对联表查询
                return $this->find($sql);
                break;
            case 'query':
                return $this->query($sql);
                break;
            case 'count':
                return $this->count($where);
                break;
        }
    }

    // --------------------------------------------------------------------

    /**
     * 处理dataTables请求,并返回json数据
     * @param array $condition
     * @param array $aaData
     *
     * @return string
     */
    public function returnJsonData(array $condition, array $aaData){
        $json_arr = array(
            'sEcho'                => $condition['sEcho'],
            'iTotalRecords'        => $this->count(),
            "iTotalDisplayRecords" => $this->count($condition['where']),
            'aaData'               => $aaData
        );
        return json_encode($json_arr);
    }
}
/* End of file Model.php */
/* Location: ./model/Model.php  */