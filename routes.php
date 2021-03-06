<?php

Flight::route('/', function () {
    Flight::render("index.tpl", array());
});


Flight::route('GET /register', function () {
    Flight::render("register.tpl", array());
});

Flight::route('POST /register', function () {
    $data = Flight::request()->data;
    $messages = array();

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

    // Test si le client a saisi un mail
    if (empty(trim($data->email))) {
        $messages['email'] = "Adresse email obligatoire";
        //Test la validité de l'adresse  mail saisi
    } else if (!filter_var($data->email, FILTER_VALIDATE_EMAIL)) {
        $messages['email'] = "Adresse email non valide";
        // Test si l'adresse mail existe déjà
    } else {
        $testDupli = Flight::get('db')->prepare("select utilisateur.email from utilisateur where utilisateur.email like :recherche");
        $testDupli->execute(array(':recherche' => "%$data->email%"));
        if ($testDupli->fetch(PDO::FETCH_NUM) != 0) {
            $messages['email'] = "Adresse email déjà existante";
        }
    }

    // Vérifie si l'utilisateur a saisi un code postal
    if (empty(trim($data->codePostal)))
        $messages['codePostal'] = "Code postal obligatoire";

    // Vérifie la validité du code postal
    if (!preg_match("~^[0-9]{5}$~", $data->codePostal))
        $messages['codePostal'] = "Code postal invalide";

    // Vérifie si l'utilisateur a saisi un numero de telephone
    if (strlen($data->phone) != 10)
        $messages['phone'] = "Numéro saisi invalide";

    // Vérifie si l'utilisateur a saisi un numero de telephone
    if (empty(trim($data->phone)))
        $messages['phone'] = "Numéro de téléphone obligatoire";

    // Vérifie si l'utilisateur a saisi une addresse
    if (empty(trim($data->adresse)))
        $messages['adresse'] = "Adresse obligatoire";


    // Si nous avons aucun messages d'erreurs alors envoyer les données dans la BDD
    if (count($messages) == 0) {
        $db = Flight::get('db')->prepare("INSERT INTO utilisateur VALUES(0,:nom,:prenom,:adresse,:codePostal,:email,:telephone,:isAdmin,:mdp)");
        $db->execute(array(
            ':nom' => $data->nom,
            ':prenom' => $data->prenom,
            ':adresse' => $data->adresse,
            ':codePostal' => $data->codePostal,
            ':email' => $data->email,
            ':telephone' => $data->phone,
            ':isAdmin' => 0,
            ':mdp' => password_hash($data->mdp, PASSWORD_DEFAULT),
        ));
        //Redirige vers la page success
        Flight::redirect("/");

        //Sinon retour sur la page register et affichage des messages d'erreurs
    } else {
        Flight::render("register.tpl", array(
            'messages' => $messages,
            'valeurs' => $_POST
        ));
    }
});

Flight::route('GET /login', function () {
    Flight::render("login.tpl", array());
});

Flight::route('POST /login', function () {
    $data = Flight::request()->data;
    $db = Flight::get('db');
    $email = $data->email;
    $mdp = $data->mdp;
    $messages = array();

    // Vérification des valeurs de login en les comparant à la base de données
    // bd prend le nom l'email et le mot de passe de la table utilisateur quand l'email de la recherche correspond à celui de la base de données 


    // Vérifie si l'utilisateur a saisi un mot de passe
    if (empty(trim($mdp))) {
        $messages['mdp'] = "Mot de passe obligatoire";
        // Vérifie si l'utilisateur a saisi un mot de passe de 8 caractères
    } else if (strlen($mdp) < 8) {
        $messages['mdp'] = "Mot de passe de 8 caractères minimum";
    }

    if (empty(trim($email))) {
        $messages['email'] = "Adresse email obligatoire";
    } else if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $messages['email'] = "Adresse email non valide";
    } else {
        // check si l'adresse mail existe dans la BDD
        $verifEmail = $db->prepare("select userid,prenom,email,isAdmin,mdp from utilisateur where utilisateur.email like :recherche");
        $verifEmail->execute(array(":recherche" => $email));
        $userData = $verifEmail->fetch();
        if (empty($userData)) {
            $messages['email'] = "Aucun compte existant pour cette adresse email";
            // check si le mdp saisi correspond à l'adresse mail saisie
        } else if (!password_verify($mdp, $userData['mdp'])) {
            $messages['mdp'] = "Mot de passe saisi incorrect";
        }
    }

    if (count($messages) == 0) {
        $_SESSION['userID'] = $userData['userid'];
        $_SESSION['email'] = $userData['email'];
        $_SESSION['prenom'] = $userData['prenom'];
        $_SESSION['isAdmin'] = $userData['isAdmin'];
        Flight::redirect("/");
    } else {
        Flight::render("login.tpl", array("value" => $_POST, "messages" => $messages));
    }
});

