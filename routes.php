<?php

Flight::route('/', function(){
    Flight::render("index.tpl",array());
});


Flight::route('GET /register', function(){
    Flight::render("register.tpl",array());
});

Flight::route('GET /login', function(){
    Flight::render("login.tpl",array());
});

?>