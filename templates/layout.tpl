<html>
<head>
    <title>{block name=title}Default Page Title{/block}</title>
    {block name=head}
        <link rel="stylesheet" href="https://unpkg.com/purecss@2.0.6/build/pure-min.css" integrity="sha384-Uu6IeWbM+gzNVXJcM9XV3SohHtmWE+3VGi496jvgX1jyvDTXfdK+rfZc8C1Aehk5" crossorigin="anonymous">
        <style>
        #main,footer{ padding:1em }
        </style>
        <link rel="stylesheet" href="./style.css">
    {/block}
</head>

<body>
{block name=menu}
    <a href="./">Accueil</a>
    <a href="login">Connexion</a>
    <a href="register">Inscription<a>
    <a href="profil">Profil</a>
{/block}

{block name=body}Contenu générique{/block}
</body>
</html>