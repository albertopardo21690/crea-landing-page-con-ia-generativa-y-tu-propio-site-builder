<!-- The Modal -->
<div class="modal fade" id="myLanding">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

    <form method="post" class="needs-validation" novalidate>

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Gestión de Landing</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">

        <?php if (!empty($code)): ?>

          <input type="hidden" name="idLanding" value="<?php echo $code->id_landing ?>">
          
        <?php endif ?>

        <!--===============================
        Título de la Landing
        =================================-->
        
        <div class="my-3">
          
          <label for="title_landing">Título de la página:</label>

          <input 
          type="text"
          class="form-control"
          id="title_landing"
          placeholder="Ingrese el título de la página" 
          name="title_landing"
          onchange="validateDataRepeat(event,'landing')"
          value="<?php if (!empty($code)): ?><?php echo $code->title_landing ?><?php endif ?>" 
          <?php if (!empty($code)): ?> readonly <?php endif ?>
          required 
          >

          <div class="valid-feedback">Válido.</div>
          <div class="invalid-feedback">Campo inválido.</div>

        </div>

        <!--===============================
        URL de la Landing
        =================================-->

        <div class="mb-3">
          
          <label for="url_landing">URL de la página:</label>

          <input 
          type="text"
          class="form-control"
          id="url_landing"
          placeholder="Ingrese la URL de la página" 
          name="url_landing"
          value="<?php if (!empty($code)): ?><?php echo $code->url_landing ?><?php endif ?>"
          readonly
          required 
          >

          <div class="valid-feedback">Válido.</div>
          <div class="invalid-feedback">Campo inválido.</div>

        </div>

        <!--===============================
        Dominio de la Landing
        =================================-->

        <?php if (!empty($code)): ?>
             
        <div class="my-3">
          
          <label for="domain_landing">Dominio de la página:</label>

          <input 
          type="text"
          class="form-control"
          id="domain_landing"
          placeholder="Ingrese el dominio de la página" 
          name="domain_landing"
          value="<?php if (!empty($code)): ?><?php echo $code->domain_landing ?><?php endif ?>" 
          required 
          >

          <div class="valid-feedback">Válido.</div>
          <div class="invalid-feedback">Campo inválido.</div>

        </div>

        <?php endif ?>

        <!--===============================
        PLUGINS de la Landing
        =================================-->

        <?php 

        if(!empty($code)){

          if($code->plugins_landing != "[]"){

            $plugins = json_decode($code->plugins_landing);


          }else{

            $plugins = array();
          
          }

          if (!empty($plugins)) {

            $val = '[';

            foreach ($plugins as $key => $value) {
              
              $val .= '"_'.$key.'",';
            }

            $val = substr($val,0,-1);
            
            $val .= ']';
            
            echo "<input type='hidden' id='pluginsList' name='pluginsList' value='".$val."'>";

          }else{

            echo "<input type='hidden' id='pluginsList' name='pluginsList' value='[".'"_0"'."]'>";

          }

        }else{

          echo "<input type='hidden' id='pluginsList' name='pluginsList' value='[".'"_0"'."]'>";

        }

        ?>

        <label for="plugins_landing_0">Plugins:</label>

        <div class="blockPlugins" <?php if (!empty($plugins)): ?> style="opacity: 0; height:0px" <?php endif ?>>

            <input 
            type="text"
            class="form-control itemsPlugins mb-3"
            id="plugins_landing_0"
            placeholder="Ingrese el plugin de la página" 
            name="plugins_landing_0"
            >

            <div class="valid-feedback">Válido.</div>
            <div class="invalid-feedback">Campo inválido.</div>

        </div>

        <?php if (!empty($code)): ?>

          <?php if (!empty($plugins)): ?>

            <?php foreach ($plugins as $key => $value): ?>

              <input 
              type="text"
              class="form-control itemsPlugins mb-3"
              id="plugins_landing_<?php echo $key ?>"
              placeholder="Ingrese el plugin de la página" 
              name="plugins_landing_<?php echo $key ?>"
              value="<?php echo htmlspecialchars(urldecode($value)) ?>"
              >

              <div class="valid-feedback">Válido.</div>
              <div class="invalid-feedback">Campo inválido.</div>
      
            <?php endforeach ?>

           <?php endif ?>

        <?php endif ?>

        <button type="button" class="btn btn-sm btn-outline-secondary mb-3 addPlugin">Agregar Plugin</button>

        <!--===============================
        Icono de la Landing
        =================================-->

        <div class="mb-3">
          
          <label for="icon_landing">Icono de la página:</label>

          <input 
          type="text"
          class="form-control"
          id="icon_landing"
          placeholder="Ingrese la URL del icono de la página" 
          name="icon_landing"
          value="<?php if (!empty($code)): ?><?php echo $code->icon_landing ?><?php endif ?>"
          required 
          >

          <div class="valid-feedback">Válido.</div>
          <div class="invalid-feedback">Campo inválido.</div>

        </div>

        <!--===============================
        Portada de la Landing
        =================================-->

        <div class="mb-3">
          
          <label for="cover_landing">Portada de la página:</label>

          <input 
          type="text"
          class="form-control"
          id="cover_landing"
          placeholder="Ingrese la URL del portada de la página" 
          name="cover_landing"
          value="<?php if (!empty($code)): ?><?php echo $code->cover_landing ?><?php endif ?>"
          required 
          >

          <div class="valid-feedback">Válido.</div>
          <div class="invalid-feedback">Campo inválido.</div>

        </div>

        <!--===============================
        Descripción de la Landing
        =================================-->

        <div class="mb-3">
          
          <label for="description_landing">Descripción de la página:</label>

          <input 
          type="text"
          class="form-control"
          id="description_landing"
          placeholder="Ingrese la descripción de la página" 
          name="description_landing"
          value="<?php if (!empty($code)): ?><?php echo $code->description_landing ?><?php endif ?>"
          required 
          >

          <div class="valid-feedback">Válido.</div>
          <div class="invalid-feedback">Campo inválido.</div>

        </div>

      </div>

      <?php 

      require_once "controllers/landings.controller.php";
      $manage = new LandingsController();
      $manage -> landingsManage();

      ?>

      <!-- Modal footer -->
      <div class="modal-footer d-flex justify-content-between">

        <div><button type="button" class="btn btn-default border" data-bs-dismiss="modal">Close</button></div>
        <div><button type="submit" class="btn btn-dark">Guardar</button></div>

      </div>

    </form>

    </div>
  </div>
</div>