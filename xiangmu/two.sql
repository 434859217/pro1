-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2020-11-16 09:25:07
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `two`
--

-- --------------------------------------------------------

--
-- 表的结构 `detail`
--

CREATE TABLE `detail` (
  `id` int(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `detail` varchar(100) NOT NULL,
  `price` varchar(50) NOT NULL,
  `src` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- 转存表中的数据 `detail`
--

INSERT INTO `detail` (`id`, `name`, `detail`, `price`, `src`) VALUES
(1, 'Golden Chaplet 金枝', '/第四代巧克力，复刻黑白巧克力慕斯/\r\n/天然的粉色、白色/\r\n/来自日本高知县柚子，和法国覆盆子/\r\n/在这里，色彩即风味/', '298.00元/454g(1.0磅)', 'http://localhost:3000/imgs/d1.jpg'),
(2, 'Framboise Cake 蔓生', '/树莓奶油与浆果慕斯蛋糕/\r\n/蛋糕底部，覆盆子冻干粉喷洒，恰到好处的一抹红晕/', '198.00元/454g(1.0磅)', 'http://localhost:3000/imgs/d2.jpg'),
(3, 'Tofu cheese Cake [豆酪', '/食用前，需要拿出软糖粒儿\r\n撒在蛋糕表面，与蛋糕搭配着吃/', '298.00元/454g(1.0磅)', 'http://localhost:3000/imgs/d3.jpg'),
(4, 'Calamondin&Calamansi', '/像切开一只柑橘鲜果/\r\n/可以细数的，7个风味层次/\r\n/每一层都包含不同柑橘元素/', '198.00元/454g(1.0磅)', 'http://localhost:3000/imgs/d4.jpg'),
(5, 'Deep Bailey Lovers 深', '/奶油中调入玫瑰甘露，整体色泽加深/\r\n/夹心中增加可咀嚼的玫瑰蜜饯，丰富口感/', '398.00元/454g(1.0磅)', 'http://localhost:3000/imgs/d5.jpg'),
(6, 'Café Mocha摩卡', '/世上还有摩卡，就有无尽挣扎/', '398.00元/908g(2.0磅)', 'http://localhost:3000/imgs/d6.jpg'),
(7, 'The Nut Job Big 布莱克', '/比利时黑巧克力与中国榛子，淡苦与干脆，浓香丰满/ \r\nCrazily crisp dark chocolate and kookily nutty fist fulls of Chinese haz', '198.00元/454g(1.0磅)', 'http://localhost:3000/imgs/d7.jpg'),
(8, 'Teatime 浅草', '/“浅草才能没马蹄”/\r\n/切着吃的雨前西湖龙井/\r\n/中国绿茶与爽脆果实，工笔勾勒一杯好茶/\r\n/复杂而纯粹的深浅绿意/', '198.00元/454g(1.0磅)', 'http://localhost:3000/imgs/d8.jpg'),
(9, 'Chestnut Cream （新）栗蓉', '/栗子烘烤的蛋糕坯，鲜栗蓉，点缀手工比利时黑巧克力豆/\r\nChestnuts and real fresh cream go so well together you know this isn’t ', '298.00元/908g(2.0磅)', 'http://localhost:3000/imgs/d9.jpg'),
(10, 'The Moon Cake 中秋坚果芝士', '/远渡重洋而来的坚果，还原记忆深处的果仁浓香/\r\n/月光如果可以凝固，一定是芝士慕斯的味道/\r\nGreat memories are remembered by great food. An asso', '268.00元/454g(1.0磅)', 'http://localhost:3000/imgs/d10.jpg'),
(11, 'Black and White Choc', '/彼尔德联名款--猪年限定版/', '198.00元/454g(1.0磅)', 'http://localhost:3000/imgs/d11.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `list`
--

CREATE TABLE `list` (
  `id` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(20) NOT NULL,
  `src` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `list`
--

INSERT INTO `list` (`id`, `name`, `price`, `src`) VALUES
(1, '金斯', 298, 'http://localhost:3000/imgs/list1.jpg'),
(2, '蔓生', 198, 'http://localhost:3000/imgs/list2.jpg'),
(3, '豆酪', 298, 'http://localhost:3000/imgs/list3.jpg'),
(4, '橙与橘', 198, 'http://localhost:3000/imgs/list4.jpg'),
(5, '深爱', 398, 'http://localhost:3000/imgs/list5.jpg'),
(6, '摩卡', 398, 'http://localhost:3000/imgs/list6.jpg'),
(7, '布莱克', 198, 'http://localhost:3000/imgs/list7.jpg'),
(8, '浅草', 198, 'http://localhost:3000/imgs/list8.jpg'),
(9, '（新）栗蓉暗香', 298, 'http://localhost:3000/imgs/list9.jpg'),
(10, '中秋坚果芝士慕斯', 268, 'http://localhost:3000/imgs/list10.jpg'),
(11, '黑白巧克力慕斯皮尔得', 198, 'http://localhost:3000/imgs/list11.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `shopcar`
--

CREATE TABLE `shopcar` (
  `id` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` varchar(20) NOT NULL,
  `src` varchar(50) NOT NULL,
  `num` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- 转存表中的数据 `shopcar`
--

INSERT INTO `shopcar` (`id`, `name`, `price`, `src`, `num`) VALUES
(1, '金斯', '298', 'http://localhost:3000/imgs/list1.jpg', 1),
(2, '蔓生', '198', 'http://localhost:3000/imgs/list2.jpg', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tpsrc`
--

CREATE TABLE `tpsrc` (
  `id` int(20) NOT NULL,
  `src` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tpsrc`
--

INSERT INTO `tpsrc` (`id`, `src`) VALUES
(1, 'http://localhost:3000/imgs/lbt1.jpg'),
(2, 'http://localhost:3000/imgs/lbt2.jpg'),
(3, 'http://localhost:3000/imgs/lbt3.jpg'),
(4, 'http://localhost:3000/imgs/lbt4.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `use`
--

CREATE TABLE `use` (
  `id` int(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `use`
--

INSERT INTO `use` (`id`, `username`, `password`) VALUES
(0, '123456789', 123456789),
(1, 'dingding', 123456),
(2, 'yutingyang', 123456789);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'yutingyang', 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shopcar`
--
ALTER TABLE `shopcar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tpsrc`
--
ALTER TABLE `tpsrc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `use`
--
ALTER TABLE `use`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `detail`
--
ALTER TABLE `detail`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `list`
--
ALTER TABLE `list`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `shopcar`
--
ALTER TABLE `shopcar`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tpsrc`
--
ALTER TABLE `tpsrc`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
