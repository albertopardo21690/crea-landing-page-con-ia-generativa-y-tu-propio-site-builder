<?php 

  $url = "landings?select=title_landing,url_landing,img_landing,id_landing,domain_landing&orderBy=id_landing&orderMode=DESC";
  $method = "GET";
  $fields = array();

  $landings = CurlController::request($url,$method,$fields);

  if($landings->status == 200){

    $landings = $landings->results;

  }else{

    $landings = array();
  }

 ?>


<!-- Offcanvas Sidebar -->
<div class="offcanvas offcanvas-start" id="sidebar-left">

  <div class="offcanvas-body">

    <ul class="list-group list-group-flush">

      <?php foreach ($landings as $key => $value): ?>

        <li class="list-group-item list-group-item-action border-bottom py-3">
            
            <div class="d-flex w-100 align-items-center justify-content-between">
              
              <strong class="mb-1"><?php echo $value->title_landing ?></strong>
               <small>
                <a href="/code/<?php echo $value->url_landing ?>">
                  <span data-feather="edit"></span>
                </a>
              </small>

            </div>

            <div class="col-10 mb-1 small">
              
              <?php if ($value->domain_landing == null): ?>

                 <a href="/<?php echo $value->url_landing ?>" target="_blank"><?php echo $value->url_landing ?></a>

              <?php else: ?>

                <a href="<?php echo $value->domain_landing ?>" target="_blank"><?php echo $value->domain_landing ?></a>

              <?php endif ?>
             
            
            </div>

        </li>
        
      <?php endforeach ?>
    
    </ul>

  </div>
</div>