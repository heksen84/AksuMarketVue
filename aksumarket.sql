-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 27 2018 г., 17:14
-- Версия сервера: 5.6.34
-- Версия PHP: 7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `aksumarket`
--

-- --------------------------------------------------------

--
-- Структура таблицы `adverts`
--

CREATE TABLE `adverts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `contacts` varchar(255) NOT NULL,
  `price` int(7) UNSIGNED NOT NULL,
  `category_id` int(2) UNSIGNED NOT NULL,
  `ad_category_id` int(10) UNSIGNED NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `adverts`
--

INSERT INTO `adverts` (`id`, `user_id`, `title`, `text`, `contacts`, `price`, `category_id`, `ad_category_id`, `updated_at`, `created_at`) VALUES
(1, 2, '123', '123', 'sdfsdfsdf', 555, 6, 1, '2018-06-21 07:37:28', '2018-06-21 07:37:28'),
(2, 2, 'qwdqwdfqw', '123qwdqwdqwdqwd', 'sdfsdfsdf', 555, 8, 1, '2018-06-21 07:37:58', '2018-06-21 07:37:58'),
(3, 2, 'Продам тачку', 'Продам новую тачку', 'sdfsdfsdf', 555, 3, 1, '2018-06-21 07:48:49', '2018-06-21 07:48:49'),
(4, 2, '123123123', '123123123', 'sdfsdfsdf', 12345, 7, 1, '2018-06-21 08:12:20', '2018-06-21 08:12:20'),
(5, 2, 'укпукп', 'укпукпукп', 'sdfsdfsdf', 4444, 6, 1, '2018-06-21 08:13:44', '2018-06-21 08:13:44'),
(6, 2, 'Чё-то', 'Чё-то описание', 'sdfsdfsdf', 666, 1, 1, '2018-06-21 09:26:45', '2018-06-21 09:26:45'),
(7, 2, 'Super', 'SuperMan', 'sdfsdfsdf', 888, 1, 1, '2018-06-21 10:11:02', '2018-06-21 10:11:02');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'транспорт'),
(2, 'недвижимость'),
(3, 'бытовая техника'),
(4, 'работа и бизнес'),
(5, 'для дома и дачи'),
(6, 'личные вещи'),
(7, 'животные'),
(8, 'хобби и отдых'),
(9, 'услуги'),
(10, 'другое');

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE `city` (
  `city_id` int(11) UNSIGNED NOT NULL,
  `region_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`city_id`, `region_id`, `name`) VALUES
