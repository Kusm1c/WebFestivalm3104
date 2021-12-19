{extends file='layout.tpl'}
{block name=title}Inscription{/block}
{block name=body}
  <div class="container-sm">

    <div class="row">
      <div class="group col text-center">
        <h1><br>Inscription<br><br></h1>
      </div>
    </div>

    {* Input nom rép client*}
    <form action="register" method="post">
      <div class="row">
        <div class="group col-md-6">
          <label for="name">Nom :</label>
          <input class="form-control" type="text" id="nom" name="nom" placeholder="Nom"
            value={$value.nom|escape|default:''}>
          <span> {$messages.nom|escape|default:''}</span>
        </div>
        
        {* Input prenom rép client*}
        <div class="group col-md-6">
          <label for="name">Prénom :</label>
          <input class="form-control" type="text" id="prenom" name="prenom" placeholder="Prénom"
            value={$value.prenom|escape|default:''}>
          <span> {$messages.prenom|escape|default:''}</span>
        </div>

        {* Input mail rép client*}
        <div class="group">
          <label for="stacked-email">Email :</label>
          <input class="form-control" type="email" id="mail" name="mail" placeholder="Email"
            value={$value.mail|escape|default:''}>
          <span> {$messages.mail|escape|default:''}</span>
        </div>

        {* Input tel rép client*}
        <div class="group col-md-6"><br>
          <label for="phone">Téléphone :</label>
          <input class="form-control" type="tel" id="phone" name="phone" placeholder="0601020304" 
            value={$value.phone|escape|default:''}>
          <span> {$messages.phone|escape|default:''}</span>
        </div>

        {* Input code postal rép client*}
        <div class="group col-md-6"><br>
          <label for="codePostal">Code Postal :</label>
          <input class="form-control" type="number" id="codePostal" name="codePostal" pattern="[0-9]{5}" placeholder="80000"
            value={$value.codePostal|escape|default:''}>
          <span> {$messages.codePostal|escape|default:''}</span>
        </div>
   *
    
        {* Input mdp rép client*}
        <div class="group">
          <label for="stacked-password">Mot de passe :</label>
          <input class="form-control" type="password" id="mdp" name="mdp" placeholder="Mot de passe">
          <span> {$messages.mdp|escape|default:''}</span>
        </div>

      <div class="row">
      {* Input adresse rép groupe *}
        <div class="group col-md-6"><br>
          <label for="adresse">Adresse :</label>
          <input class="form-control" type="text" id="adresse" name="adresse" placeholder="Adresse"
            value={$value.adresse|escape|default:''}>
        <span> {$messages.adresse|escape|default:''}</span>
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