{extends file='layout.tpl'}
{block name=title}Formulaire de candidature{/block}
{block name=body}


  <div class="container">
    <div class="row">
      <div class="text-center">
        <h1><br>Formulaire de candidature<br></h1>
      </div>
    </div>

    <form action="formulaire" method="post" enctype="multipart/form-data">
      <h3><br>Groupe<br></h3>
      <div class="row">
        <div class="group col-md-6">
          <br><label for="nomgrp">Nom du groupe</label>
          <input class="form-control" type="text" id="nomgrp" name="nomgrp" placeholder="Nom du groupe"
            value={$value.nomgrp|escape|default:''}>
          <span> {$messages.nomgrp|escape|default:''}</span>
        </div>

        <div class="group col-md-3"><br>
          <label for="scene :">Type de scène :</label>
          <select class="form-control" name="scene" id="scene">
            <option value="rien" selected>--------------------</option>
            <option value="Tribute">Tribute</option>
            <option value="Acoustique">Acoustique</option>
            <option value="Amplifié/Rock">Amplifié/Rock</option>
          </select>
          <span> {$messages.scene|escape|default:''}</span>
        </div>

        <div class="group col-md-3"><br>
          <label for="dpt">Département :</label>
          <select class="form-control" name="dpt" id="dpt">
            <option value="rien" selected>--------------------</option>
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
      </div>
    </div>


    <h3><br>Représentant du groupe<br></h3>
    <div class="row">
      <div class="group col-md-6">
        <label for="name">Nom :</label>
        <input class="form-control" id="name" type="text" id="name" name="name" placeholder="Nom"
          value={$value.name|escape|default:''}>
        <span> {$messages.name|escape|default:''}</span>
      </div>

      <div class="group col-md-6">
        <label for="prenom">Prénom :</label>
        <input class="form-control" type="text" id="prenom" name="prenom" placeholder="Prénom"
          value={$value.prenom|escape|default:''}>
        <span> {$messages.prenom|escape|default:''}</span>
      </div>
    </div>


    <div class="row">
      <div class="group col-md-6"><br>
        <label for="adresse">Adresse :</label>
        <input class="form-control" type="text" id="adresse" name="adresse" placeholder="Adresse"
          value={$value.adresse|escape|default:''}>
        <span> {$messages.adresse|escape|default:''}</span>
      </div>

      <div class="group col-md-6"><br>
        <label for="code">Code Postal :</label>
        <input class="form-control" type="number" id="code" name="code" pattern="[0-9]{5}" placeholder="80000"
          value={$value.code|escape|default:''}>
        <span> {$messages.code|escape|default:''}</span>
      </div>
    </div>


    <div class="row">
      <div class="group col-md-6"><br>
        <label for="stacked-email">Email :</label>
        <input class="form-control" type="email" id="mail" name="mail" placeholder="Email"
          value={$value.mail|escape|default:''}>
        <span> {$messages.mail|escape|default:''}</span>
      </div>

      <div class="group col-md-6"><br>
        <label for="phone">Téléphone :</label>
        <input class="form-control" type="tel" id="phone" name="phone" pattern="[0-9]{10}" placeholder="0601020304"
          requiredvalue={$value.phone|escape|default:''}>
        <span> {$messages.phone|escape|default:''}</span>
      </div>
    </div>


    <h3><br>Informations sur le groupe<br></h3>
    <div class="row">
      <div class="group col-md-6"><br>
        <label for="style">Style musical :</label>
        <input class="form-control" type="text" id="style" name="style" placeholder="Classique, Rock..."
          value={$value.style|escape|default:''}>
        <span> {$messages.style|escape|default:''}</span>
      </div>

      <div class="group col-md-6"><br>
        <label for="annee">Année de création :</label>
        <input class="form-control" type="number" id="annee" name="annee" placeholder="Année" min="1800" max="2021"
          value={$value.annee|escape|default:''}>
        <span> {$messages.annee|escape|default:''}</span>
      </div>
    </div>


    <div class="row">
      <div class="group col-md-6"><br>
        <label for="presentation">Présentation :</label>
        <textarea class="form-control" type="text" id="presentation" name="presentation" maxlength="500"
          value={$value.presentation|escape|default:''}></textarea>
        <small id="aidepresentation" class="text-muted">500 caractères maximum.</small>
        <span> {$messages.presentation|escape|default:''}</span>
      </div>

      <div class="group col-md-6"><br>
        <label for="experience">Expériences scéniques :</label>
        <textarea class="form-control" type="text" id="experience" name="experience" maxlength="500"
          value={$value.experience|escape|default:''}></textarea>
        <small id="aideScene" class="text-muted">500 caractères maximum.</small>
        <span> {$messages.experience|escape|default:''}</span>
      </div>
    </div>


    <div class="row">
      <div class="group col-md-4"><br>
        <label for="urlsite">Site web ou page Facebook :</label>
        <input class="form-control" type="url" name="urlsite" id="urlsite" placeholder="https://..."
          pattern="https://.*" value={$value.urlsite|escape|default:''}>
        <span> {$messages.urlsite|escape|default:''}</span>
      </div>

      <div class="group col-md-4"><br>
        <label for="urlsoundcloud">Adresse de page soundcloud :</label>
        <input class="form-control" type="url" name="urlsoundcloud" id="urlsoundcloud"
          placeholder="https://soundcloud.com/..." pattern="https://.*" value={$value.urlsoundcloud|escape|default:''}>
        <span> {$messages.urlsoundcloud|escape|default:''}</span>
        <small id="aideSoundcloud" class="text-muted">Facultatif.</small>
      </div>

      <div class="group col-md-4"><br>
        <label for="urlyoutube">Adresse de page youtube :</label>
        <input class="form-control" type="url" name="urlyoutube" id="urlyoutube" placeholder="https://youtube.com/..."
          pattern="https://.*" size="15" value={$value.urlyoutube|escape|default:''}>
        <small id="aideYt" class="text-muted">Facultatif.</small>
        <span> {$messages.urlyoutube|escape|default:''}</span>
      </div>
    </div>


    <div class="row">
      <div class="group col-md-4"><br>
        <label for="assoc">Statut associatif :</label><br>
        <div class="form-check">
          <input class="form" type="radio" id="is_assoc" name="assoc" value="is_assoc">
          <label for="is_assoc">oui</label>
        </div>
        <div class="form-check">
          <input class="form" type="radio" id="isnot_assoc" name="assoc" value="isnot_assoc">
          <label for="isnot_assoc">non</label>
        </div>
      </div>

      <div class="group col-md-4"><br>
        <label for="sacem">Inscrit à la SACEM :</label><br>
        <div class="form-check">
          <input class="form" type="radio" id="is_sacem" name="sacem" value="is_sacem">
          <label for="is_sacem">oui</label>
        </div>
        <div class="form-check">
          <input type="radio" id="isnot_sacem" name="sacem" value="isnot_sacem">
          <label for="isnot_sacem">non</label>
        </div>
      </div>

      <div class="group col-md-4"><br>
        <label for="prod">Producteur :</label><br>
        <div class="form-check">
          <input class="form" type="radio" id="is_prod" name="prod" value="is_prod">
          <label for="is_prod">oui</label>
        </div>
        <div class="form-check">
          <input type="radio" id="isnot_prod" name="prod" value="isnot_prod">
          <label for="isnot_prod">non</label>
        </div>
      </div>
    </div>


    <h3><br>Membres du groupe</h3>
    <div class="row">
      <small id="aideMembres" class="text-muted">Au moins un membre requis.</small>
      <div class="group col-md-3"><br>
        <label for="mbr1">Membre 1 :</label>

        <input class="form-control" type="text" id="mbr1" name="mbr1" placeholder=" Nom Prénom (instrument)"
          value={$value.mbr1|escape|default:''}>
        <span> {$messages.mbr1|escape|default:''}</span>
      </div>
      <div class="group col-md-3"><br>
        <label for="mbr2">Membre 2 :</label>
        <input class="form-control" type="text" id="mbr1" name="mbr1" placeholder=" Nom Prénom (instrument)"
          value={$value.mbr2|escape|default:''}>
        <span> {$messages.mbr2|escape|default:''}</span>
      </div>
      <div class="group col-md-3"><br>
        <label for="mbr3">Membre 3 :</label>
        <input class="form-control" type="text" id="mbr1" name="mbr1" placeholder=" Nom Prénom (instrument)"
          value={$value.mbr3|escape|default:''}>
        <span> {$messages.mbr3|escape|default:''}</span>
      </div>
      <div class="group col-md-3"><br>
        <label for="mbr4">Membre 4 :</label>
        <input class="form-control" type="text" id="mbr1" name="mbr1" placeholder=" Nom Prénom (instrument)"
          value={$value.mbr4|escape|default:''}>
        <span> {$messages.mbr4|escape|default:''}</span>
      </div>
    </div>


    <div class="row">
      <div class="group col-md-3"><br>
        <label for="mbr5">Membre 5 :</label>
        <input class="form-control" type="text" id="mbr1" name="mbr1" placeholder=" Nom Prénom (instrument)"
          value={$value.mbr5|escape|default:''}>
        <span> {$messages.mbr5|escape|default:''}</span>
      </div>
      <div class="group col-md-3"><br>
        <label for="mbr6">Membre 6 :</label>
        <input class="form-control" type="text" id="mbr1" name="mbr1" placeholder=" Nom Prénom (instrument)"
          value={$value.mbr6|escape|default:''}>
        <span> {$messages.mbr6|escape|default:''}</span>
      </div>
      <div class="group col-md-3"><br>
        <label for="mbr7">Membre 7 :</label>
        <input class="form-control" type="text" id="mbr1" name="mbr1" placeholder=" Nom Prénom (instrument)"
          value={$value.mbr7|escape|default:''}>
        <span> {$messages.mbr7|escape|default:''}</span>
      </div>
      <div class="group col-md-3"><br>
        <label for="mbr8">Membre 8 :</label>
        <input class="form-control" type="text" id="mbr1" name="mbr1" placeholder=" Nom Prénom (instrument)"
          value={$value.mbr8|escape|default:''}>
        <span> {$messages.mbr8|escape|default:''}</span>
      </div>


      <h3><br>Fichiers</h3>
      <div class="row">
        <div class="group col-md-4"><br>
          <label for="mp3_1">Premier fichier mp3</label>
          <input class="form-control" type="file" id="mp3_1" name="mp3_1" accept=".mp3">
          <span> {$messages.mp3_1|escape|default:''}</span>
        </div>

        <div class="group col-md-4"><br>
          <label for="mp3_2">Deuxième fichier mp3</label>
          <input class="form-control" type="file" id="mp3_2" name="mp3_2" accept=".mp3">
          <span> {$messages.mp3_2|escape|default:''}</span>
        </div>

        <div class="group col-md-4"><br>
          <label for="mp3_3">Troisième fichier mp3</label>
          <input class="form-control" type="file" id="mp3_3" name="mp3_3" accept=".mp3">
          <span> {$messages.mp3_3|escape|default:''}</span>
        </div>
      </div>


      <div class="row">
        <div class="group col-md-4"><br>
          <label for="dossierpdf">Dossier de presse PDF</label>
          <input class="form-control" type="file" id="dossierpdf" name="dossierpdf" accept=".pdf">
          <small id="aideYt" class="text-muted">Facultatif.</small>
          <span> {$messages.dossierpdf|escape|default:''}</span>
        </div>

        <div class="group col-md-4"><br>
          <label for="techniquepdf">Fiche technique PDF</label>
          <input class="form-control" type="file" id="techniquepdf" name="techniquepdf" accept=".pdf">
          <span> {$messages.techniquepdf|escape|default:''}</span>
        </div>

        <div class="group col-md-4"><br>
          <label for="sacempdf">Document SACEM PDF</label>
          <input class="form-control" type="file" id="sacempdf" name="sacempdf" accept=".pdf">
          <span> {$messages.sacempdf|escape|default:''}</span>
        </div>
      </div>


      <br>
      <div class="row">
        <div class="group col-md-6"><br>
          <label for="photo_1">Photo 1</label>
          <input class="form-control" type="file" id="photo_1" name="photo_1" accept=".jpg, .jpeg, .png">
          <span> {$messages.photo_1|escape|default:''}</span>
        </div>

        <div class="group col-md-6"><br>
          <label for="photo_2">Photo 2</label>
          <input class="form-control" type="file" id="photo_2" name="photo_2" accept=".jpg, .jpeg, .png">
          <span> {$messages.photo_2|escape|default:''}</span>
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