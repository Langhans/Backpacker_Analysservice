/*
 * Setting up the connection to review and history database to Anememoter
 * application. @author Tim Langhans, Qiiwi Interactive
 */
<?php

$host = getenv("DB_HOST");
$port = getenv("DB_PORT");
$user = getenv("DB_USER");
$pass = getenv("DB_PASS");

$conf['datasources']['backpacker'] = array(
        'host'  => $host,
        'port'  => $port,
        'db'    => 'slow_query_log',
        'user'  => $user,
        'password' => $pass,
        'tables' => array(
                'global_query_review' => 'fact',
                'global_query_review_history' => 'dimension'
        ),
        'source_type' => 'slow_query_log'
);
