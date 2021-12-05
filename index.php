<?php
    require 'index-config.php';
    require 'routes.php';

    Flight::set('pdo',$pdo);

    Flight::register('view', 'Smarty', array(), function($smarty){
        $smarty->template_dir = './templates_tpl/';
        $smarty->compile_dir = './templates_c/';
        $smarty->config_dir = './config/';
        $smarty->cache_dir = './cache/';
       });
    Flight::map('render', function($template, $data){
        Flight::view()->assign($data);
        Flight::view()->display($template);
       });
    
    Flight::start();
?>