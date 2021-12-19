<?php
session_start();
require 'index-config.php';

Flight::set('db', $db);

// Register Smarty as the view class
// Also pass a callback function to configure Smarty on load
Flight::register('view', 'Smarty', array(), function ($smarty) {
    $smarty->template_dir = './templates/';
    $smarty->compile_dir = './templates_c/';
    $smarty->config_dir = './config/';
    $smarty->cache_dir = './cache/';
});

Flight::map('render', function ($template, $data) {
    Flight::view()->assign($data);
    Flight::view()->display($template);
});

if (isset($_SESSION["email"])) {
    Flight::view()->assign("_session_", $_SESSION["email"]);
    Flight::view()->assign("_prenom_", $_SESSION["prenom"]);
    Flight::view()->assign("_userID_", $_SESSION["userID"]);
    if ($_SESSION["isAdmin"] == 1)
        Flight::view()->assign("_admin_", $_SESSION["isAdmin"]);
}

require "routes.php";
Flight::start();
