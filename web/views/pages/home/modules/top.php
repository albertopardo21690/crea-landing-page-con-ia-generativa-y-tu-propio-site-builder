<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom px-3">
	
	<?php if (!isset($_SESSION["admin"])): ?>

		<a href="/login" class="btn btn-sm btn-outline-secondary mb-2">Crear Página</a>

	<?php else: ?>

		<button type="button" class="btn btn-sm btn-outline-secondary mb-2" data-bs-toggle="modal" data-bs-target="#myLanding">Crear Página</button>
		
	<?php endif ?>

</div>