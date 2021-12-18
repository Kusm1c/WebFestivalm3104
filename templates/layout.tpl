<html>

<head>
  <title>{block name=title}Default Page Title{/block}</title>
  {block name=head}
    <!-- Ajout CSS Bootstrap !-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="templates/style-tpl.css">
  {/block}
</head>

<body>
  {block name=menu}

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="./">Festival</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
          aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <a class="nav-link" href="./">Accueil</a>
            <a class="nav-link" href="login">Connexion</a>
            <a class="nav-link" href="register">Inscription<a>
                <a class="nav-link" href="profil">Profil</a>
                <a class="nav-link" href="formulaire">Formulaire de candidature</a>
          </div>
        </div>
      </div>

    </nav>

  {/block}
  {block name=body}
    Contenu générique
  {/block}

  <!-- Ajout JavaScript Bootstrap !-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
</body>

</html>