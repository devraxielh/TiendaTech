<?php
require_once 'conexion.php';
$db = new ConexionDB();
$sql = "SELECT * FROM productos where id = ".$_GET['id'];
$resultado = $db->conexion->query($sql);
$productos = [];
if ($resultado->num_rows > 0) {
    while($fila = $resultado->fetch_assoc()) {
        $productos[] = $fila;
    }
}
$sql_detalle = "SELECT * FROM detalle_productos where producto_id = ".$_GET['id'];
$resultado_detalle = $db->conexion->query($sql_detalle);
$detalle = [];
if ($resultado_detalle->num_rows > 0) {
    while($fila = $resultado_detalle->fetch_assoc()) {
        $detalle[] = $fila;
    }
}
$sql_galeria = "SELECT * FROM galeria_producto where producto_id = ".$_GET['id'];
$resultado_galeria = $db->conexion->query($sql_galeria);
$galeria = [];
if ($resultado_galeria->num_rows > 0) {
    while($fila = $resultado_galeria->fetch_assoc()) {
        $galeria[] = $fila;
    }
}
$sql_comen = "SELECT * FROM comentarios where producto_id = ".$_GET['id']." order by fecha desc";
$resultado_comen = $db->conexion->query($sql_comen);
$comen = [];
if ($resultado_comen->num_rows > 0) {
    while($fila = $resultado_comen->fetch_assoc()) {
        $comen[] = $fila;
    }
}
if ($_GET['p']){
    $sql = "UPDATE comentarios SET valoracion = valoracion + 1 WHERE id = ".$_GET['p'];
    $resultado = $db->conexion->query($sql);
    header('Location: detalle.php?tema='.$_GET['tema'].'&id='.$_GET['id'].'#comentarios');
}
if ($_GET['m']){
    $sql = "UPDATE comentarios SET valoracion = valoracion - 1 WHERE id = ".$_GET['m'];
    $resultado = $db->conexion->query($sql);
    header('Location: detalle.php?tema='.$_GET['tema'].'&id='.$_GET['id'].'#comentarios');
}
?>
<div class="container" style="margin-top: 20px;" id="listadoProductos">
<div class="row">
<h1><?= $productos[0]["titulo"] ?></h1>
<p><?= $productos[0]["descripcion"] ?></p>
</div>
<div class="row">
    <div class="col-5">
    <?php foreach ($detalle as $d): ?>
        <h4><div class="badge text-bg-secondary"> <?= $d['label'].':'.$d['value'] ?></div></h4>
    <?php endforeach?>
    <form action="detalle.php?tema=<?= $_GET['tema'] ?>&id=<?= $_GET['id'] ?>" method="POST">
        <label class="form-label">Escribe tu comentario</label>
        <textarea class="form-control" name="comentario" required rows="3" placeholder="Escribir comentario aqui"></textarea>
        <input type="submit" class="btn btn-outline-success" value="Comentar" style="margin-top:10px;margin-bottom: 10px;"></input>
    </form>
    <?php
        if ($_POST){
            $insertar_sql = "INSERT INTO comentarios (producto_id,texto) VALUES (".$_GET['id'].", '".$_POST['comentario']."')";
            $resultado_insertar = $db->conexion->query($insertar_sql);
            header('Location: detalle.php?tema='.$_GET['tema'].'&id='.$_GET['id'].'#comentarios');
        }
    ?>
    <div id="comentarios">
    <?php foreach ($comen as $c): ?>
        <div class="alert alert-secondary" role="alert" style="text-align: right; position: relative;">
        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
        <?= $c['valoracion'] ?>
        </span>
        <span class="position-absolute top-0 start-0 badge rounded-pill bg-warning">
        <?= $c['fecha'] ?>
        </span>
        <?= $c['texto'] ?>
        <div style="font-size: 20px;">
            <a href="detalle.php?tema=<?= $_GET['tema'] ?>&id=<?= $_GET['id'] ?>&p=<?= $c['id'] ?>#comentarios">
                <span class="badge text-bg-success">+</span>
            </a>
            <a href="detalle.php?tema=<?= $_GET['tema'] ?>&id=<?= $_GET['id'] ?>&m=<?= $c['id'] ?>#comentarios">
                <span class="badge text-bg-danger">-</span>
            </a>
        </div>
        </div>
    <?php endforeach?>
    </div>
    </div>
    <div class="col-7">
    <div id="carouselExample" class="carousel slide">
        <div class="carousel-inner">
            <?php $x=0; foreach ($galeria as $g): ?>
                <?php
                    $x=$x+1;
                    if ($x==1){
                        $active = 'active';
                    }else{
                        $active = '';
                    }
                ?>
                <div class="carousel-item <?= $active ?>">
                    <img src="<?= $g['url'] ?>" class="d-block w-100" alt="">
                </div>
            <?php endforeach?>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    </div>
</div>
</div>