(1896, 1895, 'Актюбинск'),
(1897, 1895, 'Акшам'),
(1898, 1895, 'Алга'),
(1899, 1895, 'Байганин'),
(1900, 1895, 'Батамшинский'),
(1901, 1895, 'Иргиз'),
(1902, 1895, 'Карабутак'),
(1903, 1895, 'Мартук'),
(1904, 1895, 'Новоалексеевка'),
(1905, 1895, 'Октябрьск'),
(1906, 1895, 'Уил'),
(1907, 1895, 'Хромтау'),
(1908, 1895, 'Челкар'),
(1909, 1895, 'Шубаркудук'),
(1910, 1895, 'Эмба'),
(1912, 1911, 'Алма-Ата'),
(1913, 1911, 'Алматы'),
(1914, 1911, 'Баканас'),
(1915, 1911, 'Бурундай'),
(1916, 1911, 'Иссык'),
(1917, 1911, 'Капчагай'),
(1918, 1911, 'Каскелен'),
(1919, 1911, 'Нарынкол'),
(1920, 1911, 'Талгар'),
(1921, 1911, 'Узунагач'),
(1922, 1911, 'Чилик'),
(1923, 1911, 'Чунджа'),
(1925, 1924, 'Акжар'),
(1926, 1924, 'Алексеевка'),
(1927, 1924, 'Асубулак'),
(1928, 1924, 'Белогорский'),
(1929, 1924, 'Белоусовка'),
(1930, 1924, 'Верхнеберезовский'),
(1931, 1924, 'Глубокое'),
(1932, 1924, 'Зайсан'),
(1933, 1924, 'Зыряновск'),
(1934, 1924, 'Карагужиха'),
(1935, 1924, 'Катон-Карагай'),
(1936, 1924, 'Курчум'),
(1937, 1924, 'Лениногорск'),
(1938, 1924, 'Самарское'),
(1939, 1924, 'Серебрянск'),
(1940, 1924, 'Усть-Каменогорск'),
(1941, 1924, 'Шемонаиха'),
(1943, 1942, 'Байчунас'),
(1944, 1942, 'Балыкши'),
(1945, 1942, 'Ганюшкино'),
(1946, 1942, 'Атырау(Гурьев)'),
(1947, 1942, 'Доссор'),
(1948, 1942, 'Индерборский'),
(1949, 1942, 'Искининский'),
(1950, 1942, 'Каратон'),
(1951, 1942, 'Кульсары'),
(1952, 1942, 'Макат'),
(1953, 1942, 'Миялы'),
(1955, 1954, 'Акколь'),
(1956, 1954, 'Байкадам'),
(1957, 1954, 'Брлик'),
(1958, 1954, 'Бурное'),
(1959, 1954, 'Георгиевка'),
(1960, 1954, 'Гранитогорск'),
(1961, 1954, 'Джамбул'),
(1962, 1954, 'Жанатас'),
(1963, 1954, 'Каратау'),
(1964, 1954, 'Коктал'),
(1965, 1954, 'Луговое'),
(1966, 1954, 'Мерке'),
(1967, 1954, 'Михайловка'),
(1968, 1954, 'Новотроицкое'),
(1969, 1954, 'Ойтал'),
(1970, 1954, 'Отар'),
(1971, 1954, 'Фурмановка'),
(1972, 1954, 'Чиганак'),
(1973, 1954, 'Чу'),
(1975, 1974, 'Агадырь'),
(1976, 1974, 'Акжал'),
(1977, 1974, 'Актас'),
(1978, 1974, 'Актогай'),
(1979, 1974, 'Атасу'),
(1980, 1974, 'Балхаш'),
(1981, 1974, 'Восточно-Коунрадский'),
(1982, 1974, 'Гульшад'),
(1983, 1974, 'Дарьинский'),
(1984, 1974, 'Джамбул'),
(1985, 1974, 'Джезды'),
(1986, 1974, 'Джезказган'),
(1987, 1974, 'Жарык'),
(1988, 1974, 'Кайракты'),
(1989, 1974, 'Каражал'),
(1990, 1974, 'Никольский'),
(1991, 1974, 'Сарышаган'),
(1992, 1974, 'Тараз'),
(1993, 1974, 'Улытау'),
(1995, 1994, 'Абай'),
(1996, 1994, 'Актас'),
(1997, 1994, 'Актау'),
(1998, 1994, 'Егиндыбулак'),
(1999, 1994, 'Карагайлы'),
(2000, 1994, 'Караганда'),
(2001, 1994, 'Каркаралинск'),
(2002, 1994, 'Киевка'),
(2003, 1994, 'Осакаровка'),
(2004, 1994, 'Сарань'),
(2005, 1994, 'Темиртау'),
(2006, 1994, 'Токаревка'),
(2007, 1994, 'Топар'),
(2008, 1994, 'Ульяновский'),
(2009, 1994, 'Шахтинск'),
(2011, 2010, 'Аралсульфат'),
(2012, 2010, 'Аральск'),
(2013, 2010, 'Джалагаш'),
(2014, 2010, 'Джусалы'),
(2015, 2010, 'Казалинск'),
(2016, 2010, 'Кзыл-Орда'),
(2017, 2010, 'Новоказалинск'),
(2018, 2010, 'Тасбугет'),
(2019, 2010, 'Чиили'),
(2020, 2010, 'Яныкурган'),
(2022, 2021, 'Айдабул'),
(2023, 2021, 'Алексеевка'),
(2024, 2021, 'Боровое'),
(2025, 2021, 'Володарское'),
(2026, 2021, 'Зеренда'),
(2027, 2021, 'Келлеровка'),
(2028, 2021, 'Кзылту'),
(2029, 2021, 'Кокчетав'),
(2030, 2021, 'Красноармейск'),
(2031, 2021, 'Красный Яр'),
(2032, 2021, 'Куйбышевский'),
(2033, 2021, 'Ленинградское'),
(2034, 2021, 'Рузаевка'),
(2035, 2021, 'Степняк'),
(2036, 2021, 'Талшик'),
(2037, 2021, 'Чистополье'),
(2038, 2021, 'Чкалово'),
(2039, 2021, 'Щучинск'),
(2041, 2040, 'Боровской'),
(2042, 2040, 'Джетыгара'),
(2043, 2040, 'Затобольск'),
(2044, 2040, 'Камышное'),
(2045, 2040, 'Комсомолец'),
(2046, 2040, 'Кустанай'),
(2047, 2040, 'Кушмурун'),
(2048, 2040, 'Ленинское'),
(2049, 2040, 'Лисаковск'),
(2050, 2040, 'Орджоникидзе'),
(2051, 2040, 'Рудный'),
(2052, 2040, 'Семиозерное'),
(2053, 2040, 'Тобол'),
(2054, 2040, 'Урицкий'),
(2056, 2055, 'Баутино'),
(2057, 2055, 'Бейнеу'),
(2058, 2055, 'Новый Узень'),
(2059, 2055, 'Форт-Шевченко'),
(2060, 2055, 'Шевченко'),
(2062, 2061, 'Баянаул'),
(2063, 2061, 'Аксу'),
(2064, 2061, 'Железинка'),
(2065, 2061, 'Иртышск'),
(2066, 2061, 'Калкаман'),
(2067, 2061, 'Краснокутск'),
(2068, 2061, 'Лебяжье'),
(2069, 2061, 'Майкаин'),
(2070, 2061, 'Павлодар'),
(2071, 2061, 'Успенка'),
(2072, 2061, 'Щербакты'),
(2073, 2061, 'Экибастуз'),
(2075, 2074, 'Благовещенка'),
(2076, 2074, 'Булаево'),
(2077, 2074, 'Корнеевка'),
(2078, 2074, 'Мамлютка'),
(2079, 2074, 'Петропавловск'),
(2080, 2074, 'Пресновка'),
(2081, 2074, 'Сергеевка'),
(2082, 2074, 'Соколовка'),
(2083, 2074, 'Явленка'),
(2085, 2084, 'Акжал'),
(2086, 2084, 'Аксуат'),
(2087, 2084, 'Ауэзов'),
(2088, 2084, 'Аягуз'),
(2089, 2084, 'Баршатас'),
(2090, 2084, 'Бельагаш'),
(2091, 2084, 'Боко'),
(2092, 2084, 'Большая Владимировка'),
(2093, 2084, 'Бородулиха'),
(2094, 2084, 'Георгиевка'),
(2095, 2084, 'Жангизтобе'),
(2096, 2084, 'Жарма'),
(2097, 2084, 'Кайнар'),
(2098, 2084, 'Кокпекты'),
(2099, 2084, 'Маканчи'),
(2100, 2084, 'Новая Шульба'),
(2101, 2084, 'Семипалатинск'),
(2102, 2084, 'Таскескен'),
(2103, 2084, 'Урджар'),
(2104, 2084, 'Чарск'),
(2106, 2105, 'Актогай'),
(2107, 2105, 'Андреевка'),
(2108, 2105, 'Джансугуров'),
(2109, 2105, 'Капал'),
(2110, 2105, 'Карабулак'),
(2111, 2105, 'Кировский'),
(2112, 2105, 'Кугалы'),
(2113, 2105, 'Панфилов'),
(2114, 2105, 'Сарканд'),
(2115, 2105, 'Сарыозек'),
(2116, 2105, 'Талды-Курган'),
(2117, 2105, 'Текели'),
(2118, 2105, 'Учарал'),
(2119, 2105, 'Уштобе'),
(2121, 2120, 'Амангельды'),
(2122, 2120, 'Аркалык'),
(2123, 2120, 'Державинск'),
(2124, 2120, 'Есиль'),
(2125, 2120, 'Жаксы'),
(2126, 2120, 'Октябрьское'),
(2127, 2120, 'Тургай'),
(2129, 2128, 'Акбеит'),
(2130, 2128, 'Акмолинск'),
(2131, 2128, 'Аксу'),
(2132, 2128, 'Алексеевка'),
(2133, 2128, 'Астана'),
(2134, 2128, 'Астраханка'),
(2135, 2128, 'Атабасар'),
(2136, 2128, 'Балкащино'),
(2137, 2128, 'Бестобе'),
(2138, 2128, 'Вишневка'),
(2139, 2128, 'Ерментау'),
(2140, 2128, 'Жалтыр'),
(2141, 2128, 'Жолымбет'),
(2142, 2128, 'Кургальджинский'),
(2143, 2128, 'Макинск'),
(2144, 2128, 'Целиноград'),
(2145, 2128, 'Шортанды'),
(2147, 2146, 'Арысь'),
(2148, 2146, 'Ачисай'),
(2149, 2146, 'Байжансай'),
(2150, 2146, 'Белые Воды'),
(2151, 2146, 'Ванновка'),
(2152, 2146, 'Джетысай'),
(2153, 2146, 'Кентау'),
(2154, 2146, 'Ленгер'),
(2155, 2146, 'Сарыагач'),
(2156, 2146, 'Темирлановка'),
(2157, 2146, 'Туркестан'),
(2158, 2146, 'Чардара'),
(2159, 2146, 'Чаян'),
(2160, 2146, 'Чимкент'),
(2161, 2146, 'Чулаккурган'),
(2162, 2146, 'Шаульдер'),
(278013, 277655, 'Ак-Коль'),
(278014, 277655, 'Актобе'),
(278015, 277655, 'Акший'),
(278016, 277655, 'Аршалы'),
(278017, 277655, 'Атбасар'),
(278018, 277655, 'Атырау'),
(278019, 277655, 'Балкашино'),
(278020, 277655, 'Жезказган'),
(278021, 277655, 'Кокшетау'),
(278022, 277655, 'Костанай'),
(278023, 277655, 'Курчатов'),
(278024, 277655, 'Кызылорда'),
(278025, 277655, 'Махамбет'),
(278026, 277655, 'Уральск'),
(278027, 277655, 'Шымкент'),
(2564724, 2564700, 'Степногорск'),
(4211196, 277655, 'Байконур'),
(4778059, 2564700, 'Астана'),
(11568523, 1934356, 'Атырау'),
(12367130, 1934356, 'Уральска');

