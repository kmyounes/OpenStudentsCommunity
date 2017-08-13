<?php
return [
    'components' => [
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=mysql;port=3306;dbname=osc',
            'username' => 'app',
            'password' => 'secret',
            'charset' => 'utf8',
        ],
    ],
];
