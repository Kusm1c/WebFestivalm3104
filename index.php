<?php
    require '../../../includes/flight-master/flight/Flight.php';
    require '../../../includes/smarty/libs/Smarty.class.php';
    require '../../../includes/pdo.php';
    include 'routes.php';

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
    
    Flight::set('pdo',$pdo);
    
    Flight::start();
?>