Flight::route('GET /formulaire', function () {
    Flight::render("form_candidat.tpl", array());
});

Flight::route('POST /formulaire', function () {
    $data = Flight::request()->data;
    $files = Flight::request()->files;
    $messages = array();

    // Vérifie si l'utilisateur a saisi un nom de groupe
    if (empty(trim($data->nomgrp)))
        $messages['nomgrp'] = "Nom de groupe obligatoire";
     
    // Vérifie si l'utilisateur a selectionné une scène
    if ($data->scene == "rien")
        $messages['scene'] = "Veuillez choisir une scène";

    // Vérifie si l'utilisateur a selectionné un département
    if ($data->dpt == "rien")
        $messages['dpt'] = "Veuillez choisir un département";


    //Vérifie si l'utilsateur a choisi un département 
    if (!isset($data->dpt))
        $messages['dpt'] = "Veuillez sélectionner votre département";


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
    if (!preg_match("~^[0-9]{5}$~", $data->code))
        $messages['code'] = "Code postal invalide";

    // Vérifie si l'utilisateur a saisi un mail
    if (empty(trim($data->mail)))
        $messages['mail'] = "Adresse email obligatoire";

    // Vérifie si l'utilisateur a saisi un mail valide
    if (!filter_var($data->mail, FILTER_VALIDATE_EMAIL))
        $messages['mail'] = "Adresse email non valide";

    // Vérifie la validité du numéro de téléphone
    if (strlen($data->phone) != 10)
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
    if ((($data->annee) < '1800') || (($data->annee) > '2021')) {
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


    if (isset($data->usercloud)) {

        // Vérifie la validité de l'url saisi pour l'adresse page soundcloud
        if (!filter_var($data->urlsoundcloud, FILTER_VALIDATE_URL))
            $messages['urlsoundcloud'] = "URL non valide";
    }


    if (isset($data->useryoutube)) {

        // Vérifie la validité de l'url saisi pour l'adresse page youtube
        if (!filter_var($data->urlyoutube, FILTER_VALIDATE_URL))
            $messages['urlyoutube'] = "URL non valide";
    }



    //  Vérifier la validité de l'extension .pdf du fichier mp3_1
    if (preg_match('/\.(mp3)$/', $files['mp3_1']['name'])) {
    } else {
        unset($files['mp3_1']);
        $messages["mp3_1"] = "Format incorrect ";
    }
    // Vérifie si l'utilisateur a rentré un fichier pour mp3_1
    if (!isset($files["mp3_1"])) {
        $messages['mp3_1'] = "Veuillez saisir un fichier";
    }

    
    //  Vérifier la validité de l'extension .pdf du fichier mp3_2
    if (preg_match('/\.(mp3)$/', $files['mp3_2']['name'])) {
    } else {
        unset($files['mp3_2']);
        $messages["mp3_2"] = "Format incorrect ";
    }
    // Vérifie si l'utilisateur a rentré un fichier pour mp3_2
    if (!isset($files["mp3_2"]))
        $messages['mp3_2'] = "Veuillez saisir un fichier";

    
    //  Vérifier la validité de l'extension .pdf du fichier mp3_3
    if (preg_match('/\.(mp3)$/', $files['mp3_3']['name'])) {
    } else {
        unset($files['mp3_3']);
        $messages["mp3_3"] = "Format incorrect ";
    }
    // Vérifie si l'utilisateur a rentré un fichier pour mp3_3
    if (!isset($files["mp3_3"]))
        $messages['mp3_3'] = "Veuillez saisir un fichier";

    if ($files['dossierpdf'] == 'Aucun fichier choisi') {

        // Vérifier la validité de l'extension .pdf des fichiers dossierpdf
        if (preg_match('/\.(pdf)$/', $files['dossierpdf']['name'])) {
        } else {
            unset($files['dossierpdf']);
            $messages['dossierpdf'] = "Format incorrect ";
        }
    }
    // Vérifie si l'utilisateur a coché un des deux boutons pour l'association
    if (!isset($data->assoc)) {
        $messages['assoc'] = "Veuillez cocher oui ou non";
    }
    // Vérifie si l'utilisateur a coché un des deux boutons pour la sacem
    if (!isset($data->sacem)) {
        $messages['sacem'] = "Veuillez cocher oui ou non";
    }
    // Vérifie si l'utilisateur a coché un des deux boutons pour le producteur
    if (!isset($data->prod)) {
        $messages['prod'] = "Veuillez cocher oui ou non";
    }


    // Vérifier la validité de l'extension .jpg .jpeg ou png du fichier photo_1
    if (preg_match('/\.(jpg|jpeg|png)$/', $files['photo_1']['name'])) {
    } elseif (($files['photo_1']['size'] <= 5240000) && ($files['photo_1']['size'] > 0)) // Test si fichiers photos pas trop grand
        $messages['photo_1'] = "fichier trop volumineux";
    else {
        unset($files['photo_1']);
        $messages['photo_1'] = "Format incorrect ";
    }
     // Vérifie si l'utilisateur a rentré un fichier pour photo_1
    if (!isset($files['photo_1']))
        $messages['photo_1'] = "Veuillez saisir un fichier";

    // Vérifier la validité de l'extension .jpg .jpeg ou png du fichier photo_2
    if (preg_match('/\.(jpg|jpeg|png)$/', $files['photo_2']['name'])) {
    } elseif (($files['photo_2']['size'] <= 5240000) && ($files['photo_2']['size'] > 0)) // Test si fichiers photos pas trop grand
        $messages['photo_2'] = "fichier trop volumineux";
    else {
        unset($files['photo_2']);
        $messages['photo_2'] = "Format incorrect ";
    }
     // Vérifie si l'utilisateur a rentré un fichier pour photo_2
    if (!isset($files['photo_2']))
        $messages['photo_2'] = "Veuillez saisir un fichier";

    // Vérifier la validité de l'extension .pdf du fichier techniquepdf
    if (preg_match('/\.(pdf)$/', $files['techniquepdf']['name'])) {
    } else {
        unset($files['techniquepdf']);
        $messages['techniquepdf'] = "Format incorrect ";
    }
     // Vérifie si l'utilisateur a rentré un fichier techniquepdf
    if (!isset($files['techniquepdf']))
        $messages['techniquepdf'] = "Veuillez saisir un fichier";

    // Vérifier la validité de l'extension .pdf du fichier sacempdf
    if (preg_match('/\.(pdf)$/', $files['sacempdf']['name'])) {
    } else {
        unset($files['sacempdf']);
        $messages['sacempdf'] = "Format incorrect ";
    }
     // Vérifie si l'utilisateur a rentré un fichier pour sacempdf
    if (!isset($files['sacempdf']))
        $messages['sacempdf'] = "Veuillez saisir un fichier";

    // Variable contenant l'ensemble des données des membres
    $mbrtot = $data->mbr1 . " " . $data->mbr2 . " " . $data->mbr3 . " " . $data->mbr4 . " " . $data->mbr5 . " " . $data->mbr6 . " " . $data->mbr7 . " " . $data->mbr8;

    // Vérifie si l'utilisateur a saisi un membre
    if (empty(trim($mbrtot)))
        $messages['mrembre'] = "Au moins 1 membre requis (vous)";

    // Si aucun messages d'erreurs
    if (count($messages) == 0) {
        $_SESSION['userID'] = $userData['userid'];
        $_SESSION['email'] = $userData['email'];
        $_SESSION['prenom'] = $userData['prenom'];
        $_SESSION['isAdmin'] = $userData['isAdmin'];
    // préparation de la requête sql
        $db = Flight::get('db')->prepare("INSERT INTO candidature VALUES(:groupName,:groupID,:deptID,:sceneID,repID,:style,:anneeCreation,:presentationTxT,expSceniques,:liensReseaux,:soundcloud,:youtube,:membres,:isAssoc,:isInscritSACEM,:isProd,:fichierMp3,:pressePDF,:photoGroupe,:ficheTechnique,:docSacem)");
    //exécution     
        $db->execute(array(
            ':groupName' => $data->nomgrp,
            ':groupID' => 0,
            ':deptID' => $data->dpt,
            ':sceneID' => $data->scene,
            ':repID' => $_SESSION['userID'],
            ':style' => $data->style,
            ':anneeCreation' => $data->annee,
            ':presentationTxT' => $data->presentation,
            ':expSceniques' => $data->experience,
            ':liensReseaux' => $data->urlsite,
            ':soundcloud' => $data->urlsoundcloud,
            ':youtube' => $data->urlyoutube,
            ':isAssoc' => $data->assoc,
            ':isInscritSACEM' => $data->sacem,
            ':isProd' => $data->prod,
            ':fichierMp3' => $data->mp3_1,
            ':fichierMp3' => $data->mp3_2,
            ':fichierMp3' => $data->mp3_3,
            ':pressePDF' => $data->dossierpdf,
            ':photoGroupe' => $data->photo_1,
            ':photoGroupe' => $data->photo_2,
            ':ficheTechnique' => $data->techniquepdf,
            ':docSacem' => $data->sacempdf,
            ':membres' => $mbrtot
        ));
        //redirection vers la racine après envoi
        Flight::redirect("/");
        // sinon retour sur la page register et affichage des messages d'erreurs
    } else {
        Flight::render("form_candidat.tpl", array(
            'messages' => $messages,
            'valeurs' => $_POST
        ));
    }
});

Flight::route('GET /logout', function () {
    $_SESSION = array();
    Flight::redirect("/");
});

Flight::route('GET /candidature', function () {
    Flight::render("recap_candidature.tpl", array());
});

Flight::route('GET /list_candidature', function () {
    Flight::render("list_candidature.tpl", array());
});