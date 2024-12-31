<header class="navbar sticky-top bg-dark flex-md-nowrap p-0">
    
    <div class="navbar-brand col-md-2 me-0 px-3">

        <a href="/" class="text-white"><span data-feather="code"></span> Landing Page Builder</a>

        <span data-feather="menu" class="text-white ms-3 float-end mt-1" style="cursor:pointer;" data-bs-toggle="offcanvas" data-bs-target="#sidebar-left"></span>

    </div>

    <?php if(isset($_SESSION["admin"])) : ?>
        <div class="navbar-nav text-white me-3">
            <div class="nav-item text-nowrap">
                <a href="/logout" class="nav-link px-3 text-white">Cerrar sesión</a>
            </div>
        </div>
    <?php endif; ?>


</header>