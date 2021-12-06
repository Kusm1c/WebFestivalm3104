{*{extends file='success.tpl'}*}
{block name=title}Formulaire de Candidature{/block}
{block name=body}
<h1>Register</h1>
<div id='main'>
<form class="pure-form pure-form-stacked" action="envoi" enctype="multipart/form-data" method="post">
    <fieldset>
        <legend>Inscription</legend>

        <label for="namegrp">Nom du groupe</label>
        <input type="text" id="namegrp" name="nomgrp" placeholder="Nomgroupe"  value={$value.nomgrp|escape|default:''}>
        <span> {$messages.nomgrp|escape|default:''}</span>
      	 
      	<select>
        <option value="rien" selected="">Sélectionnez votre département</option>
		<option value="01">01 - AIN</option>
        <option value="02">02 - AISNE</option>
        <option value="03">03 - ALLIER</option>
        <option value="04">04 - ALPES DE HAUTE PROVENCE</option>
        <option value="05">05 - HAUTES - ALPES</option>
        <option value="06">06 - ALPES MARITIMES</option>
        <option value="07">07 - ARDECHE</option>
        <option value="08">08 - ARDENNES</option>
        <option value="09">09 - ARIEGE</option>
        <option value="10">10 - AUBE</option>
        <option value="11">11 - AUDE</option>
        <option value="12">12 - AVEYRON</option>
        <option value="13">13 - BOUCHES - DU - RHONE</option>
        <option value="14">14 - CALVADOS</option>
        <option value="15">15 - CANTAL</option>
        <option value="16">16 - CHARENTE</option>
        <option value="17">17 - CHARENTE - MARITIME</option>
        <option value="18">18 - CHER</option>
        <option value="19">19 - CORREZE</option>
        <option value="21">21 - COTE - D'OR</option>
        <option value="22">22 - COTES D'ARMOR</option>
        <option value="23">23 - CREUSE</option>
        <option value="24">24 - DORDOGNE</option>
        <option value="25">25 - DOUBS</option>
        <option value="26">26 - DROME</option>
        <option value="27">27 - EURE</option>
        <option value="28">28 - EURE - ET - LOIR</option>
        <option value="29">29 - FINISTERE</option>
        <option value="2A">2A - CORSE du SUD</option>
        <option value="2B">2B - HAUTE CORSE</option>
        <option value="30">30 - GARD</option>
        <option value="31">31 - HAUTE - GARONNE</option>
        <option value="32">32 - GERS</option>
        <option value="33">33 - GIRONDE</option>
        <option value="34">34 - HERAULT</option>
        <option value="35">35 - ILLE - ET - VILAINE</option>
        <option value="36">36 - INDRE</option>
        <option value="37">37 - INDRE - ET - LOIRE</option>
        <option value="38">38 - ISERE</option>
        <option value="39">39 - JURA</option>
        <option value="40">40 - LANDES</option>
        <option value="41">41 - LOIR - ET - CHER</option>
        <option value="42">42 - LOIRE</option>
        <option value="43">43 - HAUTE - LOIRE</option>
        <option value="44">44 - LOIRE - ATLANTIQUE</option>
        <option value="45">45 - LOIRET</option>
        <option value="46">46 - LOT</option>
        <option value="47">47 - LOT - ET - GARONNE</option>
        <option value="48">48 - LOZERE</option>
        <option value="49">49 - MAINE et LOIRE</option>
        <option value="50">50 - MANCHE</option>
        <option value="51">51 - MARNE</option>
        <option value="52">52 - HAUTE - MARNE</option>
        <option value="53">53 - MAYENNE</option>
        <option value="54">54 - MEURTHE - ET - MOSELLE</option>
        <option value="55">55 - MEUSE</option>
        <option value="56">56 - MORBIHAN</option>
        <option value="57">57 - MOSELLE</option>
        <option value="58">58 - NIEVRE</option>
        <option value="59">59 - NORD</option>
        <option value="60">60 - OISE</option>
        <option value="61">61 - ORNE</option>
        <option value="62">62 - PAS - DE - CALAIS</option>
        <option value="63">63 - PUY - DE - DOME</option>
        <option value="64">64 - PYRENNES - ATLANTIQUES</option>
        <option value="65">65 - HAUTES - PYRENNES</option>
        <option value="66">66 - PYRENNES - ORIENTALES</option>
        <option value="67">67 - BAS - RHIN</option>
        <option value="68">68 - HAUT - RHIN</option>
        <option value="69">69 - RHONE</option>
        <option value="70">70 - HAUTE - SAONE</option>
        <option value="71">71 - SAONE - ET - LOIRE</option>
        <option value="72">72 - SARTHE</option>
        <option value="73">73 - SAVOIE</option>
        <option value="74">74 - HAUTE - SAVOIE</option>
        <option value="75">75 - PARIS</option>
        <option value="76">76 - SEINE - MARITIME</option>
        <option value="77">77 - SEINE - ET - MARNE</option>
        <option value="78">78 - YVELINES</option>
        <option value="79">79 - DEUX SEVRES</option>
        <option value="80">80 - SOMME</option>
        <option value="81">81 - TARN</option>
        <option value="82">82 - TARN - ET - GARONNE</option>
        <option value="83">83 - VAR</option>
        <option value="84">84 - VAUCLUSE</option>
        <option value="85">85 - VENDEE</option>
        <option value="86">86 - VIENNE</option>
        <option value="87">87 - HAUTE - VIENNE</option>
        <option value="88">88 - VOSGES</option>
        <option value="89">89 - YONNE</option>
        <option value="90">90 - TERRITOIRE DE BELFORT</option>
        <option value="91">91 - ESSONNE</option>
        <option value="92">92 - HAUTS - DE - SEINE</option>
        <option value="93">93 - SEINE - SAINT - DENIS</option>
        <option value="94">94 - VAL - DE - MARNE</option>
        <option value="95">95 - VAL - D'OISE</option>
        <option value="971">971 - GUADELOUPE</option>
        <option value="972">972 - MARTINIQUE</option>
        <option value="973">973 - GUYANE</option>
        <option value="974">974 - REUNION</option>
        <option value="975">975 - ST PIERRE et MIQUELON</option>
        <option value="984">984 - TERRES AUSTRALES ANTARCTIQUES</option>
        <option value="985">985 - MAYOTTE</option>
        <option value="986">986 - WALLIS ET FUTUNA</option>
        <option value="987">987 - POLYNESIE FRANçAISE</option>
        <option value="988">988 - NOUVELLE - CALEDONIE</option>
        <option value="995">995 - EXPATRIES ZONE 1</option>
        <option value="996">996 - EXPATRIES ZONE 2</option>
        <option value="997">997 - EXPATRIES ZONE 3</option>
        <option value="998">998 - EXPATRIES ZONE 4</option>
        <option value="999">999 - ETRANGERS EN FRANCE</option>
        </select>
      
      	<h2>
          Représentant du groupe
      </h2>
   <label for="name">Nom :</label>
        <input type="text" id="name" name="name" placeholder="Nom"  value={$value.name|escape|default:''}>
        <span> {$messages.name|escape|default:''}</span>
      
      	<label for="firstname">Prénom :</label>
        <input type="text" id="prenom" name="prenom" placeholder="Prenom"  value={$value.prenom|escape|default:''}>
        <span> {$messages.prenom|escape|default:''}</span>
      
       	<label for="adr">Adresse :</label>
        <input type="text" id="adresse" name="adresse" placeholder="Adresse"  value={$value.adresse|escape|default:''}>
        <span> {$messages.adresse|escape|default:''}</span> 
      
      <label for="code">Code Postal :</label>
      <input type="number" id="code" name="code" pattern="[0-9]{5}" placeholder="Codepostal" value= {$value.code|escape|default:''}>
      <span> {$messages.code|escape|default:''}</span> 

        <label for="stacked-email">Email :</label>
        <input type="email" id="mail" name="mail" placeholder="Email"  value={$value.mail|escape|default:''}>
        <span> {$messages.mail|escape|default:''}</span>

      <label for="phone">téléphone:</label>
	  <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" placeholder="Telephone"value={$value.phone|escape|default:''} required>
      <span> {$messages.phone|escape|default:''}</span>
      
      
      <label for="style">Style musical :</label>
      <input type="text" id="style" name="style"  placeholder="StyleMusical" value= {$value.style|escape|default:''}>
      <span> {$messages.style|escape|default:''}</span>
      
      
      <label for="annee">Année de création :</label>
      <input type="number" id="annee" name="annee"  placeholder="AnneeCreation"  min="1800" max="2021" value= {$value.annee|escape|default:''}>
      <span> {$messages.annee|escape|default:''}</span>
      
      
      <label for="presentation">Presentation :</label>
      <textarea   rows="5" cols="33"  ></textarea>
      <input type="text" id="presentation" name="presentation" placeholder="Maximum 5OO caractères" 
      maxlength="500" size="10" value= {$value.presentation|escape|default:''}>
	   <span> {$messages.presentation|escape|default:''}</span>
      
      <label for="exprience">Expériences scéniques :</label>
      <textarea   rows="5" cols="33"  ></textarea>
      <input type="text" id="experience" name="experience" placeholder="Maximum 5OO          caractères" 
      maxlength="500" size="10" value= {$value.experience|escape|default:''}>
	  <span> {$messages.experience|escape|default:''}</span>
      
      <label for="url">Site web ou page facebook :</label>
	  <input type="url" name="urlsite" id="urlsite"
       placeholder="https://groupedemusique.com"
       pattern="https://.*" size="15" value={$value.urlsite|escape|default:''}
       required >
      <span> {$messages.urlsite|escape|default:''}</span>
      
      <label for="url">Adresse page soundcloud (facultatif)</label>
	  <input type="url" name="urlsoundcloud" id="urlsoundcloud"
       placeholder="https://soundcloud.com"
       pattern="https://.*" size="15" value={$value.urlsoundcloud|escape|default:''}
       required >
  	   <span> {$messages.urlsoundcloud|escape|default:''}</span>
       
      
      <label for="url">Adresse page youtube (facultatif)</label>
	  <input type="url" name="urlyoutube" id="urlyoutube"
       placeholder="https://youtube.com"
       pattern="https://.*" size="15" value={$value.urlyoutube|escape|default:''}
       required >
  	   <span> {$messages.urlyoutube|escape|default:''}</span>
      
      <label for="url">Membres du groupe(1 à 8)</label>
      
      
      <p>Statut assiociatif :</p>

      <div>
        <input type="checkbox" id="is_assoc" name="is_assoc"
               checked>
        <label for="is_assoc">oui</label>
      </div>

      <div>
        <input type="checkbox" id="isnot_assoc" name="isnot_assoc">
        <label for="isnot_assoc">non</label>
      </div>
      
      
      <p>Inscrit à la SACEM :</p>

      <div>
        <input type="checkbox" id="is_sacem" name="is_sacem"
               checked>
        <label for="is_sacem">oui</label>
      </div>

      <div>
        <input type="checkbox" id="isnot_sacem" name="isnot_sacem">
        <label for="isnot_sacem">non</label>
      </div>
      
      
        <p>Producteur :</p>

      <div>
        <input type="checkbox" id="is_prod" name="is_prod"
               checked>
        <label for="is_prod">oui</label>
      </div>

      <div>
        <input type="checkbox" id="isnot_prod" name="isnot_prod">
        <label for="isnot_prod">non</label>
      </div>
      
     

      <label for="mp3">3 fichiers mp3</label>
	  <input type="file"id="mp3" name="mp3" accept=".mp3" multiple>
     
      <label for="dossierpdf">Un dossier de presse PDF (facultatif)</label>
	  <input type="file"id="dossierpdf" name="dossierpdf" accept=".pdf">
      
      <label for="photo"> 2 photos de groupe ( moins de 300 dpi)</label>
      <input type="file"id="photo" name="photo" accept=".jpg, .jpeg, .png" multiple>
      
      <label for="techniquepdf">Une fiche technique PDF</label>
	  <input type="file"id="techniquepdf" name="techniquepdf" accept=".pdf">
      
      <label for="sacempdf">Un document SACEM PDF</label>
	  <input type="file"id="sacempdf" name="sacempdf" accept=".pdf">
 

  	    <button type="submit" class="pure-button pure-button-primary">Sign in</button>
    </fieldset>
</form>
</div>
{/block}