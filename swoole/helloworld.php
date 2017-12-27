<?php

$http = new swoole_http_server('0.0.0.0', 9501, SWOOLE_BASE);

$http->on('request', function ($request, $response) {
    $response->header('Content-Type', 'text/html; charset=utf-8');
    echo "on request...";
    $response->end('<h1>Hello Swoole. #' . rand(1000, 10000) . '</h1>');
});

$http->start();
