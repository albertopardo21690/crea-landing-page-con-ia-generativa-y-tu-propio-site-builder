-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-01-2025 a las 22:18:52
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `builder`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

CREATE TABLE `admins` (
  `id_admin` int(11) NOT NULL,
  `email_admin` text DEFAULT NULL,
  `password_admin` text DEFAULT NULL,
  `token_admin` text DEFAULT NULL,
  `token_exp_admin` text DEFAULT NULL,
  `date_created_admin` date DEFAULT NULL,
  `date_updated_admin` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id_admin`, `email_admin`, `password_admin`, `token_admin`, `token_exp_admin`, `date_created_admin`, `date_updated_admin`) VALUES
(1, 'admin@builder.com', '$2a$07$azybxcags23425sdg23sdeanQZqjaf6Birm2NvcYTNtJw24CsO5uq', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MzYyNTE0MDEsImV4cCI6MTczNjMzNzgwMSwiZGF0YSI6eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBidWlsZGVyLmNvbSJ9fQ.c-MX1jtk0A3g8kZW0kNU3djjnBMQXtwtYYE2Z1fJsHE', '1736337801', '2024-06-20', '2025-01-07 12:03:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `name_category` text DEFAULT NULL,
  `date_created_catagory` date DEFAULT NULL,
  `date_updated_category` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id_category`, `name_category`, `date_created_catagory`, `date_updated_category`) VALUES
