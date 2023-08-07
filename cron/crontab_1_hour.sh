work_dir=$(dirname "$0")

function run() {
    ps -elf | grep "$work_dir/cron.php $1" | grep -v grep
    if [ $? -ne 0 ]; then
        /usr/bin/php  $work_dir/cron.php $@
    fi
}

#经济统计
run Economycron

#消费排行
run Rankcron

#综合统计
run Integratedcron