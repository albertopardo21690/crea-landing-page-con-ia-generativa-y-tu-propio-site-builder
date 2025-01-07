<?php 

  $url = "grids?orderBy=date_updated_grid&orderMode=DESC";
  $method = "GET";
  $fields = array();

  $grids = CurlController::request($url,$method,$fields);

  if($grids->status == 200){

    $grids = $grids->results;

  }else{

    $grids = array();
  }

 ?>


<!-- Offcanvas Sidebar -->
<div class="offcanvas offcanvas-end" id="sidebar-right">

  <div class="offcanvas-body">

    <ul class="list-group list-group-flush">

      <?php if (!empty($grids) && isset($routesArray[1])): ?>

        <?php foreach ($grids as $key => $value): ?>

          <li class="list-group-item list-group-item-action py-3">
              
              <div class="d-flex w-100 align-items-center justify-content-between">
                
                <strong class="mb-1"><?php echo $value->name_grid ?></strong>
                 <small>
                  <a href="/code/<?php echo $routesArray[1] ?>?grid=active&name=<?php echo $value->name_grid ?>">
                    <span data-feather="edit"></span>
                  </a>

                  <?php if (isset($_SESSION["admin"])): ?>

                    <button type="button" class="ms-1 border-0 bg-transparent deleteGrid" nameGrid="<?php echo $value->name_grid ?>" urlLanding="<?php echo $routesArray[1] ?>">
                      <span data-feather="trash"></span>
                    </button>
                    
                  <?php endif ?>
                 
                </small>

              </div>

              <div class="col-10 mb-1 small">
                
               Última Actualización <?php echo $value->date_updated_grid ?>
              
              </div>

          </li>
          
        <?php endforeach ?>

    <?php endif ?>
    
    </ul>

  </div>
</div>