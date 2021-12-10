{extends file='layout.tpl'}
{block name=title}Log in{/block}
{block name=body}
<h1>Connexion</h1>
<div id='main'>
<form class="pure-form pure-form-stacked" action="login" method="post">
    <fieldset>
        <legend>Se connecter</legend>
    <div>
        <label for="stacked-email">Email :</label>
        <input type="email" id="stacked-email" name="mail" placeholder="Email"  value={$value.mail|escape|default:''}>
        <span> {$messages.mail|escape|default:''}</span>
    </div>

    <div>
        <label for="stacked-password">Mot de passe :</label>
        <input type="password" id="stacked-password" name="mdp" placeholder="Mot de passe">
        <span> {$messages.mdp|escape|default:''}</span>
    </div>

    <div>
  	    <button type="submit" class="pure-button pure-button-primary">Log in</button>  
    </div> 
    </fieldset>
</form>

{/block}