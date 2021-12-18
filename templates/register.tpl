{extends file='layout.tpl'}
{block name=title}Inscription{/block}
{block name=body}
  <div class="container-sm">

    <div class="row">
      <div class="group col text-center">
        <h1><br>Inscription<br><br></h1>
      </div>
    </div>

    <form action="register" method="post">
      <div class="row">
        <div class="group col-md-6">
          <label for="name">Nom :</label>
          <input class="form-control" type="text" id="nom" name="nom" placeholder="Nom"
            value={$value.nom|escape|default:''}>
          <span> {$messages.nom|escape|default:''}</span>
        </div>

        <div class="group col-md-6">
          <label for="name">Prénom :</label>
          <input class="form-control" type="text" id="prenom" name="prenom" placeholder="Prénom"
            value={$value.prenom|escape|default:''}>
          <span> {$messages.prenom|escape|default:''}</span>
        </div>


        <div class="group">
          <label for="stacked-email">Email :</label>
          <input class="form-control" type="email" id="mail" name="mail" placeholder="Email"
            value={$value.mail|escape|default:''}>
          <span> {$messages.mail|escape|default:''}</span>
        </div>

        <div class="group">
          <label for="stacked-password">Mot de passe :</label>
          <input class="form-control" type="password" id="mdp" name="mdp" placeholder="Mot de passe">
          <span> {$messages.mdp|escape|default:''}</span>
        </div>
      </div>
      <div class="row">
        <div class="group col text-center">
          <br>
          <button type="submit" class="btn btn-primary">S'inscrire</button>
        </div>
      </div>

    </form>
  </div>
{/block}