-- --------------------------------------------------------

--
-- Структура таблицы `dealtype`
--

CREATE TABLE `dealtype` (
  `id` int(2) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `advert_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `name`, `advert_id`, `user_id`) VALUES
(4, '3d05c77e38.jpg', 5, 5),
(5, '3f541ebeb0.jpg', 6, 6),
(6, '68baf84edc.png', 7, 6),
(7, '06c7b924da.jpg', 14, 6),
(8, 'ec611f2a8f.jpg', 15, 6),
(12, '66c6d993b5.jpg', 19, 6),
(15, 'e77341156f.jpg', 22, 6),
(16, '03a35e0c86.jpg', 23, 6),
(17, 'f62c427a84.jpg', 24, 6),
(18, '643f4cafd2.jpg', 25, 6),
(19, 'fb2bb9a832.jpg', 26, 6),
(20, '281a38942a.jpg', 27, 6),
(21, 'e9a82d47f2.jpg', 28, 6),
(22, 'c94e67e396.jpg', 29, 6),
(23, 'df0444dc57.jpg', 30, 6),
(24, 'ea30a470ab.jpg', 31, 6),
(25, '533541a245.jpg', 32, 6),
(26, '918cac9eb0.jpg', 33, 6),
(28, 'b13c8b484e.jpg', 38, 6),
(29, '69f7cea1b9.jpg', 39, 6),
(30, '09eb2edc4b.jpg', 40, 6),
(31, '3ad19efec0.png', 40, 6),
(32, '266e29fde5.jpg', 40, 6),
(33, 'b3dc3a6c15.jpg', 40, 6),
(34, '3202974346.jpg', 40, 6),
(35, 'd463c05cc4.jpg', 53, 6),
(36, '5e5ef813ea.jpg', 53, 6),
(37, '8877c2f7a7.png', 53, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_06_05_144053_create_sessions_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `region`
--

CREATE TABLE `region` (
  `region_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `region`
--

INSERT INTO `region` (`region_id`, `name`) VALUES
(1895, 'Актюбинская обл.'),
(1911, 'Алма-Атинская обл.'),
(1924, 'Восточно-Казахстанская обл.'),
(1942, 'Гурьевская обл.'),
(1954, 'Джамбулская обл.'),
(1974, 'Джезказганская обл.'),
(1994, 'Карагандинская обл.'),
(2010, 'Кзыл-Ординская обл.'),
(2021, 'Кокчетавская обл.'),
(2040, 'Кустанайская обл.'),
(2055, 'Мангышлакская обл.'),
(2061, 'Павлодарская обл.'),
(2074, 'Северо-Казахстанская обл.'),
(2084, 'Семипалатинская обл.'),
(2105, 'Талды-Курганская обл.'),
(2120, 'Тургайская обл.'),
(2128, 'Целиноградская обл.'),
(2146, 'Чимкентская обл.'),
(277655, 'Казахстан'),
(1934356, 'Западно-Казахстанская обл.'),
(2564700, 'Акмолинская обл.');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '123', '123@mail.ru1', '$2y$10$ddgkchcG9zZ5LlJdcDzXJuSEHrSWsMe7Ve93MrLdH1dmZ96XCW.Ky', '6FiOtqfSc3UiBWA0jmutGtf3fuzLkA9Pe35sBNx57ynsplFQwDYxARJpmGgc', '2018-05-30 08:53:18', '2018-05-30 08:53:18'),
(2, 'Илья', 'heksen84@yandex.ru', '$2y$10$wQPxP3jSzPHTBa7hpmhPaedXz/tqgVbJJUcrEeYbp7jNnBh8Iltsi', 'XIg95Hzenpem9SIAQfafdWFMIznUSmCQMU34H03O2kJtcjfth4nFccudLMv3', '2018-05-30 09:39:11', '2018-05-30 09:39:11');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `adverts`
--
ALTER TABLE `adverts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `region_id` (`region_id`);

--
-- Индексы таблицы `dealtype`
--
ALTER TABLE `dealtype`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `adverts`
--
ALTER TABLE `adverts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12367131;
--
-- AUTO_INCREMENT для таблицы `dealtype`
--
ALTER TABLE `dealtype`
  MODIFY `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `region`
--
ALTER TABLE `region`
  MODIFY `region_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2564701;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
