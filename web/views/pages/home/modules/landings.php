<div class="container-fluid">

  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4">

    <?php foreach ($landings as $key => $value): ?>

      <div class="col my-3">
        
        <a href="/code/<?php echo $value->url_landing ?>">

          <?php if ($value->img_landing != null): ?>
               <img src="/views/assets/img/landings/<?php echo $value->id_landing ?>/<?php echo $value->img_landing ?>" class="img-fluid rounded imgCover">
          <?php else: ?>
               <img src="/views/assets/img/placeholder-square.svg" class="img-fluid rounded">
          <?php endif ?>
         
        </a>

        <div class="text-center mt-3">
          
          <h6 class="font-weight-light">
            <a href="/code/<?php echo $value->url_landing ?>"><?php echo $value->title_landing ?> <small><span data-feather="edit"></span></small></a>
          </h6>
        </div>

      </div>

    
    <?php endforeach ?>
    
    
  </div>

</div>

<script>
  
  var imgCover = $(".imgCover");

  imgCover.each((i)=>{

    $(imgCover[i]).attr("style","width:"+$(imgCover[i]).width()+"px; height:"+$(imgCover[i]).width()+"px; object-fit: cover; object-position: 0px 0px; border: 2px dashed #6666; border-radius: 9px")

  })

</script>