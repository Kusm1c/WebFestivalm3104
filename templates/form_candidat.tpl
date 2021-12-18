{extends file='layout.tpl'}
{block name=title}Formulaire de Candidature{/block}
{block name=body}
  <div class="container">
    <br>
    <h1>Formulaire de candidature</h1><br>
    <form action="formulaire" method="post">

      <br>
      <h3>Groupe</h3>

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
          </select>
        </div>
      </div>

      <br>
      <h3>Représentant du groupe</h2>

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

        <br>
        <h3>Informations sur le groupe</h2>

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
                placeholder="https://soundcloud.com/..." pattern="https://.*"
                value={$value.urlsoundcloud|escape|default:''}>
              <span> {$messages.urlsoundcloud|escape|default:''}</span>
              <small id="aideSoundcloud" class="text-muted">Facultatif.</small>
            </div>

            <div class="group col-md-4"><br>
              <label for="urlyoutube">Adresse de page youtube :</label>
              <input class="form-control" type="url" name="urlyoutube" id="urlyoutube"
                placeholder="https://youtube.com/..." pattern="https://.*" size="15"
                value={$value.urlyoutube|escape|default:''}>
              <small id="aideYt" class="text-muted">Facultatif.</small>
              <span> {$messages.urlyoutube|escape|default:''}</span>
            </div>
          </div>

          <br>
          <div class="row">
            <h4>Membres du groupe :</h4>
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


            <h4> 3 Fichiers mp3 </h4>
            <label for="mp3_1">Premier fichier mp3</label>
            <input type="file" id="mp3_1" name="mp3_1" accept=".mp3">
            <span> {$messages.mp3_1|escape|default:''}</span>

            <label for="mp3_2">Deuxième fichier mp3</label>
            <input type="file" id="mp3_2" name="mp3_2" accept=".mp3">
            <span> {$messages.mp3_2|escape|default:''}</span>

            <label for="mp3_3">Troisième fichier mp3</label>
            <input type="file" id="mp3_3" name="mp3_3" accept=".mp3">
            <span> {$messages.mp3_3|escape|default:''}</span>

            <label for="dossierpdf">Un dossier de presse PDF (facultatif)</label>
            <input type="file" id="dossierpdf" name="dossierpdf" accept=".pdf">
            <span> {$messages.dossierpdf|escape|default:''}</span>

            <h4> 2 photos de groupe (moins de 300 dpi) </h4>
            <label for="photo"> photo 1</label>
            <input type="file" id="photo_1" name="photo" accept=".jpg, .jpeg, .png">
            <span> {$messages.photo_1|escape|default:''}</span>

            <label for="photo"> photo 2</label>
            <input type="file" id="photo_2" name="photo" accept=".jpg, .jpeg, .png">
            <span> {$messages.photo_2|escape|default:''}</span>

            <label for="techniquepdf">Une fiche technique PDF</label>
            <input type="file" id="techniquepdf" name="techniquepdf" accept=".pdf">
            <span> {$messages.technique|escape|default:''}</span>

            <label for="sacempdf">Un document SACEM PDF</label>
            <input type="file" id="sacempdf" name="sacempdf" accept=".pdf">
            <span> {$messages.sacempdf|escape|default:''}</span>

            <div>
              <label for="scene :">Sélectionnez votre scène :</label>
              <select name="scene" id="scene">
                <option value="Tribute">Tribute</option>
                <option value="Acoustique">Acoustique</option>
                <option value="Amplifié/Rock">Amplifié/Rock</option>
              </select>
              <span> {$messages.scene|escape|default:''}</span>
            </div>

            <button type="submit" class="" btn btn-primary">Sign in</button>
    </form>
  </div>

{/block}