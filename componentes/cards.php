<?php
require_once 'conexion.php';
$db = new ConexionDB();
if ($_POST['select_categoria']){
  $sql = "SELECT * FROM productos where categoria=".$_POST['select_categoria'];
  $resultado = $db->conexion->query($sql);
  $productos = [];
  if ($resultado->num_rows > 0) {
      while($fila = $resultado->fetch_assoc()) {
          $productos[] = $fila;
      }
  }
}
else{
  $sql = "SELECT * FROM productos";
  $resultado = $db->conexion->query($sql);
  $productos = [];
  if ($resultado->num_rows > 0) {
      while($fila = $resultado->fetch_assoc()) {
          $productos[] = $fila;
      }
  }
}
$sql_categorias = "SELECT * FROM categorias";
$categorias_r = $db->conexion->query($sql_categorias);
$categorias = [];
if ($categorias_r->num_rows > 0) {
    while($fila_c = $categorias_r->fetch_assoc()) {
        $categorias[] = $fila_c;
    }
}

?>
<div class="container" style="margin-top: 20px;" id="listadoProductos">
<form action="home.php?tema=<?= $_GET['tema'] ?>#listadoProductos" method="POST">
<div class="row">
  <div class="col-7">
  </div>
  <div class="col-4">
    <select class="form-select form-select-sm" aria-label="Small select example" name="select_categoria">
    <option selected>menu de categorias</option>
    <?php foreach ($categorias as $c): ?>
    <option value="<?= $c['id'] ?>"><?= $c['titulo'] ?></option>
    <?php endforeach?>
    </select>
  </div>
  <div class="col-1" style="margin-top: 16px;">
    <input type="submit" class="btn btn-warning" value="Buscar">
  </div>
</div>
</form>
<div class="row productos">
<?php if (!empty($productos)): ?>
<?php foreach ($productos as $p): ?>
<div class="col-4">
  <div class="card">
    <img src="<?= htmlspecialchars($p['img']) ?>" class="card-img-top" alt="..." height="250px">
    <div class="card-body">
      <p class="card-text"><?= htmlspecialchars($p['titulo']) ?></p>
      <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#<?= htmlspecialchars($p['id']) ?>">
        + Información
      </button>
    </div>
  </div>
</div>
<div class="modal fade" id="<?= htmlspecialchars($p['id']) ?>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel"><?= htmlspecialchars($p['titulo']) ?></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <?= htmlspecialchars($p['descripcion']) ?>
      </div>
    </div>
  </div>
</div>
<?php endforeach; ?>
<?php else: ?>
<div class="alert alert-danger" role="alert">
  No se encontraron productos.
</div>
<?php endif; ?>
</div>

</div>
</div>
</div>