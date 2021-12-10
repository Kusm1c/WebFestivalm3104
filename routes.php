<?php

Flight::route('/', function(){
    Flight::render("index.tpl",array());
});


Flight::route('GET /register', function(){
    Flight::render("register.tpl",array());
});

Flight::route('POST /register', function(){

    $data = Flight::request()->data;
    $messages=array();
    if (empty(trim($nom))) {
        $messages['nom'] = "Nom obligatoire";
    }
    if (empty(trim($prenom))) 
        $messages['prenom'] = "Prénom obligatoire";
    if (strlen($password) < 8) 
        $messages['password'] = "Mot de passe de 8 caractères minimum";
    
    if (empty(trim($password))) 
        $messages['mdp'] = "Mot de passe obligatoire";
    
    if (empty(trim($email))) {
        $messages['mail'] = "Adresse email obligatoire";
    } else if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $messages['mail'] = "Adresse email non valide";
    } 
    if(count($message)>0)
        Flight::render("register.tpl",array( "messages"=> $message,"value" => $_POST));
    /*}else{
        $db=Flight::get('db')->prepare(
            "insert into utilisateur values (:nom,:mail,:mdp,:ville,:pays)" 
        );
        $db->execute(array(':nom' => $nom,':mail' => $mail,':mdp' => password_hash($data-> mdp, Password_default),':ville' => $ville,':pays' => $pays ));
        Flight::redirect("/success");
    } */   


    Flight::redirect("/success");
});

Flight::route('GET /login', function(){
    Flight::render("login.tpl",array());
});

Flight::route('GET /formulaire', function(){
    Flight::render("form_candidat.tpl",array());
});




?>