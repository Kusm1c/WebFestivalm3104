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

     // Vérifie si l'utilisateur a saisi un nom
    if (empty(trim($data->nom))) 
        $messages['nom'] = "Nom obligatoire";
    
    // Vérifie si l'utilisateur a saisi un prénom
    if (empty(trim($data->prenom))) 
    $messages['prenom'] = "Prénom obligatoire";


    // Vérifie si l'utilisateur a saisi un mot de passe
    if (empty(trim($data->mdp))) 
         $messages['mdp'] = "Mot de passe obligatoire";
    
    // Vérifie si l'utilisateur a saisi un mot de passe de 8 caractères
    if (strlen($data->mdp) <= 8)
        $messages['mdp'] = "Mot de passe de 8 caractères minimum";
    
     // Vérifie si l'utilisateur a saisi un mail
    if (empty(trim($data->mail)))  
        $messages['mail'] = "Adresse email obligatoire";
     
    // Vérifie si l'utilisateur a saisi un mail valide
    if (!filter_var($data->mail, FILTER_VALIDATE_EMAIL)) {
        $messages['mail'] = "Adresse email non valide";
    } 
   
   // SI nous avons aucun messages d'erreurs alors envoyer les données dans la BDD
    if(count($messages) <= 0){
        $st = Flight::get('pdo')->prepare("INSERT INTO utilisateur VALUES(:nom,:prenom,:mail,:mdp)");
        $st -> execute(array(
            ':nom'=>$data->nom,
            ':prenom'=>$data->prenom,
            ':mail'=>$data->mail,
            ':mdp'=>password_hash($data->mdp, PASSWORD_DEFAULT),
            
        )); 
        //redirige vers la page  success
        Flight::redirect("/success");
        // sinon retour sur la page register et affichage des messages d'erreurs
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

     // Vérifie si l'utilisateur a saisi un nom de groupe
    if (empty(trim($data->nomgrp))) 
    $messages['nomgrp'] = "Nom de groupe obligatoire";

    //Menu déroulant région à gérer


     // Vérifie si l'utilisateur a saisi un nom
    if (empty(trim($data->name))) 
        $messages['name'] = "Nom obligatoire";
    
        // Vérifie si l'utilisateur a saisi un prénom
    if (empty(trim($data->prenom))) 
        $messages['prenom'] = "Prénom obligatoire";
     
    // Vérifie si l'utilisateur a saisi une adresse
    if (empty(trim($data->adresse))) 
        $messages['adresse'] = "Adresse obligatoire";
    
    // Vérifie si l'utilisateur a saisi un code postal
    if (empty(trim($data->code))) {
        $messages['code'] = "Code postal obligatoire";
    }

    // Vérifie la validité du code postal
    if (!preg_match("~^[0-9]{5}$~",$data->code))
        $messages['code'] = "Code postal invalide";
    
    // Vérifie si l'utilisateur a saisi un mail
    if (empty(trim($data->mail)))  
      $messages['mail'] = "Adresse email obligatoire";
   
    // Vérifie si l'utilisateur a saisi un mail valide
  if (!filter_var($data->mail, FILTER_VALIDATE_EMAIL)) 
      $messages['mail'] = "Adresse email non valide";
  
    // Vérifie la validité du numéro de téléphone
    if(!preg_match('`[0-9]{10}`',$data->phone))
        $messages['phone'] = "Numéro de téléphone non valable";
    
     // Vérifie si l'utilisateur a saisi un style musical
     if (empty(trim($data->style))) {
        $messages['style'] = "Veuillez indiquer un style musical";
    }

    // Vérifie si l'utilisateur a saisi une année de création
    if (empty(trim($data->annee))) {
        $messages['annee'] = "Veuillez indiquer l'année de création du groupe";
    }
    // Vérifie si la date saisie est comprise entre 1800 et 2021
    if((($data->annee) < '1800')||(($data->annee) > '2021')){
        $messages['annee'] = "Date de saisie invalide";
    }

      // Vérifie si l'utilisateur a saisi quelquechose dans la zone de texte Présentation
      if (empty(trim($data->presentation))) {
        $messages['presentation'] = "Veuillez écrire quelques lignes pour vous présenter";
    }

    // Vérifie si l'utilisateur a saisi quelquechose dans la zone de texte : expériences scéniques
    if (empty(trim($data->experience))) 
        $messages['experience'] = "Veuillez écrire quelques lignes sur vos expériences scéniques";

    
    // Vérifie si l'utilisateur a saisi quelquechose dans la zone de texte : expériences scéniques
    if (empty(trim($data->urlsite))) 
        $messages['urlsite'] = "Veuillez saisir un url vers votre site web ou votre page facebook";

    // Vérifie la validité de l'url saisi pour le site web ou page facebook    
    if (!filter_var($data->urlsite, FILTER_VALIDATE_URL)) 
            $messages['urlsite'] = "URL non valide";
    
     // Vérifie la validité de l'url saisi pour l'adresse page soundcloud
     if (!filter_var($data->urlsoundcloud, FILTER_VALIDATE_URL)) 
        $messages['urlsoundcloud'] = "URL non valide";

    // Vérifie la validité de l'url saisi pour l'adresse page youtube
    if (!filter_var($data->urlyoutube, FILTER_VALIDATE_URL)) 
        $messages['urlyoutube'] = "URL non valide";

    //A gérer => les membres du groupe(1 à 8)

});



?>