(1, 'Contenedores', '2025-01-06', '2025-01-06 16:42:11'),
(2, 'Columnas', '2025-01-06', '2025-01-06 18:29:15'),
(3, 'Flex', '2025-01-06', '2025-01-06 20:20:40'),
(4, 'Elementos', '2025-01-07', '2025-01-07 11:58:01'),
(5, 'Navegación', '2025-01-07', '2025-01-07 17:42:53'),
(6, 'Tarjetas', '2025-01-07', '2025-01-07 18:12:44'),
(7, 'Formularios', '2025-01-07', '2025-01-07 18:38:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codes`
--

CREATE TABLE `codes` (
  `id_code` int(11) NOT NULL,
  `id_landing_code` int(11) NOT NULL DEFAULT 0,
  `html_code` longtext DEFAULT NULL,
  `css_code` longtext DEFAULT NULL,
  `javascript_code` longtext DEFAULT NULL,
  `date_created_code` date DEFAULT NULL,
  `date_updated_code` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `codes`
--

INSERT INTO `codes` (`id_code`, `id_landing_code`, `html_code`, `css_code`, `javascript_code`, `date_created_code`, `date_updated_code`) VALUES
(1, 1, '<header>\r\n        <nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\r\n            <div class=\"container\">\r\n                <a class=\"navbar-brand\" href=\"#\">Force Extreme Gym</a>\r\n                <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarNav\" aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n                    <span class=\"navbar-toggler-icon\"></span>\r\n                </button>\r\n                <div class=\"collapse navbar-collapse justify-content-end\" id=\"navbarNav\">\r\n                    <ul class=\"navbar-nav\">\r\n                        <li class=\"nav-item\">\r\n                            <a class=\"nav-link\" href=\"#benefits\">Beneficios</a>\r\n                        </li>\r\n                        <li class=\"nav-item\">\r\n                            <a class=\"nav-link\" href=\"#testimonials\">Testimonios</a>\r\n                        </li>\r\n                        <li class=\"nav-item\">\r\n                            <a class=\"nav-link\" href=\"#cta\">Únete Ahora</a>\r\n                        </li>\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n        </nav>\r\n    </header>\r\n\r\n    <section id=\"hero\">\r\n      \r\n     <div style=\"background-color:rgba(0,0,0,.7)\">\r\n        <div class=\"container py-5\">\r\n            <h1 class=\"display-4\">Desata tu fuerza con Force Extreme</h1>\r\n            <p class=\"lead\">Transforma tu cuerpo y mente con nuestras instalaciones de última generación y entrenadores expertos.</p>\r\n        </div>\r\n       \r\n      </div>\r\n    </section>\r\n\r\n    <section id=\"benefits\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <h2 class=\"text-center mb-4\">¿Por qué elegir Force Extreme Gym?</h2>\r\n            <div class=\"row\">\r\n                <div class=\"col-lg-4 mb-4\">\r\n                    <div class=\"card h-100\">\r\n                        <img src=\"https://images.playground.com/9300b7d17d2b4e49b53c29634ee42735.jpeg\" class=\"card-img-top\" alt=\"Equipos de última generación\">\r\n                        <div class=\"card-body\">\r\n                            <h3 class=\"card-title\">Equipos de última generación</h3>\r\n                            <p class=\"card-text\">Acceso a la tecnología fitness más avanzada para maximizar tus entrenamientos.</p>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n                <div class=\"col-lg-4 mb-4\">\r\n                    <div class=\"card h-100\">\r\n                        <img src=\"https://images.playground.com/e3b7a0d04f1c4ba6a0eb1eb08a4d0a98.jpeg\" class=\"card-img-top\" alt=\"Entrenadores expertos\">\r\n                        <div class=\"card-body\">\r\n                            <h3 class=\"card-title\">Entrenadores expertos</h3>\r\n                            <p class=\"card-text\">Programas de entrenamiento personalizados adaptados a tus objetivos fitness.</p>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n                <div class=\"col-lg-4 mb-4\">\r\n                    <div class=\"card h-100\">\r\n                        <img src=\"https://images.playground.com/357ee65d49df4c97892f187105c9bb6d.jpeg\" class=\"card-img-top\" alt=\"Variedad de clases\">\r\n                        <div class=\"card-body\">\r\n                            <h3 class=\"card-title\">Variedad de clases</h3>\r\n                            <p class=\"card-text\">Desde yoga hasta entrenamientos de alta intensidad, tenemos clases para todos los intereses.</p>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n\r\n    <section id=\"testimonials\" class=\"py-5 bg-light\">\r\n        <div class=\"container\">\r\n            <h2 class=\"text-center mb-4\">Lo que dicen nuestros miembros</h2>\r\n            <div class=\"row\">\r\n                <div class=\"col-md-4 mb-4\">\r\n                    <div class=\"card h-100 text-center\">\r\n                        <img src=\"https://images.playground.com/8c94d10163f847e7a68de60d39fc5c2a.jpeg\" class=\"card-img-top rounded-circle mx-auto mt-3\" style=\"width: 150px; height: 150px;\" alt=\"Testimonio 1\">\r\n                        <div class=\"card-body\">\r\n                            <p class=\"card-text\">\"Force Extreme Gym me ayudó a alcanzar mis metas fitness más rápido de lo que pensaba posible. ¡Los entrenadores son increíbles!\"</p>\r\n                            <p class=\"card-text\"><small class=\"text-muted\">- Juan Pérez, Miembro desde 2020</small></p>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n                <div class=\"col-md-4 mb-4\">\r\n                    <div class=\"card h-100 text-center\">\r\n                        <img src=\"https://images.playground.com/c4ccd13ffedb4a2a978d914f2046112c.jpeg\" class=\"card-img-top rounded-circle mx-auto mt-3\" style=\"width: 150px; height: 150px;\" alt=\"Testimonio 2\">\r\n                        <div class=\"card-body\">\r\n                            <p class=\"card-text\">\"Me encanta la variedad de clases que se ofrecen aquí. ¡Me mantiene motivado y emocionado por venir al gimnasio!\"</p>\r\n                            <p class=\"card-text\"><small class=\"text-muted\">- Ana Gómez, Miembro desde 2021</small></p>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n                <div class=\"col-md-4 mb-4\">\r\n                    <div class=\"card h-100 text-center\">\r\n                        <img src=\"https://images.playground.com/fb715b6dc31f435ab8729729fc4d29af.jpeg\" class=\"card-img-top rounded-circle mx-auto mt-3\" style=\"width: 150px; height: 150px;\" alt=\"Testimonio 3\">\r\n                        <div class=\"card-body\">\r\n                            <p class=\"card-text\">\"El ambiente en Force Extreme Gym es incomparable. ¡Es más que un gimnasio; es una comunidad!\"</p>\r\n                            <p class=\"card-text\"><small class=\"text-muted\">- María Rodríguez, Miembro desde 2019</small></p>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n\r\n    <section id=\"cta\">\r\n    <div id=\"ctaBackground\" style=\"background-color:rgba(0,0,0,.7) !important\">\r\n        <div class=\"container py-5\">\r\n            <h2 class=\"mb-4 text-center text-white\">Comienza tu camino fitness hoy mismo</h2>\r\n            <p class=\"lead mb-4 text-center text-white\">Únete a Force Extreme Gym y experimenta la diferencia.</p>\r\n            <div class=\"text-center\">\r\n                <a href=\"#\" class=\"btn btn-primary btn-lg\">Únete Ahora</a>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    </section>\r\n\r\n    <section id=\"contact\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col-md-6 bg-light p-4\">\r\n                    <h2 class=\"mb-4\">Contáctanos</h2>\r\n                    <form>\r\n                        <div class=\"mb-3\">\r\n                            <label for=\"fullName\" class=\"form-label\">Nombre Completo</label>\r\n                            <input type=\"text\" class=\"form-control\" id=\"fullName\" required>\r\n                        </div>\r\n                        <div class=\"mb-3\">\r\n                            <label for=\"email\" class=\"form-label\">Correo Electrónico</label>\r\n                            <input type=\"email\" class=\"form-control\" id=\"email\" required>\r\n                        </div>\r\n                        <div class=\"mb-3\">\r\n                            <label for=\"message\" class=\"form-label\">Mensaje</label>\r\n                            <textarea class=\"form-control\" id=\"message\" rows=\"5\" required></textarea>\r\n                        </div>\r\n                        <button type=\"submit\" class=\"btn btn-primary\">Enviar</button>\r\n                    </form>\r\n                </div>\r\n                <div class=\"col-md-6 p-5\" id=\"faq\">\r\n                    <h2 class=\"mb-4\">Preguntas y Respuestas</h2>\r\n                    <div class=\"accordion\" id=\"faqAccordion\">\r\n                        <div class=\"accordion-item\">\r\n                            <h2 class=\"accordion-header\" id=\"question1\">\r\n                                <button class=\"accordion-button collapsed\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#answer1\" aria-expanded=\"false\" aria-controls=\"answer1\">\r\n                                    ¿Cómo puedo cancelar mi membresía?\r\n                                </button>\r\n                            </h2>\r\n                            <div id=\"answer1\" class=\"accordion-collapse collapse\" aria-labelledby=\"question1\" data-bs-parent=\"#faqAccordion\">\r\n                                <div class=\"accordion-body\">\r\n                                    Puedes cancelar tu membresía contactando a nuestro equipo de atención al cliente o visitando la recepción de nuestro gimnasio.\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                        <div class=\"accordion-item\">\r\n                            <h2 class=\"accordion-header\" id=\"question2\">\r\n                                <button class=\"accordion-button collapsed\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#answer2\" aria-expanded=\"false\" aria-controls=\"answer2\">\r\n                                    ¿Cuáles son los horarios de apertura del gimnasio?\r\n                                </button>\r\n                            </h2>\r\n                            <div id=\"answer2\" class=\"accordion-collapse collapse\" aria-labelledby=\"question2\" data-bs-parent=\"#faqAccordion\">\r\n                                <div class=\"accordion-body\">\r\n                                    Nuestro gimnasio está abierto de lunes a viernes, de 6:00 a.m. a 10:00 p.m., y los fines de semana de 8:00 a.m. a 8:00 p.m.\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                        <!-- Add more FAQ items as needed -->\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n\r\n\r\n\r\n    <footer class=\"bg-dark text-light py-4\">\r\n        <div class=\"container text-center\">\r\n            <p>&copy; 2024 Force Extreme Gym. Todos los derechos reservados.</p>\r\n            <p>123 Calle del Gimnasio, Ciudad Fitness, Estado, 12345 | Teléfono: (123) 456-7890</p>\r\n            <div>\r\n                <a href=\"#\" class=\"text-light me-3\"><i class=\"bi bi-facebook\"></i></a>\r\n                <a href=\"#\" class=\"text-light me-3\"><i class=\"bi bi-twitter\"></i></a>\r\n                <a href=\"#\" class=\"text-light me-3\"><i class=\"bi bi-instagram\"></i></a>\r\n                <a href=\"#\" class=\"text-light\"><i class=\"bi bi-youtube\"></i></a>\r\n            </div>\r\n        </div>\r\n    </footer>\r\n			\r\n', '/* Custom styles */\nbody {\n    font-family: \'Arial\', sans-serif;\n}\n\n.navbar-brand {\n    font-size: 1.5rem;\n    font-weight: bold;\n}\n\n #hero {\n            background: url(\'https://images.playground.com/ffefa376d9bc42d5bab40cc7bcaa2f93.png\') bottom center/cover no-repeat;\n        background-attachment: fixed;\n            color: #fff;\n            padding:0;\n            text-align: center;\n        }\n        #hero h1 {\n            font-size: 3.5rem;\n            font-weight: bold;\n        }\n        #hero p {\n            font-size: 1.5rem;\n            max-width: 600px;\n            margin: 0 auto;\n        }\n\n  #cta {\n    \n            background: url(\'https://images.playground.com/ffefa376d9bc42d5bab40cc7bcaa2f93.png\') center center/cover no-repeat;\n    background-color:rgba(0,0,0,.7) !important;\n     background-attachment: fixed;\n            color: #fff;\n            padding: 0;\n            text-align: center;\n        }\n        #cta h2 {\n            font-size: 3.5rem;\n            font-weight: bold;\n        }\n        #cta p {\n            font-size: 1.5rem;\n            max-width: 600px;\n            margin: 0 auto;\n        }\n\n #contact {\n            background-color: #f8f9fa; /* Light gray background */\n            padding: 80px 0;\n        }\n        #faq {\n            background-color: #ffffff; /* White background */\n            padding: 80px 0;\n        }\n\n.card {\n    border: none;\n    transition: transform 0.3s ease;\n}\n\n.card:hover {\n    transform: translateY(-5px);\n}\n\n.card-title {\n    font-size: 1.2rem;\n    font-weight: bold;\n}\n\n.card-text {\n    font-size: 1rem;\n}\n\nblockquote {\n    font-style: italic;\n}\n\nfooter a {\n    font-size: 1.5rem;\n}\n\n@media (max-width: 768px) {\n    .navbar-nav {\n        flex-direction: column;\n    }\n}\n', NULL, '2024-06-27', '2025-01-07 19:53:44'),
(3, 3, NULL, NULL, NULL, '2025-01-04', '2025-01-04 22:18:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grids`
--

CREATE TABLE `grids` (
  `id_grid` int(11) NOT NULL,
  `name_grid` text DEFAULT NULL,
  `code_grid` longtext DEFAULT NULL,
  `date_created_grid` date DEFAULT NULL,
  `date_updated_grid` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `landings`
--

CREATE TABLE `landings` (
  `id_landing` int(11) NOT NULL,
  `title_landing` text DEFAULT NULL,
  `url_landing` text DEFAULT NULL,
  `domain_landing` text DEFAULT NULL,
  `plugins_landing` text DEFAULT NULL,
  `icon_landing` text DEFAULT NULL,
  `cover_landing` text DEFAULT NULL,
  `description_landing` text DEFAULT NULL,
  `img_landing` text DEFAULT NULL,
  `date_created_landing` date DEFAULT NULL,
  `date_updated_landing` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `landings`
--

INSERT INTO `landings` (`id_landing`, `title_landing`, `url_landing`, `domain_landing`, `plugins_landing`, `icon_landing`, `cover_landing`, `description_landing`, `img_landing`, `date_created_landing`, `date_updated_landing`) VALUES
(1, 'Agencia de Viajes', 'agencia-de-viajes', 'http://agenciadeviajes.es', '[\"%3Clink+rel%3D%22preconnect%22+href%3D%22https%3A%2F%2Ffonts.googleapis.com%22%3E\",\"%3Clink+rel%3D%22preconnect%22+href%3D%22https%3A%2F%2Ffonts.gstatic.com%22+crossorigin%3E\",\"%3Clink+href%3D%22https%3A%2F%2Ffonts.googleapis.com%2Fcss2%3Ffamily%3DRoboto%3Aital%2Cwght%400%2C100%3B0%2C300%3B0%2C400%3B0%2C500%3B0%2C700%3B0%2C900%3B1%2C100%3B1%2C300%3B1%2C400%3B1%2C500%3B1%2C700%3B1%2C900%26display%3Dswap%22+rel%3D%22stylesheet%22%3E\",\"%3Clink+href%3D%22https%3A%2F%2Fcdnjs.cloudflare.com%2Fajax%2Flibs%2Fbootstrap-icons%2F1.10.3%2Ffont%2Fbootstrap-icons.min.css%22+rel%3D%22stylesheet%22%3E\"]', 'https://cdn-icons-png.flaticon.com/128/11649/11649745.png', 'https://hd.wallpaperswide.com/thumbs/brooklyn_bridge_at_night-t2.jpg', 'Lorem Ipsum', 'image.jpg', '2024-06-27', '2025-01-07 21:02:40'),
(3, 'Force Gym', 'force-gym', NULL, '[\"%3Clink+rel%3D%22preconnect%22+href%3D%22https%3A%2F%2Ffonts.googleapis.com%22%3E\"]', 'https://cdn-icons-png.flaticon.com/512/11649/11649761.png', 'https://hd.wallpaperswide.com/thumbs/torres_del_paine_national_park_chile-t2.jpg', 'Descripción de la página', NULL, '2025-01-04', '2025-01-04 22:18:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modules`
--

CREATE TABLE `modules` (
  `id_module` int(11) NOT NULL,
  `id_category_module` int(11) NOT NULL DEFAULT 0,
  `name_module` text DEFAULT NULL,
  `code_module` longtext DEFAULT NULL,
  `order_module` int(11) NOT NULL DEFAULT 0,
  `date_created_module` date DEFAULT NULL,
  `date_updated_module` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modules`
--

INSERT INTO `modules` (`id_module`, `id_category_module`, `name_module`, `code_module`, `order_module`, `date_created_module`, `date_updated_module`) VALUES
(1, 1, 'Container Fluir', '<div class=\"container-fluir editContent\">\n\n        <div class=\"btnContent-left\">\n            <span>Container Fluir</span>\n        </div>\n\n        <div class=\"btnContent-right px-1\">\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\n            <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\n        </div>\n\n        <div class=\"newContent\">\n\n            <h4 class=\"lead text-center rounded dropContent\"><span data-feather=\"code\"></span></h4>\n\n        </div>\n\n    </div>', 1, '2025-01-06', '2025-01-06 18:29:04'),
(2, 1, 'Container', '<div class=\"container editContent\">\n\n        <div class=\"btnContent-left\">\n            <span>Container</span>\n        </div>\n\n        <div class=\"btnContent-right px-1\">\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\n            <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\n        </div>\n\n        <div class=\"newContent\">\n\n            <h4 class=\"lead text-center rounded dropContent\"><span data-feather=\"code\"></span></h4>\n\n        </div>\n\n    </div>', 2, '2025-01-06', '2025-01-06 18:11:32'),
(3, 2, '12', NULL, 1, '2025-01-06', '2025-01-06 18:30:32'),
(4, 2, '6 6', NULL, 2, '2025-01-06', '2025-01-06 18:31:59'),
(5, 2, '4 4 4', NULL, 3, '2025-01-06', '2025-01-06 18:31:12'),
(6, 2, '3 3 3 3', NULL, 4, '2025-01-06', '2025-01-06 18:31:12'),
(7, 2, '2 2 2 2 2 2', NULL, 5, '2025-01-06', '2025-01-06 18:31:12'),
(8, 2, '1 1 1 1 1 1 1 1 1 1 1 1', NULL, 6, '2025-01-06', '2025-01-06 18:31:12'),
(9, 3, 'd-flex', NULL, 1, '2025-01-06', '2025-01-06 20:21:04'),
(10, 4, 'Title', '<div class=\"text-start editContent\">\n\n            <div class=\"btnContent-left\">\n                <span>Title</span>\n            </div>\n\n            <div class=\"btnContent-right px-1\">\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\n                <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\n            </div>\n\n            <p class=\"h3\">Lorem ipsum.</p>\n\n        </div>', 1, '2025-01-07', '2025-01-07 14:44:04'),
(11, 4, 'Display', '<div class=\"text-start editContent\">\n\n            <div class=\"btnContent-left\">\n                <span>Display</span>\n            </div>\n\n            <div class=\"btnContent-right px-1\">\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\n                <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\n            </div>\n\n            <p class=\"display-3\">Lorem ipsum.</p>\n\n        </div>', 2, '2025-01-07', '2025-01-07 14:44:25'),
(12, 4, 'Small', '<div class=\"text-start editContent\">\r\n\r\n            <div class=\"btnContent-left\">\r\n                <span>Small</span>\r\n            </div>\r\n\r\n            <div class=\"btnContent-right px-1\">\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\r\n            </div>\r\n\r\n            <h4><small>Lorem ipsum.</small></h4>\r\n\r\n        </div>', 3, '2025-01-07', '2025-01-07 14:44:25'),
(13, 4, 'Paragraph', '<div class=\"text-start editContent\">\r\n\r\n            <div class=\"btnContent-left\">\r\n                <span>Paragraph</span>\r\n            </div>\r\n\r\n            <div class=\"btnContent-right px-1\">\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\r\n            </div>\r\n\r\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni sed tempore optio. Eum, corporis dolores, accusantium sapiente expedita eligendi dolore sequi fugit nobis vitae aut! Quidem quod perferendis officiis fugiat.</p>\r\n\r\n        </div>', 4, '2025-01-07', '2025-01-07 14:44:25'),
(14, 4, 'Square IMG', '<div class=\"text-start editContent\">\n\n            <div class=\"btnContent-left\">\n                <span>Square Image</span>\n            </div>\n\n            <div class=\"btnContent-right px-1\">\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\n                <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\n            </div>\n\n            <figure>\n                <img src=\"/views/assets/img/placeholder-square.svg\" class=\"img-fluid w-100\">\n            </figure>\n\n        </div>', 5, '2025-01-07', '2025-01-07 19:49:24'),
(15, 4, 'Lands IMG', '<div class=\"text-start editContent\">\n\n            <div class=\"btnContent-left\">\n                <span>Landscape Image</span>\n            </div>\n\n            <div class=\"btnContent-right px-1\">\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\n                <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\n            </div>\n\n            <figure>\n                <img src=\"/views/assets/img/placeholder-landscape.svg\" class=\"img-fluid w-100\">\n            </figure>\n\n        </div>', 6, '2025-01-07', '2025-01-07 19:49:37'),
(16, 4, 'Portrait IMG', '<div class=\"text-start editContent\">\n\n            <div class=\"btnContent-left\">\n                <span>Portrait Image</span>\n            </div>\n\n            <div class=\"btnContent-right px-1\">\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\n                <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\n            </div>\n\n            <figure>\n                <img src=\"/views/assets/img/placeholder-portrait.svg\" class=\"img-fluid w-100\">\n            </figure>\n\n        </div>', 7, '2025-01-07', '2025-01-07 19:49:48'),
(17, 4, 'Circle IMG', '<div class=\"text-start editContent\">\n\n            <div class=\"btnContent-left\">\n                <span>Circle Image</span>\n            </div>\n\n            <div class=\"btnContent-right px-1\">\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\n                <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\n            </div>\n\n            <figure>\n                <img src=\"/views/assets/img/placeholder-square.svg\" class=\"rounded-circle w-100\">\n            </figure>\n\n        </div>', 8, '2025-01-07', '2025-01-07 19:50:53'),
(18, 4, 'Icon', '<div class=\"text-start editContent\">\r\n\r\n            <div class=\"btnContent-left\">\r\n                <span>Icon</span>\r\n            </div>\r\n\r\n            <div class=\"btnContent-right px-1\">\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\r\n            </div>\r\n\r\n            <h1><i class=\"fas fa-coffee\"></i></h1>\r\n\r\n        </div>', 9, '2025-01-07', '2025-01-07 14:44:25'),
(19, 4, 'Button', '<div class=\"text-start editContent\">\r\n\r\n            <div class=\"btnContent-left\">\r\n                <span>Button</span>\r\n            </div>\r\n\r\n            <div class=\"btnContent-right px-1\">\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\r\n            </div>\r\n\r\n            <button type=\"button\" class=\"btn btn-secondary\">Click Here</button>\r\n\r\n        </div>', 10, '2025-01-07', '2025-01-07 14:44:25'),
(20, 4, 'Button Group', '<div class=\"text-start editContent\">\r\n\r\n            <div class=\"btnContent-left\">\r\n                <span>Button Group</span>\r\n            </div>\r\n\r\n            <div class=\"btnContent-right px-1\">\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\r\n                <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\r\n            </div>\r\n\r\n            <div class=\"btn-group\">\r\n                <button type=\"button\" class=\"btn btn-secondary border\">Click Here</button>\r\n                <button type=\"button\" class=\"btn btn-secondary border\">Click Here</button>\r\n                <button type=\"button\" class=\"btn btn-secondary border\">Click Here</button>\r\n            </div>\r\n\r\n        </div>', 11, '2025-01-07', '2025-01-07 14:44:25'),
(24, 5, 'H Nav', '<div class=\"container-fluid editContent\">\r\n\r\n        <div class=\"btnContent-left\">\r\n            <span>Horizontal Nav</span>\r\n        </div>\r\n\r\n        <div class=\"btnContent-right px-1\">\r\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i\r\n                    class=\"far fa-image\"></i></button>\r\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i\r\n                    class=\"far fa-square\"></i></button>\r\n            <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\r\n        </div>\r\n\r\n        <nav class=\"navbar navbar-expand-sm bg-transparent\">\r\n            <div class=\"container-fluid\">\r\n                <a class=\"navbar-brand bg-transparent px-3 shadow-none\" href=\"javascript:void(0)\">\r\n                    <img src=\"/views/assets/img/placeholder-square.svg\" alt=\"Avatar Logo\" style=\"width:40px;\" class=\"rounded-pill\">\r\n                    Logo\r\n                </a>\r\n                <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#mynavbar\">\r\n                    <span class=\"navbar-toggler-icon\"></span>\r\n                </button>\r\n                <div class=\"collapse navbar-collapse\" id=\"mynavbar\">\r\n                    <ul class=\"navbar-nav me-auto\">\r\n                        <li class=\"nav-item\">\r\n                            <a class=\"nav-link\" href=\"javascript:void(0)\">Link</a>\r\n                        </li>\r\n                        <li class=\"nav-item\">\r\n                            <a class=\"nav-link\" href=\"javascript:void(0)\">Link</a>\r\n                        </li>\r\n                        <li class=\"nav-item\">\r\n                            <a class=\"nav-link\" href=\"javascript:void(0)\">Link</a>\r\n                        </li>\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n        </nav>\r\n\r\n    </div>', 1, '2025-01-07', '2025-01-07 17:45:33'),
(25, 5, 'V Nav', '<div class=\"container-fluid editContent\">\n\n        <div class=\"btnContent-left\">\n            <span>Vertical Nav</span>\n        </div>\n\n        <div class=\"btnContent-right px-1\">\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i\n                    class=\"far fa-image\"></i></button>\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i\n                    class=\"far fa-square\"></i></button>\n            <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\n        </div>\n\n        <ul class=\"list-group text-start\">\n            <li class=\"list-group-item\">First item</li>\n            <li class=\"list-group-item\">Second item</li>\n            <li class=\"list-group-item\">Third item</li>\n        </ul>\n\n    </div>', 2, '2025-01-07', '2025-01-07 17:55:44'),
(26, 6, 'Card Text', '<div class=\"card editContent\">\n\n        <div class=\"btnContent-left\">\n            <span>Card Text</span>\n        </div>\n\n        <div class=\"btnContent-right px-1\">\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i\n                    class=\"far fa-image\"></i></button>\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i\n                    class=\"far fa-square\"></i></button>\n            <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\n        </div>\n\n        <div class=\"card-header\">Header</div>\n        <div class=\"card-body\">Content</div>\n        <div class=\"card-footer\">Footer</div>\n\n    </div>', 1, '2025-01-07', '2025-01-07 18:31:40'),
(27, 6, 'Card Image', '<div class=\"card editContent\">\n\n        <div class=\"btnContent-left\">\n            <span>Card Image</span>\n        </div>\n\n        <div class=\"btnContent-right px-1\">\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i\n                    class=\"far fa-image\"></i></button>\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i\n                    class=\"far fa-square\"></i></button>\n            <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\n        </div>\n\n        <img class=\"card-img-top\" src=\"/views/assets/img/placeholder-square.svg\" alt=\"Card image\">\n        <div class=\"card-body\">\n            <h4 class=\"card-title\">John Doe</h4>\n            <p class=\"card-text\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem obcaecati impedit deserunt odio fugiat sequi illum beatae cum molestias voluptate possimus omnis distinctio, quibusdam cumque iusto rem nisi aperiam pariatur.</p>\n            <a href=\"#\" class=\"btn btn-light border\">See Profile</a>\n        </div>\n\n    </div>', 2, '2025-01-07', '2025-01-07 18:31:50'),
(28, 7, 'Simple Form', '<div class=\"container-fluir editContent\">\r\n\r\n        <div class=\"btnContent-left\">\r\n            <span>Simple Form</span>\r\n        </div>\r\n\r\n        <div class=\"btnContent-right px-1\">\r\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\r\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\r\n            <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\r\n        </div>\r\n\r\n        <form>\r\n            <div class=\"input-group\">\r\n                <input type=\"text\" class=\"form-control\" placeholder=\"Your Email\">\r\n                <button type=\"submit\" class=\"btn input-group-text bg-secondary text-white\">Send</button>\r\n            </div>\r\n        </form>\r\n\r\n    </div>', 1, '2025-01-07', '2025-01-07 18:38:53'),
(29, 7, 'Complete Form', '<div class=\"container-fluir editContent\">\r\n\r\n        <div class=\"btnContent-left\">\r\n            <span>Complete Form</span>\r\n        </div>\r\n\r\n        <div class=\"btnContent-right px-1\">\r\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 imgBackground\"><i class=\"far fa-image\"></i></button>\r\n            <button class=\"btn bg-white border btn-sm py-0 px-1 mr-1 noBackground\" style=\"display:none\"><i class=\"far fa-square\"></i></button>\r\n            <button class=\"btn bg-white border btn-sm py-0 px-1 deleteModule\"><i class=\"fas fa-trash-alt\"></i></button>\r\n        </div>\r\n\r\n        <form>\r\n            <div class=\"form-floating mb-3 mt-3\">\r\n                <input type=\"text\" class=\"form-control\" id=\"name\" placeholder=\"Enter name\" name=\"name\">\r\n                <label for=\"name\">Name</label>\r\n            </div>\r\n\r\n            <div class=\"form-floating mb-3 mt-3\">\r\n                <input type=\"email\" class=\"form-control\" id=\"email\" placeholder=\"Enter email\" name=\"email\">\r\n                <label for=\"email\">Email</label>\r\n            </div>\r\n\r\n            <div class=\"form-floating mb-3 mt-3\">\r\n                <textarea class=\"form-control\" id=\"message\" placeholder=\"Message goes here\" name=\"message\" rows=\"5\"></textarea>\r\n                <label for=\"message\">Message</label>\r\n            </div>\r\n\r\n            <select class=\"form-select py-3\">\r\n                <option>1</option>\r\n                <option>2</option>\r\n                <option>3</option>\r\n                <option>4</option>\r\n            </select>\r\n\r\n            <button type=\"submit\" class=\"btn btn-secondary mt-3 w-100 py-3\">Submit</button>\r\n\r\n        </form>\r\n\r\n    </div>', 2, '2025-01-07', '2025-01-07 18:38:53');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Indices de la tabla `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`id_code`);

--
-- Indices de la tabla `grids`
--
ALTER TABLE `grids`
  ADD PRIMARY KEY (`id_grid`);

--
-- Indices de la tabla `landings`
--
ALTER TABLE `landings`
  ADD PRIMARY KEY (`id_landing`);

--
-- Indices de la tabla `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id_module`),
  ADD KEY `id_category_module` (`id_category_module`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `codes`
--
ALTER TABLE `codes`
  MODIFY `id_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `grids`
--
ALTER TABLE `grids`
  MODIFY `id_grid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `landings`
--
ALTER TABLE `landings`
  MODIFY `id_landing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `modules`
--
ALTER TABLE `modules`
  MODIFY `id_module` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`id_category_module`) REFERENCES `categories` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
