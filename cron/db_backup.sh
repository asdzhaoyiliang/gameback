#数据库自动备份


# /bin/bash
DB_NAME="gameback"
DB_USER="root"
DB_PASS="facai2018!!!"
BIN_DIR="/usr/bin"
BACK_DIR="/usr/data/db_back"
DATE="gameback-`date +'%Y%m%d%H%M'`"
LogFile="$BACK_DIR"/dbbakup.log #日志记录保存的目录
BackNewFile=$DATE.sql

$BIN_DIR/mysqldump --opt --force -u$DB_USER  -p$DB_PASS $DB_NAME > $BACK_DIR/$DATE.sql


echo -----------------------"$(date +"%y-%m-%d %H:%M:%S")"----------------------- >> $LogFile

echo  createFile:"$BackNewFile" >> $LogFile


#find "/www/db_back/" -cmin +1 -type f -name "*.sql" -print > deleted.txt
#-ctime表示创建时间，这里表示删除创建时间为多少天之前的文件，也就是结果只保留多少天的数据
find "/usr/data/db_back/" -ctime +7 -type f -name "*.sql" -print > deleted.txt

echo -e "delete files:\n" >> $LogFile

#循环删除匹配到的文件
cat deleted.txt | while read LINE
do
    rm -rf $LINE
    echo $LINE>> $LogFile
done