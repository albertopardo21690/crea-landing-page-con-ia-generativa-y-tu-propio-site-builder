<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-0 border-bottom sticky-top bg-white px-2" style="top:48px">

	<div>

		<div class="form-check form-switch btn btn-sm btn-outline-secondary mb-2 px-3 me-2">
			<input 
			class="form-check-input ms-0 me-2" 
			type="checkbox" 
			id="gridSwitch" 
			<?php if (isset($_GET["grid"]) && $_GET["grid"] == "active"): ?>
			value="yes" 
			checked
			<?php else: ?>	
			value="no" 
			<?php endif ?>	
			redirect="<?php echo $code->url_landing ?>">
			<label class="form-check-label" for="gridSwitch">GRID SYSTEM</label>
		</div>

		<?php if (isset($_GET["grid"]) && $_GET["grid"] == "active"): ?>

			<button type="button" class="btn btn-sm btn-outline-secondary mb-2 px-3 me-2 showTemplate" style="display: none;">	
				<i class="fas fa-image"></i> Ver Plantilla
			</button>

			<button type="button" class="btn btn-sm btn-outline-secondary mb-2 px-3 me-2 showCode">	
				<i class="fas fa-code"></i> Ver Código
			</button>

			<button type="button" class="btn btn-sm btn-outline-secondary mb-2 px-3 me-2 deleteModules">	
				<i class="fas fa-trash-alt"></i> Borrar
			</button>

		<?php else: ?>
			
			<div class="btn-group me-2">
				<button type="button" class="btn btn-sm btn-outline-secondary mb-2 px-3 changeCode" mode="HTML">
					<i class="fab fa-html5"></i> HTML
				</button>
				<button type="button" class="btn btn-sm btn-outline-secondary mb-2 px-3 changeCode" mode="CSS">
					<i class="fab fa-css3-alt"></i> CSS
				</button>
				<button type="button" class="btn btn-sm btn-outline-secondary mb-2 px-3 changeCode" mode="JS">
					<i class="fab fa-js"></i> JAVASCRIPT
				</button>

			</div>

			<?php if (isset($_SESSION["admin"])): ?>	
			
				<button type="button" class="btn btn-sm btn-outline-secondary mb-2 border-0 saveLanding">
					<i class="fas fa-save"></i> Autoguardado <i class="fas fa-check"></i>
				</button>

			<?php endif ?>

		<?php endif ?>

	</div>
		
	<div class="btn-toolbar mb-2 mb-md-0">


		<?php if (isset($_GET["grid"]) && $_GET["grid"] == "active"): ?>

			<div class="btn-group me-2">
				
				<?php if (isset($_SESSION["admin"])): ?>	
					<button type="button" class="btn btn-sm btn-outline-secondary mb-2 saveGrid" <?php if (isset($_GET["name"])): ?> name="<?php echo $_GET["name"] ?>" <?php else: ?> name="0" <?php endif ?> urlLanding="<?php echo $code->url_landing ?>">
						<i class="fas fa-save me-1"></i> Guardar Grid
					</button>
				<?php endif ?>
				
				<button type="button" class="btn btn-sm btn-outline-secondary mb-2" data-bs-toggle="offcanvas" data-bs-target="#sidebar-right">
					<i class="fas fa-th me-1" ></i> Mis Grid System
				</button>
			</div>

		<?php else: ?>

			<a href="/" class="btn btn-sm btn-outline-secondary mb-2 me-2">
				<span data-feather="arrow-left"></span>
				Regresar
			</a>

			<div class="btn-group me-2">

				<?php if (isset($_SESSION["admin"])): ?>	

					<button type="button" class="btn btn-sm btn-outline-secondary mb-2" data-bs-toggle="modal" data-bs-target="#myLanding">
						<i class="fas fa-tools"></i>
						Configuración
					</button>

				<?php endif ?>

				<?php if ($code->domain_landing == null): ?>

					<a href="/<?php echo $code->url_landing ?>" target="_blank" class="btn btn-sm btn-outline-secondary mb-2">
						<span data-feather="maximize"></span>
						Previsualizar
					</a>

				<?php else: ?>

					<a href="<?php echo $code->domain_landing ?>" target="_blank" class="btn btn-sm btn-outline-secondary mb-2">
						<span data-feather="maximize"></span>
						Previsualizar
					</a>
					
				<?php endif ?>

				
			</div>

			<?php if (isset($_SESSION["admin"])): ?>

				<button type="button" class="btn btn-sm btn-outline-secondary mb-2 deleteLanding" idLanding="<?php echo $code->id_landing ?>">
					<i class="fas fa-trash-alt"></i>
					Eliminar
				</button>

			<?php endif ?>

		<?php endif ?>

	</div>

</div>