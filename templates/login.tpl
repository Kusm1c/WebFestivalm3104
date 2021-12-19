{extends file='layout.tpl'}
{block name=title}Login{/block}
{block name=body}
  <div class="container-sm">

    <div class="row">
      <div class="group col text-center">
        <h1><br>Connexion<br></h1>
      </div>
    </div>

    <form action="login" method="post">

      <div class="group"><br>
        <label for="stacked-email">Adresse email :</label>
        <input class="form-control" type="email" id="stacked-email" name="email" placeholder="Email"
          value={$value.email|escape|default:''}>
        <span> {$messages.email|escape|default:''}</span>
      </div>


      <div class="group"><br>
        <label for="stacked-password">Mot de passe :</label>
        <input class="form-control" type="password" id="stacked-password" name="mdp" placeholder="Mot de passe">
        <span> {$messages.mdp|escape|default:''}</span>
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