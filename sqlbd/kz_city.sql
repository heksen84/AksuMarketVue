-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 10 2020 г., 11:01
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `flix`
--

-- --------------------------------------------------------

--
-- Структура таблицы `kz_city`
--

CREATE TABLE `kz_city` (
  `city_id` int(3) UNSIGNED NOT NULL,
  `region_id` int(2) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(40) NOT NULL,
  `coords` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `kz_city`
--

INSERT INTO `kz_city` (`city_id`, `region_id`, `name`, `url`, `coords`) VALUES
(1, 0, 'Абай', 'abay', '48.605970, 58.593710'),
(2, 1, 'Акколь', 'akkol', '51.785262, 69.908818'),
(3, 0, 'Аксай', 'aksay', '48.605970, 58.593710'),
(4, 0, 'Аксу', 'aksu', '48.605970, 58.593710'),
(5, 1, 'Атбасар', 'atbasar', '51.785262, 69.908818'),
(6, 1, 'Державинск', 'derzhavinsk', '51.785262, 69.908818'),
(7, 1, 'Ерейментау', 'ereymentau', '51.785262, 69.908818'),
(8, 1, 'Есиль', 'esil', '51.785262, 69.908818'),
(9, 1, 'Кокшетау', 'kokshetau', '51.785262, 69.908818'),
(10, 1, 'Макинск', 'makinsk', '51.785262, 69.908818'),
(11, 1, 'Нур-Султан', 'nur-sultan', '51.785262, 69.908818'),
(12, 1, 'Щучинск', 'schuchinsk', '51.785262, 69.908818'),
(13, 0, 'Сергеевка', 'sergeevka', '48.605970, 58.593710'),
(14, 1, 'Степногорск', 'stepnogorsk', '51.785262, 69.908818'),
(15, 1, 'Степняк', 'stepnyak', '51.785262, 69.908818'),
(16, 0, 'Актобе', 'aktobe', '48.605970, 58.593710'),
(17, 0, 'Алга', 'alga', '48.605970, 58.593710'),
(18, 0, 'Эмба', 'emba', '48.605970, 58.593710'),
(19, 0, 'Хромтау', 'hromtau', '48.605970, 58.593710'),
(20, 0, 'Кандыагаш', 'kandyagash', '48.605970, 58.593710'),
(21, 0, 'Шалкар', 'shalkar', '48.605970, 58.593710'),
(22, 0, 'Темир', 'temir', '48.605970, 58.593710'),
(23, 1, 'Жем', 'zhem', '51.785262, 69.908818'),
(24, 2, 'Алматы', 'almaty', '44.548301, 77.474240'),
(25, 2, 'Талдыкорган', 'taldykorgan', '44.548301, 77.474240'),
(26, 2, 'Ушарал', 'usharal', '44.548301, 77.474240'),
(27, 3, 'Атырау', 'atyrau', '47.490698, 52.093519'),
(28, 3, 'Кульсары', 'kulsary', '47.490698, 52.093519'),
(29, 4, 'Сатпаев', 'satpaev', '48.793012, 81.488910'),
(30, 4, 'Семей', 'semey', '48.793012, 81.488910'),
(31, 4, 'Шемонаиха', 'shemonaiha', '48.793012, 81.488910'),
(32, 4, 'Усть-Каменогорск', 'ust-kamenogorsk', '48.793012, 81.488910'),
(33, 4, 'Зыряновск', 'zyryanovsk', '48.793012, 81.488910'),
(34, 5, 'Тараз', 'taraz', '44.311975, 72.138463'),
(35, 6, 'Актау', 'aktau', '49.813556, 50.675447'),
(36, 7, 'Байконур', 'baykonur', '48.219942, 70.978720'),
(47, 11, 'Экибастуз', 'ekibastuz', '52.068494, 76.242551'),
(48, 11, 'Павлодар', 'pavlodar', '52.068494, 76.242551'),
(49, 11, 'Акку', 'akku', '52.068494, 76.242551'),
(50, 11, 'Аксу', 'aksu', '52.068494, 76.242551'),
(51, 11, 'Актогай', 'aktogay', '52.068494, 76.242551'),
(52, 11, 'Баянаул', 'bayanaul', '52.068494, 76.242551'),
(53, 11, 'Железинка', 'zhelezinka', '52.068494, 76.242551'),
(54, 11, 'Иртышск', 'irtyshsk', '52.068494, 76.242551'),
(55, 11, 'Кызылорда', 'kyzylorda', '52.068494, 76.242551'),
(56, 11, 'Коктобе', 'koktobe', '52.068494, 76.242551'),
(57, 11, 'Моисеевка', 'moiseevka', '52.068494, 76.242551'),
(58, 11, 'Теренколь', 'terenkol', '52.068494, 76.242551'),
(73, 12, 'Темирзяево', 'temirzyaevo', '53.668040, 67.982794'),
(95, 1, 'Аршалы', 'arshaly', '51.785262, 69.908818'),
(96, 1, 'Астраханка', 'astrahanka', '51.785262, 69.908818'),
(97, 1, 'Балкашино', 'balkashino', '51.785262, 69.908818'),
(98, 1, 'Боровое', 'borovoe', '51.785262, 69.908818'),
(99, 1, 'Егиндыколь', 'egindykol', '51.785262, 69.908818'),
(100, 1, 'Жаксы', 'zhaksy', '51.785262, 69.908818'),
(101, 1, 'Жалтыр', 'zhaltyr', '51.785262, 69.908818'),
(102, 1, 'Зеренда', 'zerenda', '51.785262, 69.908818'),
(103, 1, 'Кабанбай-батыра', 'kabanbay-batyra', '51.785262, 69.908818'),
(104, 1, 'Караоткель', 'karaotkel', '51.785262, 69.908818'),
(105, 1, 'Коргалжын', 'korgalzhyn', '51.785262, 69.908818'),
(106, 1, 'Мамай', 'mamay', '51.785262, 69.908818'),
(107, 1, 'Новомарковка', 'novomarkovka', '51.785262, 69.908818'),
(108, 1, 'Талапкер', 'talapker', '51.785262, 69.908818'),
(109, 1, 'Шортанды', 'shortandy', '51.785262, 69.908818'),
(110, 0, 'Акраб', 'akrab', '48.605970, 58.593710'),
(111, 0, 'Бадамша', 'badamsha', '48.605970, 58.593710'),
(112, 0, 'Иргиз', 'irgiz', '48.605970, 58.593710'),
(113, 0, 'Карауылкельды', 'karauylkeldy', '48.605970, 58.593710'),
(114, 0, 'Кенкияк', 'kenkiyak', '48.605970, 58.593710'),
(115, 0, 'Кобда', 'kobda', '48.605970, 58.593710'),
(116, 0, 'Комсомольское', 'komsomolskoe', '48.605970, 58.593710'),
(117, 0, 'Мартук', 'martuk', '48.605970, 58.593710'),
(118, 0, 'Уил', 'uil', '48.605970, 58.593710'),
(119, 0, 'Шубаркудук', 'shubarkuduk', '48.605970, 58.593710'),
(120, 2, 'Абай', 'abay', '44.548301, 77.474240'),
(121, 2, 'Ават', 'avat', '44.548301, 77.474240'),
(122, 2, 'Азат', 'azat', '44.548301, 77.474240'),
(123, 2, 'Айтей', 'aytey', '44.548301, 77.474240'),
(124, 2, 'Акжар', 'akzhar', '44.548301, 77.474240'),
(125, 2, 'Аксенгир', 'aksengir', '44.548301, 77.474240'),
(126, 2, 'Акши', 'akshi', '44.548301, 77.474240'),
(127, 2, 'Алатау с/з', 'alatau-s-z', '44.548301, 77.474240'),
(128, 2, 'Алгабас', 'algabas', '44.548301, 77.474240'),
(129, 2, 'Алма-Арасан', 'alma-arasan', '44.548301, 77.474240'),
(130, 2, 'Алмалы', 'almaly', '44.548301, 77.474240'),
(131, 2, 'Алмалыбак (КИЗ)', 'almalybak-kiz', '44.548301, 77.474240'),
(132, 2, 'Альмерек', 'almerek', '44.548301, 77.474240'),
(133, 2, 'Арна', 'arna', '44.548301, 77.474240'),
(134, 2, 'Ащыбулак', 'aschybulak', '44.548301, 77.474240'),
(135, 2, 'Ащысай', 'aschysay', '44.548301, 77.474240'),
(136, 2, 'Баганашыл', 'baganashyl', '44.548301, 77.474240'),
(137, 2, 'Базаркельды', 'bazarkeldy', '44.548301, 77.474240'),
(138, 2, 'Байсерке', 'bayserke', '44.548301, 77.474240'),
(139, 2, 'Байтерек', 'bayterek', '44.548301, 77.474240'),
(140, 2, 'Баканас', 'bakanas', '44.548301, 77.474240'),
(141, 2, 'Балпык Би', 'balpyk-bi', '44.548301, 77.474240'),
(142, 2, 'Балтабай', 'baltabay', '44.548301, 77.474240'),
(143, 2, 'Батан', 'batan', '44.548301, 77.474240'),
(144, 2, 'Бекболат', 'bekbolat', '44.548301, 77.474240'),
(145, 2, 'Бельбулак', 'belbulak', '44.548301, 77.474240'),
(146, 2, 'Береке', 'bereke', '44.548301, 77.474240'),
(147, 2, 'Бесагаш', 'besagash', '44.548301, 77.474240'),
(148, 2, 'Бескайнар', 'beskaynar', '44.548301, 77.474240'),
(149, 2, 'Бирлик', 'birlik', '44.548301, 77.474240'),
(150, 2, 'Боралдай', 'boralday', '44.548301, 77.474240'),
(151, 2, 'Булакты', 'bulakty', '44.548301, 77.474240'),
(152, 2, 'Верхняя-каменка', 'verhnyaya-kamenka', '44.548301, 77.474240'),
(153, 2, 'Гулдала', 'guldala', '44.548301, 77.474240'),
(154, 2, 'Даулет', 'daulet', '44.548301, 77.474240'),
(155, 2, 'Долан', 'dolan', '44.548301, 77.474240'),
(156, 2, 'Еламан', 'elaman', '44.548301, 77.474240'),
(157, 2, 'Ельтай', 'eltay', '44.548301, 77.474240'),
(158, 2, 'Енбекши', 'enbekshi', '44.548301, 77.474240'),
(159, 2, 'Еркин', 'erkin', '44.548301, 77.474240'),
(160, 2, 'Ерменсай', 'ermensay', '44.548301, 77.474240'),
(161, 2, 'Есик', 'esik', '44.548301, 77.474240'),
(162, 2, 'Жалкамыс', 'zhalkamys', '44.548301, 77.474240'),
(163, 2, 'Жалпаксай', 'zhalpaksay', '44.548301, 77.474240'),
(164, 2, 'Жамбыл', 'zhambyl', '44.548301, 77.474240'),
(165, 2, 'Жана-Арна', 'zhana-arna', '44.548301, 77.474240'),
(166, 2, 'Жанадауыр', 'zhanadauyr', '44.548301, 77.474240'),
(167, 2, 'Жаналык', 'zhanalyk', '44.548301, 77.474240'),
(168, 2, 'Жанаталап', 'zhanatalap', '44.548301, 77.474240'),
(169, 2, 'Жанатурмыс', 'zhanaturmys', '44.548301, 77.474240'),
(170, 2, 'Жанашар', 'zhanashar', '44.548301, 77.474240'),
(171, 2, 'Жандосов', 'zhandosov', '44.548301, 77.474240'),
(172, 2, 'Жансугуров', 'zhansugurov', '44.548301, 77.474240'),
(173, 2, 'Жапек батыр', 'zhapek-batyr', '44.548301, 77.474240'),
(174, 2, 'Жаркент', 'zharkent', '44.548301, 77.474240'),
(175, 2, 'Жармухамбет', 'zharmuhambet', '44.548301, 77.474240'),
(176, 2, 'Жетыген', 'zhetygen', '44.548301, 77.474240'),
(177, 2, 'Жуагашты', 'zhuagashty', '44.548301, 77.474240'),
(178, 2, 'Заречное', 'zarechnoe', '44.548301, 77.474240'),
(179, 2, 'ИЯФ', 'iyaf', '44.548301, 77.474240'),
(180, 2, 'Иргели', 'irgeli', '44.548301, 77.474240'),
(181, 2, 'Кабанбай', 'kabanbay', '44.548301, 77.474240'),
(182, 2, 'КазЦИК', 'kazcik', '44.548301, 77.474240'),
(183, 2, 'Кайзанар', 'kayzanar', '44.548301, 77.474240'),
(184, 2, 'Кайнар', 'kaynar', '44.548301, 77.474240'),
(185, 2, 'Кайрат', 'kayrat', '44.548301, 77.474240'),
(186, 2, 'Капал', 'kapal', '44.548301, 77.474240'),
(187, 2, 'Капчагай', 'kapchagay', '44.548301, 77.474240'),
(188, 2, 'Карабулак', 'karabulak', '44.548301, 77.474240'),
(189, 2, 'Карагайлы', 'karagayly', '44.548301, 77.474240'),
(190, 2, 'Каракастек', 'karakastek', '44.548301, 77.474240'),
(191, 2, 'Каракемер', 'karakemer', '44.548301, 77.474240'),
(192, 2, 'Караой', 'karaoy', '44.548301, 77.474240'),
(193, 2, 'Карасу-2', 'karasu-2', '44.548301, 77.474240'),
(194, 2, 'Каргалы', 'kargaly', '44.548301, 77.474240'),
(195, 2, 'Каскелен', 'kaskelen', '44.548301, 77.474240'),
(196, 2, 'Касымбек', 'kasymbek', '44.548301, 77.474240'),
(197, 2, 'Кеген', 'kegen', '44.548301, 77.474240'),
(198, 2, 'Кемертоган', 'kemertogan', '44.548301, 77.474240'),
(199, 2, 'Кендала', 'kendala', '44.548301, 77.474240'),
(200, 2, 'Когалы', 'kogaly', '44.548301, 77.474240'),
(201, 2, 'Кок-Лай-Сай', 'kok-lay-say', '44.548301, 77.474240'),
(202, 2, 'Кокдала', 'kokdala', '44.548301, 77.474240'),
(203, 2, 'Коккайнар', 'kokkaynar', '44.548301, 77.474240'),
(204, 2, 'Кокозек', 'kokozek', '44.548301, 77.474240'),
(205, 2, 'Коксай', 'koksay', '44.548301, 77.474240'),
(206, 2, 'Коктума', 'koktuma', '44.548301, 77.474240'),
(207, 2, 'Колхозшы', 'kolhozshy', '44.548301, 77.474240'),
(208, 2, 'Кольди', 'koldi', '44.548301, 77.474240'),
(209, 2, 'Кольсай', 'kolsay', '44.548301, 77.474240'),
(210, 2, 'Комсомол', 'komsomol', '44.548301, 77.474240'),
(211, 2, 'Космос', 'kosmos', '44.548301, 77.474240'),
(212, 2, 'Косозен', 'kosozen', '44.548301, 77.474240'),
(213, 2, 'Кошмамбет', 'koshmambet', '44.548301, 77.474240'),
(214, 2, 'Коянкоз', 'koyankoz', '44.548301, 77.474240'),
(215, 2, 'Кумтоган', 'kumtogan', '44.548301, 77.474240'),
(216, 2, 'Курамыс', 'kuramys', '44.548301, 77.474240'),
(217, 2, 'Куш', 'kush', '44.548301, 77.474240'),
(218, 2, 'Кызыл Кайрат', 'kyzyl-kayrat', '44.548301, 77.474240'),
(219, 2, 'Кызыл ту-4', 'kyzyl-tu-4', '44.548301, 77.474240'),
(220, 2, 'Кыргауылды', 'kyrgauyldy', '44.548301, 77.474240'),
(221, 2, 'Лепсинск', 'lepsinsk', '44.548301, 77.474240'),
(222, 2, 'М.Туймебаева', 'm-tuymebaeva', '44.548301, 77.474240'),
(223, 2, 'Мадениет', 'madeniet', '44.548301, 77.474240'),
(224, 2, 'Маловодное', 'malovodnoe', '44.548301, 77.474240'),
(225, 2, 'Междуреченск', 'mezhdurechensk', '44.548301, 77.474240'),
(226, 2, 'Мерей', 'merey', '44.548301, 77.474240'),
(227, 2, 'Музей Жамбыла', 'muzey-zhambyla', '44.548301, 77.474240'),
(228, 2, 'Мынбаев', 'mynbaev', '44.548301, 77.474240'),
(229, 2, 'Нарынкол', 'narynkol', '44.548301, 77.474240'),
(230, 2, 'Нура', 'nura', '44.548301, 77.474240'),
(231, 2, 'Остемир', 'ostemir', '44.548301, 77.474240'),
(232, 2, 'Отеген батыр', 'otegen-batyr', '44.548301, 77.474240'),
(233, 2, 'Панфилова', 'panfilova', '44.548301, 77.474240'),
(234, 2, 'Первомайский', 'pervomayskiy', '44.548301, 77.474240'),
(235, 2, 'Райымбек', 'rayymbek', '44.548301, 77.474240'),
(236, 2, 'Рахат', 'rahat', '44.548301, 77.474240'),
(237, 2, 'Ремизовка', 'remizovka', '44.548301, 77.474240'),
(238, 2, 'Саймасай', 'saymasay', '44.548301, 77.474240'),
(239, 2, 'Самсы', 'samsy', '44.548301, 77.474240'),
(240, 2, 'Сарканд', 'sarkand', '44.548301, 77.474240'),
(241, 2, 'Сарыозек', 'saryozek', '44.548301, 77.474240'),
(242, 2, 'Станция-Шамалган', 'stanciya-shamalgan', '44.548301, 77.474240'),
(243, 2, 'Сункар', 'sunkar', '44.548301, 77.474240'),
(244, 2, 'Талап', 'talap', '44.548301, 77.474240'),
(245, 2, 'Талгар', 'talgar', '44.548301, 77.474240'),
(246, 2, 'Талдыбулак', 'taldybulak', '44.548301, 77.474240'),
(247, 2, 'Тастыбулак', 'tastybulak', '44.548301, 77.474240'),
(248, 2, 'Тау Жолы', 'tau-zholy', '44.548301, 77.474240'),
(249, 2, 'Таусамал', 'tausamal', '44.548301, 77.474240'),
(250, 2, 'Текели', 'tekeli', '44.548301, 77.474240'),
(251, 2, 'Теректы', 'terekty', '44.548301, 77.474240'),
(252, 2, 'Тонкерис', 'tonkeris', '44.548301, 77.474240'),
(253, 2, 'Туздыбастау', 'tuzdybastau', '44.548301, 77.474240'),
(254, 2, 'Турар', 'turar', '44.548301, 77.474240'),
(255, 2, 'Турген', 'turgen', '44.548301, 77.474240'),
(256, 2, 'Узынагаш', 'uzynagash', '44.548301, 77.474240'),
(257, 2, 'Улан', 'ulan', '44.548301, 77.474240'),
(258, 2, 'Улькен', 'ulken', '44.548301, 77.474240'),
(259, 2, 'Унгуртас', 'ungurtas', '44.548301, 77.474240'),
(260, 2, 'Ушконыр', 'ushkonyr', '44.548301, 77.474240'),
(261, 2, 'Уштобе', 'ushtobe', '44.548301, 77.474240'),
(262, 2, 'Хоргос', 'horgos', '44.548301, 77.474240'),
(263, 2, 'Хусаина Бижанова', 'husaina-bizhanova', '44.548301, 77.474240'),
(264, 2, 'Чапаево', 'chapaevo', '44.548301, 77.474240'),
(265, 2, 'Чунджа', 'chundzha', '44.548301, 77.474240'),
(266, 2, 'Шалкар', 'shalkar', '44.548301, 77.474240'),
(267, 2, 'Шамаган', 'shamagan', '44.548301, 77.474240'),
(268, 2, 'Шелек', 'shelek', '44.548301, 77.474240'),
(269, 2, 'Шелекемир', 'shelekemir', '44.548301, 77.474240'),
(270, 2, 'Шенгельды', 'shengeldy', '44.548301, 77.474240'),
(271, 2, 'Шубар', 'shubar', '44.548301, 77.474240'),
(272, 2, 'Ынтымак', 'yntymak', '44.548301, 77.474240'),
(273, 2, 'Энергетик', 'energetik', '44.548301, 77.474240'),
(274, 3, 'Аккыстау', 'akkystau', '47.490698, 52.093519'),
(275, 3, 'Ганюшкино', 'ganyushkino', '47.490698, 52.093519'),
(276, 3, 'Доссор', 'dossor', '47.490698, 52.093519'),
(277, 3, 'Индер', 'inder', '47.490698, 52.093519'),
(278, 3, 'Индерборский', 'inderborskiy', '47.490698, 52.093519'),
(279, 3, 'Исатай', 'isatay', '47.490698, 52.093519'),
(280, 3, 'Макат', 'makat', '47.490698, 52.093519'),
(281, 3, 'Махамбет', 'mahambet', '47.490698, 52.093519'),
(282, 3, 'Миялы', 'miyaly', '47.490698, 52.093519'),
(283, 4, 'Акжар', 'akzhar', '48.793012, 81.488910'),
(284, 4, 'Аксуат', 'aksuat', '48.793012, 81.488910'),
(285, 4, 'Актогай', 'aktogay', '48.793012, 81.488910'),
(286, 4, 'Алтай', 'altay', '48.793012, 81.488910'),
(287, 4, 'Асу-Булак', 'asu-bulak', '48.793012, 81.488910'),
(288, 4, 'Ауэзов', 'auezov', '48.793012, 81.488910'),
(289, 4, 'Аягоз', 'ayagoz', '48.793012, 81.488910'),
(290, 4, 'Баршатас', 'barshatas', '48.793012, 81.488910'),
(291, 4, 'Белоусовка', 'belousovka', '48.793012, 81.488910'),
(292, 4, 'Бескарагай', 'beskaragay', '48.793012, 81.488910'),
(293, 4, 'Бородулиха', 'boroduliha', '48.793012, 81.488910'),
(294, 4, 'Глубокое', 'glubokoe', '48.793012, 81.488910'),
(295, 4, 'Жезкент', 'zhezkent', '48.793012, 81.488910'),
(296, 4, 'Зайсан', 'zaysan', '48.793012, 81.488910'),
(297, 4, 'Калбатау', 'kalbatau', '48.793012, 81.488910'),
(298, 4, 'Караул', 'karaul', '48.793012, 81.488910'),
(299, 4, 'Касыма Кайсенова', 'kasyma-kaysenova', '48.793012, 81.488910'),
(300, 4, 'Катон-Карагай', 'katon-karagay', '48.793012, 81.488910'),
(301, 4, 'Кокпекты', 'kokpekty', '48.793012, 81.488910'),
(302, 4, 'Курчатов', 'kurchatov', '48.793012, 81.488910'),
(303, 4, 'Курчум', 'kurchum', '48.793012, 81.488910'),
(304, 4, 'Маканчи', 'makanchi', '48.793012, 81.488910'),
(305, 4, 'Новая Бухтарма', 'novaya-buhtarma', '48.793012, 81.488910'),
(306, 4, 'Новая Шульба', 'novaya-shulba', '48.793012, 81.488910'),
(307, 4, 'Риддер', 'ridder', '48.793012, 81.488910'),
(308, 4, 'Самарское', 'samarskoe', '48.793012, 81.488910'),
(309, 4, 'Серебрянск', 'serebryansk', '48.793012, 81.488910'),
(310, 4, 'Таврическое', 'tavricheskoe', '48.793012, 81.488910'),
(311, 4, 'Улькен-Нарын', 'ulken-naryn', '48.793012, 81.488910'),
(312, 4, 'Урджар', 'urdzhar', '48.793012, 81.488910'),
(313, 4, 'Черемшанка', 'cheremshanka', '48.793012, 81.488910'),
(314, 4, 'Шар', 'shar', '48.793012, 81.488910'),
(315, 4, 'Шульбинск', 'shulbinsk', '48.793012, 81.488910'),
(316, 5, 'Акколь', 'akkol', '44.311975, 72.138463'),
(317, 5, 'Асса', 'assa', '44.311975, 72.138463'),
(318, 5, 'Байзак', 'bayzak', '44.311975, 72.138463'),
(319, 5, 'Бауыржана-Мамышулы', 'bauyrzhana-mamyshuly', '44.311975, 72.138463'),
(320, 5, 'Жанатас', 'zhanatas', '44.311975, 72.138463'),
(321, 5, 'Каратау', 'karatau', '44.311975, 72.138463'),
(322, 5, 'Кордай', 'korday', '44.311975, 72.138463'),
(323, 5, 'Кулан', 'kulan', '44.311975, 72.138463'),
(324, 5, 'Мерке', 'merke', '44.311975, 72.138463'),
(325, 5, 'Мойынкум', 'moyynkum', '44.311975, 72.138463'),
(326, 5, 'Отар', 'otar', '44.311975, 72.138463'),
(327, 5, 'Сарыкемер', 'sarykemer', '44.311975, 72.138463'),
(328, 5, 'Саудакент', 'saudakent', '44.311975, 72.138463'),
(329, 5, 'Толе-би', 'tole-bi', '44.311975, 72.138463'),
(330, 5, 'Шу', 'shu', '44.311975, 72.138463'),
(331, 5, 'Шыганак', 'shyganak', '44.311975, 72.138463'),
(332, 6, 'Уральск', 'uralsk', '49.813556, 50.675447'),
(333, 6, 'Акжаик', 'akzhaik', '49.813556, 50.675447'),
(334, 6, 'Аксай', 'aksay', '49.813556, 50.675447'),
(335, 6, 'Дарьинское', 'darinskoe', '49.813556, 50.675447'),
(336, 6, 'Жалпактал', 'zhalpaktal', '49.813556, 50.675447'),
(337, 6, 'Жангала', 'zhangala', '49.813556, 50.675447'),
(338, 6, 'Жанибек', 'zhanibek', '49.813556, 50.675447'),
(339, 6, 'Жампиты', 'zhampity', '49.813556, 50.675447'),
(340, 6, 'Казталовка', 'kaztalovka', '49.813556, 50.675447'),
(341, 6, 'Каратобе', 'karatobe', '49.813556, 50.675447'),
(342, 6, 'Переметное', 'peremetnoe', '49.813556, 50.675447'),
(343, 6, 'Сайхин', 'sayhin', '49.813556, 50.675447'),
(344, 6, 'Тайпак', 'taypak', '49.813556, 50.675447'),
(345, 6, 'Таскала', 'taskala', '49.813556, 50.675447'),
(346, 6, 'Трекино', 'trekino', '49.813556, 50.675447'),
(347, 6, 'Федоровка', 'fedorovka', '49.813556, 50.675447'),
(348, 6, 'Чапаев', 'chapaev', '49.813556, 50.675447'),
(349, 6, 'Чингирлау', 'chingirlau', '49.813556, 50.675447'),
(350, 7, 'Балхаш', 'balhash', '48.219942, 70.978720'),
(351, 7, 'Жезказган', 'zhezkazgan', '48.219942, 70.978720'),
(352, 7, 'Караганда', 'karaganda', '48.219942, 70.978720'),
(353, 7, 'Темиртау', 'temirtau', '48.219942, 70.978720'),
(354, 7, 'Абай', 'abay', '48.219942, 70.978720'),
(355, 7, 'Акадыр', 'akadyr', '48.219942, 70.978720'),
(356, 7, 'Аксу-Аюлы', 'aksu-ayuly', '48.219942, 70.978720'),
(357, 7, 'Актас', 'aktas', '48.219942, 70.978720'),
(358, 7, 'Атасу', 'atasu', '48.219942, 70.978720'),
(359, 7, 'Ботакара', 'botakara', '48.219942, 70.978720'),
(360, 7, 'Габидена-Мустафина', 'gabidena-mustafina', '48.219942, 70.978720'),
(361, 7, 'Егиндыбулак', 'egindybulak', '48.219942, 70.978720'),
(362, 7, 'Жайрем', 'zhayrem', '48.219942, 70.978720'),
(363, 7, 'Жезды', 'zhezdy', '48.219942, 70.978720'),
(364, 7, 'Каражал', 'karazhal', '48.219942, 70.978720'),
(365, 7, 'Каркаралинск', 'karkaralinsk', '48.219942, 70.978720'),
(366, 7, 'Киевка', 'kievka', '48.219942, 70.978720'),
(367, 7, 'Молодёжное', 'molodezhnoe', '48.219942, 70.978720'),
(368, 7, 'Оскаровка', 'oskarovka', '48.219942, 70.978720'),
(369, 7, 'Приозёрск', 'priozersk', '48.219942, 70.978720'),
(370, 7, 'Сакена-Сейфуллина', 'sakena-seyfullina', '48.219942, 70.978720'),
(371, 7, 'Сарань', 'saran', '48.219942, 70.978720'),
(372, 7, 'Сарышаган', 'saryshagan', '48.219942, 70.978720'),
(373, 7, 'Сатпаев', 'satpaev', '48.219942, 70.978720'),
(374, 7, 'Топар', 'topar', '48.219942, 70.978720'),
(375, 7, 'Улытау', 'ulytau', '48.219942, 70.978720'),
(376, 7, 'Шахан', 'shahan', '48.219942, 70.978720'),
(377, 7, 'Шахтинск', 'shahtinsk', '48.219942, 70.978720'),
(378, 7, 'Шашубай', 'shashubay', '48.219942, 70.978720'),
(379, 8, 'Костанай', 'kostanay', '51.602478, 64.015555'),
(380, 8, 'Рудный', 'rudnyy', '51.602478, 64.015555'),
(381, 8, 'Амангельды', 'amangeldy', '51.602478, 64.015555'),
(382, 8, 'Аманкарагай', 'amankaragay', '51.602478, 64.015555'),
(383, 8, 'Аркалык', 'arkalyk', '51.602478, 64.015555'),
(384, 8, 'Аулиеколь', 'auliekol', '51.602478, 64.015555'),
(385, 8, 'Боровское', 'borovskoe', '51.602478, 64.015555'),
(386, 8, 'Денисовка', 'denisovka', '51.602478, 64.015555'),
(387, 8, 'Житикара', 'zhitikara', '51.602478, 64.015555'),
(388, 8, 'Затобольск', 'zatobolsk', '51.602478, 64.015555'),
(389, 8, 'Каменскуральское', 'kamenskuralskoe', '51.602478, 64.015555'),
(390, 8, 'Камысты', 'kamysty', '51.602478, 64.015555'),
(391, 8, 'Карабалык', 'karabalyk', '51.602478, 64.015555'),
(392, 8, 'Караменды', 'karamendy', '51.602478, 64.015555'),
(393, 8, 'Карасу', 'karasu', '51.602478, 64.015555'),
(394, 8, 'Качар', 'kachar', '51.602478, 64.015555'),
(395, 8, 'Кушмурун', 'kushmurun', '51.602478, 64.015555'),
(396, 8, 'Лисаковск', 'lisakovsk', '51.602478, 64.015555'),
(397, 8, 'Надеждинка', 'nadezhdinka', '51.602478, 64.015555'),
(398, 8, 'Октябрьское', 'oktyabrskoe', '51.602478, 64.015555'),
(399, 8, 'Сарыколь', 'sarykol', '51.602478, 64.015555'),
(400, 8, 'Тарановское', 'taranovskoe', '51.602478, 64.015555'),
(401, 8, 'Табыл', 'tabyl', '51.602478, 64.015555'),
(402, 8, 'Торгай', 'torgay', '51.602478, 64.015555'),
(403, 8, 'Убаганское', 'ubaganskoe', '51.602478, 64.015555'),
(404, 8, 'Узунколь', 'uzunkol', '51.602478, 64.015555'),
(405, 8, 'Федоровка', 'fedorovka', '51.602478, 64.015555'),
(406, 9, 'Кызылорда', 'kyzylorda', '44.571371, 65.794929'),
(407, 9, 'Айтеке-би', 'ayteke-bi', '44.571371, 65.794929'),
(408, 9, 'Аральск', 'aralsk', '44.571371, 65.794929'),
(409, 9, 'Байконыр', 'baykonyr', '44.571371, 65.794929'),
(410, 9, 'Жалагаш', 'zhalagash', '44.571371, 65.794929'),
(411, 9, 'Жанакорган', 'zhanakorgan', '44.571371, 65.794929'),
(412, 9, 'Жосалы', 'zhosaly', '44.571371, 65.794929'),
(413, 9, 'Казалинск', 'kazalinsk', '44.571371, 65.794929'),
(414, 9, 'Саксаульский', 'saksaulskiy', '44.571371, 65.794929'),
(415, 9, 'Теренозек', 'terenozek', '44.571371, 65.794929'),
(416, 9, 'Шиели', 'shieli', '44.571371, 65.794929'),
(417, 10, 'Актау', 'aktau', '44.122553, 53.722021'),
(418, 10, 'Акшукур', 'akshukur', '44.122553, 53.722021'),
(419, 10, 'Бейнеу', 'beyneu', '44.122553, 53.722021'),
(420, 10, 'Жанаозен', 'zhanaozen', '44.122553, 53.722021'),
(421, 10, 'Жетыбай', 'zhetybay', '44.122553, 53.722021'),
(422, 10, 'Курык', 'kuryk', '44.122553, 53.722021'),
(423, 10, 'Саина-Шапагатова', 'saina-shapagatova', '44.122553, 53.722021'),
(424, 10, 'Форт-Шевченко', 'fort-shevchenko', '44.122553, 53.722021'),
(425, 10, 'Шайыр', 'shayyr', '44.122553, 53.722021'),
(426, 10, 'Шетпе', 'shetpe', '44.122553, 53.722021'),
(427, 11, 'Калкаман', 'kalkaman', '52.068494, 76.242551'),
(428, 11, 'Ленинский', 'leninskiy', '52.068494, 76.242551'),
(429, 11, 'Сольветка', 'solvetka', '52.068494, 76.242551'),
(430, 12, 'Петропавловск', 'petropavlovsk', '53.668040, 67.982794'),
(431, 12, 'Арыкбалык', 'arykbalyk', '53.668040, 67.982794'),
(432, 12, 'Белоградовка', 'belogradovka', '53.668040, 67.982794'),
(433, 12, 'Бишкуль', 'bishkul', '53.668040, 67.982794'),
(434, 12, 'Булаево', 'bulaevo', '53.668040, 67.982794'),
(435, 12, 'Кишкенеколь', 'kishkenekol', '53.668040, 67.982794'),
(436, 12, 'Мамлютка', 'mamlyutka', '53.668040, 67.982794'),
(437, 12, 'Новоишимский', 'novoishimskiy', '53.668040, 67.982794'),
(438, 12, 'Пресновка', 'presnovka', '53.668040, 67.982794'),
(439, 12, 'Саумалколь', 'saumalkol', '53.668040, 67.982794'),
(440, 12, 'Сергеевка', 'sergeevka', '53.668040, 67.982794'),
(441, 12, 'Смирново', 'smirnovo', '53.668040, 67.982794'),
(442, 12, 'Тайынша', 'tayynsha', '53.668040, 67.982794'),
(443, 12, 'Талшик', 'talshik', '53.668040, 67.982794'),
(444, 12, 'Тимирязево', 'timiryazevo', '53.668040, 67.982794'),
(445, 12, 'Чкалово', 'chkalovo', '53.668040, 67.982794'),
(446, 12, 'Явленка', 'yavlenka', '53.668040, 67.982794'),
(447, 13, 'Туркестан', 'turkestan', '44.294764, 68.676347'),
(448, 13, 'Шымкент', 'shymkent', '44.294764, 68.676347'),
(449, 13, 'Абай', 'abay', '44.294764, 68.676347'),
(450, 13, 'Аксукент', 'aksukent', '44.294764, 68.676347'),
(451, 13, 'Арысь', 'arys', '44.294764, 68.676347'),
(452, 13, 'Асыката', 'asykata', '44.294764, 68.676347'),
(453, 13, 'Атакент', 'atakent', '44.294764, 68.676347'),
(454, 13, 'Жетысай', 'zhetysay', '44.294764, 68.676347'),
(455, 13, 'Казыгурт', 'kazygurt', '44.294764, 68.676347'),
(456, 13, 'Карабулак', 'karabulak', '44.294764, 68.676347'),
(457, 13, 'Кентау', 'kentau', '44.294764, 68.676347'),
(458, 13, 'Ленгер', 'lenger', '44.294764, 68.676347'),
(459, 13, 'Сарыагаш', 'saryagash', '44.294764, 68.676347'),
(460, 13, 'Темирлановка', 'temirlanovka', '44.294764, 68.676347'),
(461, 13, 'Турара-Рыскулова', 'turara-ryskulova', '44.294764, 68.676347'),
(462, 13, 'Чулаккурган', 'chulakkurgan', '44.294764, 68.676347'),
(463, 13, 'Шардара', 'shardara', '44.294764, 68.676347'),
(464, 13, 'Шаульдер', 'shaulder', '44.294764, 68.676347'),
(465, 13, 'Шаян', 'shayan', '44.294764, 68.676347');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `kz_city`
--
ALTER TABLE `kz_city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `url` (`url`);
ALTER TABLE `kz_city` ADD FULLTEXT KEY `name` (`name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `kz_city`
--
ALTER TABLE `kz_city`
  MODIFY `city_id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=579;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
