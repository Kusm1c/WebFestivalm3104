{extends file='layout.tpl'}
{block name=title}Accueil{/block}
{block name=body}
  <div class="container">
    <div class="row">
      <div class="group col text-center">
        <h1><br>Site du festival<br></h1>
      </div>
    </div>

    {if isset($_session) && !isset($_admin_)}
      <p>Bonjour {$_prenom} !</p>
      <p><a href="candidature">Gérer votre candidature | <a href="logout">Se déconnecter</a></p>
    {elseif isset($_session_) && isset($_admin_)}
      <p>Bonjour administrateur {$_prenom_} !</p>
      <p><a href="candidature">Liste des candidatures</a> | <a href="logout">Se déconnecter</a></p>
    {else}
      <p>Bienvenue !</p>
      <p>Pour gérer votre candidature ou en poster une, veuillez <a href="login">vous connecter</a> ou <a href="register">vous inscrire</a></p>
    {/if}
  </div>

{/block}