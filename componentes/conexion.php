<?php
class ConexionDB {
    private $host = "localhost";
    private $usuario = "root";
    private $clave = "";
    private $base = "tiendatech";
    public $conexion;

    public function __construct() {
        $this->conexion = new mysqli($this->host, $this->usuario, $this->clave, $this->base);
        if ($this->conexion->connect_error) {
            die("❌ Conexión fallida: " . $this->conexion->connect_error);
        }
    }

    public function __destruct() {
        $this->conexion->close();
    }
}
?>