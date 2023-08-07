work_dir=$(dirname "$0")

function run() {
    ps -elf | grep "$work_dir/cron.php $1" | grep -v grep
    if [ $? -ne 0 ]; then
        /usr/bin/php $work_dir/cron.php $@
    fi
}

#服务器自动开服和关服
#run Servercron

