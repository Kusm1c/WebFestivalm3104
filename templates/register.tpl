{extends file='layout.tpl'}
{block name=title}Register{/block}
{block name=body}
<h1>Register</h1>
<div id='main'>
<form class="pure-form pure-form-stacked" action="register" method="post">
    <fieldset>
        <legend>Inscription</legend>

        <label for="name">Nom :</label>
        <input type="text" id="nom" name="nom" placeholder="Nom"  value={$value.nom|escape|default:''}>
        <span> {$messages.nom|escape|default:''}</span>

	    <label for="name">Prénom :</label>
        <input type="text" id="prenom" name="prenom" placeholder="Prénom"  value={$value.prenom|escape|default:''}>
        <span> {$messages.prenom|escape|default:''}</span>

        <label for="stacked-email">Email :</label>
        <input type="email" id="stacked-email" name="mail" placeholder="Email"  value={$value.mail|escape|default:''}>
        <span> {$messages.mail|escape|default:''}</span>

        <label for="stacked-password">Mot de passe :</label>
        <input type="password" id="stacked-password" name="mdp" placeholder="Mot de passe">
        <span> {$messages.mdp|escape|default:''}</span>

       	<button type="submit" class="pure-button pure-button-primary">Sign in</button>
    </fieldset>
</form>
</div>
{/block}