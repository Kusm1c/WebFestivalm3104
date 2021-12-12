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


    if (empty(trim($data->nom))) 
        $messages['nom'] = "Nom obligatoire";
    
    if (empty(trim($data->prenom))) 
    $messages['prenom'] = "Prénom obligatoire";

    if (empty(trim($data->mdp))) 
         $messages['mdp'] = "Mot de passe obligatoire";
    
    if (strlen($data->mdp) <= 8)
        $messages['mdp'] = "Mot de passe de 8 caractères minimum";
    

    if (empty(trim($data->mail)))  
        $messages['mail'] = "Adresse email obligatoire";
    
    if (!filter_var($data->mail, FILTER_VALIDATE_EMAIL)) {
        $messages['mail'] = "Adresse email non valide";
    } 
   
   
    if(count($messages) <= 0){
        $st = Flight::get('pdo')->prepare("INSERT INTO utilisateur VALUES(:nom,:prenom,:mail,:mdp)");
        $st -> execute(array(
            ':nom'=>$data->nom,
            ':prenom'=>$data->prenom,
            ':mail'=>$data->mail,
            ':mdp'=>password_hash($data->mdp, PASSWORD_DEFAULT),
            
        )); 
        Flight::redirect("/success");
    }else {
        Flight::render("register.tpl", array(
            'messages' => $messages,
            'valeurs' => $_POST
         
        ));
       
    }
});

Flight::route('GET /login', function(){
    Flight::render("login.tpl",array());
});

Flight::route('GET /formulaire', function(){
    Flight::render("form_candidat.tpl",array());
});

Flight::route('POST /formulaire', function(){
    Flight::render("form_candidat.tpl",array());

    $data = Flight::request()->data;
    $messages=array();
});



?>