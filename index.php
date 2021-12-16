<?php 
session_start();
require 'index-config.php';

Flight::set('db',$db);
session_start();

// Register Smarty as the view class
// Also pass a callback function to configure Smarty on load
Flight::register('view', 'Smarty', array(), function($smarty){
    $smarty->template_dir = './templates/';
    $smarty->compile_dir = './templates_c/';
    $smarty->config_dir = './config/';
    $smarty->cache_dir = './cache/';    
});

Flight::map('render', function($template, $data){
    Flight::view()->assign($data);
    Flight::view()->display($template);
});

if (isset($_SESSION["mail"]))
{
     Flight::view()->assign("__session__", $_SESSION["mail"]);
}

require "routes.php";
Flight::start();
