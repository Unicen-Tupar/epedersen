{include file="header.tpl"}
<div class="row">
  <div class="col-md">
    <nav class="nav ">
      <a class="nav-link" href="perifericos">Perifericos</a>
      <a class="nav-link" href="categorias">Categorias</a>
      {if $permiso == "administrador"}
      <a class="nav-link" href="permisos">Permisos</a>
      <a class="nav-link" href="logout">Logout</a>
      {elseif $permiso == "usuario"}
      <a class="nav-link" href="logout">Logout</a>
      {else}
      <a class="nav-link" href="login">Login</a>
      {/if}
    </nav>
  </div>
</div>
<div class="card">
  <div class="card-body">
    <h1 class="card-title">Lista de Perifericos</h1>
    <ul class="list-group">
      {foreach from=$perifericos item=periferico}
      <li class="list-group-item">
        <div class="card-body">
        {if $permiso == "administrador"}
        <a href="borrarPeriferico/{$periferico['id']}" class="card-link"><button type="button" class="btn btn-primary btn-lg">Borrar</button></a>
        {/if}
        <a href="detalle/{$periferico['id']}" class="card-link">{$periferico['titulo']}</a>
        {foreach from=$tipo item=type}
          {if $type['id'] == $periferico['id_tipo']}
            <p class="card-text">Tipo: {$type['nombre']}</p>
          {/if}
        {/foreach}
        </div>
      </li>
      {/foreach}
    </ul>
    {if $permiso == "administrador"}
    <a href="crearPeriferico" class="btn btn-primary">Crear Periferico</a>
    {/if}
  </div>
</div>
{include file="footer.tpl"}
