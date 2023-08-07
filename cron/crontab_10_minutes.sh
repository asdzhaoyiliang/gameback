work_dir=$(dirname "$0")

function run() {
    ps -elf | grep "$work_dir/cron.php $1" | grep -v grep
    if [ $? -ne 0 ]; then
        /usr/bin/php $work_dir/cron.php $@
    fi
}

#注册创角统计
run Regcron

#登录统计
run Logincron

#等级分布统计
run Levelcron

#在线时长
run Onlinetimecron