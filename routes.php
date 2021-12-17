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
    
    // Vérifie si l'utilisateur a saisi un code postal
    if (empty(trim($data->codePostal))) 
        $messages['codePostal'] = "Code Postal obligatoire";
   
    // Vérifie la validité du code postal
    if (!preg_match("~^[0-9]{5}$~",$data->code))
        $messages['code'] = "Code postal invalide";
    
    // Vérifie si l'utilisateur a saisi un numero de telephone
    if (strlen($data->telephone) === 10)
        $messages['telephone'] = "Numero de telephone à 10 chiffres";

    // Vérifie si l'utilisateur a saisi un numero de telephone
    if (empty(trim($data->telephone))) 
        $messages['telephone'] = "Numero de telephone obligatoire";
   
   // SI nous avons aucun messages d'erreurs alors envoyer les données dans la BDD
   if(count($messages) <= 0){
        $st = Flight::get('pdo')->prepare("INSERT INTO utilisateur VALUES(:nom,:prenom,:mail,:mdp)");
        $st -> execute(array(
            ':nom'=>$data->nom,
            ':prenom'=>$data->prenom,
            ':addresse'=>$data->addresse,
            'codePostal'=>$data->codePostal,
            ':mail'=>$data->mail,
            ':telephone'=>$data->telephone,
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
    $_FILES= Flight::request()->files;
    $messages=array();

     // Vérifie si l'utilisateur a saisi un nom de groupe
    if (empty(trim($data->nomgrp))) 
        $messages['nomgrp'] = "Nom de groupe obligatoire";

  
    //Vérifie si l'utilsateur a choisi un département 
    if(!isset($data->dpt))
        $messages['dpt']="Veuillez sélectionner votre département"; 


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

    // Vérifier la validité de l'extension .mp3 des fichiers mp3
    if(!preg_match('/\.(mp3)$/',$_FILES['mp3']['name'])){
        unset($_FILES['mp3']) ; //supprime le fichier directement (sécurité)
        $messages['mp3'] = "Fichier non valide";
    } 
    // Test si l'utilsateur a rentré 3 fichiers mp3
    if (!isset($_FILES['mp3']))
        $messages['mp3'] = "Veuillez saisir un fichier";
    
    // Test pour traiter les erreur lors de l'envoi des mp3
    if ($_FILES['mp3']['error'] != 0)
        $messages['mp3'] = "Erreur veuillez réessayer";

    // Vérifier la validité de l'extension .pdf des fichiers dossierpdf
    if(!preg_match('/\.(pdf)$/',$_FILES['dossierpdf']['name'])){
        unset($_FILES['dossierpdf']) ;
        $messages['dossierpdf'] = "Fichier non valide";
    } 

    // Test pour traiter les erreur lors de l'envoi du pdf
    if ($_FILES['dossierpdf']['error'] != 0)
        $messages['dossierpdf'] = "Erreur veuillez réessayer";

    // Vérifier la validité de l'extension .jpg .jpeg ou png des fichiers photos
    if(!preg_match('/\.(jpg|jpeg|png)$/',$_FILES['photo']['name'])){
        unset($_FILES['photo']) ;
        $messages['photo'] = "Fichier non valide";
    } 

    // Test si l'utilsateur a rentré 2  fichiers photo
    if (!isset($_FILES['photo']))
        $messages['photo'] = "Veuillez saisir un fichier";
    
    // Test pour traiter les erreur lors de l'envoi des photos
    if ($_FILES['photo']['error'] != 0)
        $messages['photo'] = "Erreur veuillez réessayer";

    // Test si fichiers photos pas trop grand
    if ($_FILES['photo']['size'] <= 5240000)// en octets
        $messages['photo'] = "fichier trop volumineux";

       

    // Vérifier la validité de l'extension .pdf des fichiers techniques
    if(!preg_match('/\.(pdf)$/',$_FILES['techniquepdf']['name'])){
        unset($_FILES['techniquepdf']) ;
        $messages['techniquepdf'] = "Fichier non valide";
    } 

    // Test si l'utilsateur a rentré un fichier technique
    if (!isset($_FILES['techniquepdf']))
        $messages['techniquepdf'] = "Veuillez saisir un fichier";
 
    // Test pour traiter les erreur lors de l'envoi du fichier technique
    if ($_FILES['techniquepdf']['error'] != 0)
        $messages['techniquepdf'] = "Erreur veuillez réessayer";

    // Vérifier la validité de l'extension .pdf des fichiers SACEM
    if(!preg_match('/\.(pdf)$/',$_FILES['sacempdf']['name'])){
        unset($_FILES['sacempdf']) ;
        $messages['sacempdf'] = "Fichier non valide";
    } 

     // Test si l'utilsateur a rentré un fichier SACEM
    if (!isset($_FILES['sacempdf']))
        $messages['sacempdf'] = "Veuillez saisir un fichier";
 
    // Test pour traiter les erreur lors de l'envoi du fichier SACEM
    if ($_FILES['sacempdf']['error'] != 0)
        $messages['sacempdf'] = "Erreur veuillez réessayer";
    
    // Variable contenant l'ensemble des données des membres
    $mbrtot = $data->mbr1. " " .$data->mbr2. " " .$data->mbr3. " " .$data->mbr4. " " .$data->mbr5. " " .$data->mbr6. " " .$data->mbr7. " " .$data->mbr8;

    // Vérifie si l'utilisateur a saisi un membre
    if (empty(trim($mbrtot)))  
        $messages['mrembre'] = "Au moins 1 membre requis (vous)";

        if(count($messages) <= 0){
            $st = Flight::get('pdo')->prepare("INSERT INTO candidature VALUES(:nomgrp,:dep,:style,:annee,:presentation,:experience,:urlsite,:urlsoundcloud,urlyoutube,:is_assoc,:isnot_assoc,:is_sacem,:isnot_sacem,:is_prod,:isnot_prod,:mp3,:dossierpdf,:photo,:techniquepdf,:sacempdf,:membres)");
            $st -> execute(array(':nomgrp'=>$data->nomgrp,
                                ':ep'=>$data->dep,
                                ':style'=>$data->style,
                                ':annee'=>$data->annee,
                                ':presentation'=>$data->presentation,
                                ':experience'=>$data->experience,
                                ':urlsite'=>$data->urlsite,
                                ':urlsoundcloud'=>$data->urlsoundcloud,
                                ':urlyoutube'=>$data->urlyoutube,
                                ':is_assoc'=>$data->is_assoc,
                                ':isnot_assoc'=>$data->isnot_assoc,
                                ':is_sacem'=>$data->is_sacem,
                                ':isnot_sacem'=>$data->isnot_sacem,
                                ':is_prod'=>$data->is_prod,
                                ':isnot_prod'=>$data->isnot_prod,
                                ':mp3'=>$data->mp3,
                                ':dossierpdf'=>$data->dossierpdf,
                                ':photo'=>$data->photo,
                                ':techniquepdf'=>$data->techniquepdf,
                                ':sacempdf'=>$data->sacempdf,
                                ':membres'=>$mbrtot
                                ));
            
            $st = Flight::get('pdo')->prepare("INSERT INTO département VALUES(:département)");
            $st -> execute(array(':département'=>$data->dpt));

            $st = Flight::get('pdo')->prepare("INSERT INTO scene VALUES(:scene)");
            $st -> execute(array(':scene'=>$data->scene));
            //redirige vers la page  success
            Flight::redirect("/success");
            // sinon retour sur la page register et affichage des messages d'erreurs
        }else{
            Flight::render("form_candidat.tpl", array(
                'messages' => $messages,
                'valeurs' => $_POST
             
            ));
           
        }
    
});

Flight::route('POST /login', function () {
    $data = Flight::request()->data;
    $bd = Flight::get('pdo')->prepare("select Nom,email,Mdp from utilisateur where utilisateur.email like :recherche");
    $email = $data->courriel;
    $pass = $data->psw;

    $message = array();

    // Vérification des valeurs de login en les comparant à la base de données
    // bd prend le nom l'email et le mot de passe de la table utilisateur quand l'email de la recherche correspond à celui de la base de données 
    // rowCount vérifie si les champs sont remplies
    // fetch récupère les éléments de la base de données
    
     // Vérifie si l'utilisateur a saisi un mot de passe
    if (empty(trim($data->mdp))) 
         $messages['mdp'] = "Mot de passe obligatoire";
    
    // Vérifie si l'utilisateur a saisi un mot de passe de 8 caractères
    if (strlen($data->mdp) <= 8)
        $messages['mdp'] = "Mot de passe de 8 caractères minimum";
    
    if (empty(trim($data->mail))) {
        $messages['mail'] = "Adresse email obligatoire";
    } else if (!filter_var($data->mail, FILTER_VALIDATE_EMAIL)) {
        $messages['mail'] = "Adresse email non valide";
    } else {
        $bd->execute(array(":recherche" => $data->mail));
    }
    if ($bd->rowCount() == 0) {
        $messages['mail'] = "Email invalide";
    }
    if (empty(trim($data->mdp))) {
        $messages['mdp'] = "Mot de passe obligatoire";
    } else {
        $row = $st->fetch();
        if (!password_verify($data->mdp, $row['mdp'])) {
            $messages['mdp'] = "Mot de passe incorrect";
        }
    }

    if (count($messages) < 1) {
        $_SESSION['user'] = $row['nom'];
        Flight::redirect("/");
    } else {
        Flight::render("login.tpl", array("value" => $_POST, "error" => $messages));
    }
    $_SESSION['mail'] = $data->mail;
});


Flight::route('GET /logout', function () {
    session_destroy();
    Flight::redirect("/");
});


?>
