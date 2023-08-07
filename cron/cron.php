<?php
/**
 * 计划任务入口文件
 *
 * php cron.php foo 会执行 ./controller/cron/FooController.php
 *
 */

//计划任务只能在命令行下运行
if (PHP_SAPI != 'cli') exit;

define('ROOT', __DIR__ . '/../');

require_once (ROOT . '/includes/common.inc.php');

if (empty($argv[1])) exit("usage: php cron.php arg");

$params = null;
if (count($argv) > 2)
    $params = array_slice($argv, 2);

$className = ucfirst(strtolower($argv[1])) . 'Controller';

if (!class_exists($className)) exit("error: $className not found");

$rc = new ReflectionClass($className);

if (!$rc->isSubclassOf('CronController')) exit("error: $className must extend CronController");

$rc->newInstance()->run($params);
