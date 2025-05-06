-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 06-05-2025 a las 16:43:38
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendatech`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `titulo`) VALUES
(1, 'Tarjetas de videos'),
(2, 'Monitores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `texto` text NOT NULL,
  `valoracion` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `producto_id`, `fecha`, `texto`, `valoracion`) VALUES
(5, 2, '2025-05-06 09:10:39', 'Hola mundo', 0),
(6, 2, '2025-05-06 09:11:13', 'lkjhlkh', 0),
(7, 2, '2025-05-06 09:12:04', 'hkjhk', 0),
(8, 2, '2025-05-06 09:12:08', 'kjhgjkhkj', 0),
(9, 2, '2025-05-06 09:13:30', 'kjhjkhk', 0),
(10, 2, '2025-05-06 09:13:34', 'kjhjk', 0),
(11, 2, '2025-05-06 09:15:41', 'jhgjh', 0),
(12, 3, '2025-05-06 09:16:43', 'kjhjk', 0),
(13, 3, '2025-05-06 09:17:25', 'kjhjk', 0),
(14, 2, '2025-05-06 09:22:13', 'ultimo comentario', 0),
(15, 2, '2025-05-06 09:22:29', 'uuuu', 0),
(16, 2, '2025-05-06 09:23:33', 'uuuu', 0),
(17, 2, '2025-05-06 09:23:43', 'uuuu', 0),
(18, 2, '2025-05-06 09:27:55', 'lkhkl ghljg jghkjf jkf jkgf ghkf dkfgjd fgsdfdh sdfg sjgdshjdkdk', 0),
(19, 2, '2025-05-06 09:28:02', 'jhgjyk gjkjhkghjk fkhf hgkf fkghf htd ghjd fgjd jghd kghf ljf ljf lj f', 0),
(20, 2, '2025-05-06 09:29:09', 'kjhjkh', 0),
(21, 2, '2025-05-06 09:29:13', 'kjhjk', 0),
(22, 2, '2025-05-06 09:31:17', 'jjj', 0),
(23, 2, '2025-05-06 09:31:22', 'ljlkj', 1),
(24, 2, '2025-05-06 09:31:25', 'k,lnjknkl', 0),
(25, 2, '2025-05-06 09:31:51', '.,nkl,', 4),
(26, 2, '2025-05-06 09:31:58', 'hola mundo', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_productos`
--

CREATE TABLE `detalle_productos` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_productos`
--

INSERT INTO `detalle_productos` (`id`, `producto_id`, `label`, `value`) VALUES
(1, 2, 'Precio', '400'),
(2, 2, 'Envio', 'No disponible'),
(3, 2, 'Disponible en tienda', 'Si'),
(4, 2, 'Stock', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria_producto`
--

CREATE TABLE `galeria_producto` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `galeria_producto`
--

INSERT INTO `galeria_producto` (`id`, `producto_id`, `url`) VALUES
(1, 2, 'https://images-cdn.ubuy.ae/642418354fdb2738c94b5913-new-geforce-rtx-4090-24gb-founders.jpg'),
(2, 2, 'https://i.blogs.es/59bfa7/nvidiageforcertx4090-ap/1366_2000.jpeg'),
(3, 2, 'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2022/10/analisis-nvidia-rtx-4090-founders-edition-2839429.jpg?tf=3840x'),
(4, 2, 'https://media.vandal.net/m/10-2022/202210108574933_1.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `titulo`, `url`) VALUES
(1, 'Home', 'http://localhost/tiendatech/pages/home.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `img` text NOT NULL,
  `categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `titulo`, `descripcion`, `img`, `categoria`) VALUES
(2, 'RTX 4090', 'NVIDIA® GeForce RTX® 4090 es la GPU GeForce definitiva. Brinda un gran salto en rendimiento, eficiencia y gráficos impulsados ​​​​por IA.', 'https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/ada/rtx-4090/geforce-ada-4090-web-og-1200x630.jpg', 1),
(3, 'RTX 5090', 'NVIDIA® GeForce RTX™ 5090 es la GPU GeForce más potente jamás fabricada y aporta funciones revolucionarias a jugadores y creadores.', 'https://www.zotac.com/download/files/styles/w1024/public/product_gallery/graphics_cards/zt-b50900b-10p-image01.jpg?itok=wVP3Bg6k', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_productos`
--
ALTER TABLE `detalle_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `galeria_producto`
--
ALTER TABLE `galeria_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `detalle_productos`
--
ALTER TABLE `detalle_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `galeria_producto`
--
ALTER TABLE `galeria_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
