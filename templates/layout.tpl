<html>
<head>
    <title>{block name=title}Default Page Title{/block}</title>
    {block name=head}
        <!-- Ajout CSS Bootstrap !-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    {/block}
</head>

<body>
{block name=menu}
    <a href="./">Accueil</a>
    <a href="login">Connexion</a>
    <a href="register">Inscription<a>
    <a href="profil">Profil</a>
{/block}
{block name=body}
Contenu générique
{/block}

<!-- Ajout JavaScript Bootstrap !-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>