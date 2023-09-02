<?php
/**
 * Class MailModel
 * 邮件
 * @copyright Copyright&copy;2015, ZJL
 * @author ZJL
 * @wersion 1.0
 * @since 2015-09-01
 */

class MailModel extends Model{

    public $status = array('待审核','审核通过','审核不通过');

    public $mailType = array('普通邮件','全服邮件');

    public function getData($condition,$type){
        $table_mail = TABLE_PREFIX."mail";
        $table_user = TABLE_PREFIX."user";

        switch($type){
            case 'role_mail':
                $condition['where'] .= " AND type NOT IN (1,2)";
                break;
            case 'server_mail':
                $condition['where'] .= " AND type=1";
                break;
            case 'resource':
                $condition['where'] .= " AND type=2";
                break;
        }

        $sql = "SELECT m.*,u.name
                FROM {$table_mail} AS m LEFT JOIN {$table_user} AS u ON m.senderid = u.uid
                WHERE {$condition['where']} ORDER BY {$condition['order']} LIMIT {$condition['limit']}";


        $res = $this->handle('find',array('sql'=>$sql), 'mail');
        if($res) {
            foreach($res as $val){
                $handle  = "<button onclick='checkMail({$val['id']},true)' class='datatable_search_button gbutton'  href='javascript:void(0)'>审核通过</button>";
                $handle .= "&nbsp;&nbsp;";
                $handle .= "<button onclick='checkMail({$val['id']},false)' class='datatable_search_button gbutton' href='javascript:void(0)'>审核不通过</button>";

                $content = json_decode($val['data'], true);
                $foo = $content['condition'] == 1 ? '角色ID' : ($content['condition'] == 2 ?  '角色名字' : '账号');
                $aaData[]=array(
                    $val['id'],
                    $val['serverid'] ? $val['serverid'] : $content['serverid'],
                    $content['content'],
//                    $type=='server_mail' ? "等级≥{$content['limit_level']}" : $content['rolelist']."($foo)",
                    $content['reason'],
                    $content['limit_role_guids'],
                    $content['start_time'],
                    $content['end_time'],
                    $val['item'],
                    $val['name'],
                    $val['logdate'],
                    $val['checked_gm'],
                    "<span style='color: #ff0000;font-weight: bold'>".$this->status[$val['status']]."</span>",
                    $val['status']==0 ? $handle : ''
                );
            }

        }
        return $this->returnJsonData($condition, $aaData ?: array());
    }
}
/* End of file MailModel.php */
/* Location: ./model/MailModel.php */
