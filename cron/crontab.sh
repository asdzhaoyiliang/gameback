#一分钟计划任务
*/1 * * * * /bin/sh /data/bg01gb/cron/crontab_1_minute.sh  > /data/bg01gb/cron/log/1min 2>&1

#5分钟计划任务
*/5 * * * * /bin/sh /data/bg01gb/cron/crontab_5_minutes.sh > /data/bg01gb/cron/log/5min 2>&1

#10分钟计划任务
*/10 * * * * /bin/sh /data/bg01gb/cron/crontab_10_minutes.sh > /data/bg01gb/cron/log/10min 2>&1

#1小时计划任务
0   * * * * /bin/sh /data/bg01gb/cron/crontab_1_hour.sh    > /data/bg01gb/cron/log/1hour 2>&1

#每天凌晨4点计划任务
0   4 * * * /bin/sh /data/bg01gb/cron/crontab_4.00_am.sh   > /data/bg01gb/cron/log/4am 2>&1
