-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Fev-2021 às 18:08
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `curso`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `categoria_pai_id` int(11) DEFAULT NULL,
  `categoria_nome` varchar(45) NOT NULL,
  `categoria_ativa` tinyint(1) DEFAULT NULL,
  `categoria_meta_link` varchar(100) DEFAULT NULL,
  `categoria_data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `categoria_data_alteracao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `categoria_pai_id`, `categoria_nome`, `categoria_ativa`, `categoria_meta_link`, `categoria_data_criacao`, `categoria_data_alteracao`) VALUES
(7, NULL, 'teste', 1, 'teste', '2021-02-06 14:38:17', '2021-02-06 14:38:17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias_pai`
--

CREATE TABLE `categorias_pai` (
  `categoria_pai_id` int(11) NOT NULL,
  `categoria_pai_nome` varchar(45) NOT NULL,
  `categoria_pai_ativa` tinyint(1) DEFAULT NULL,
  `categoria_pai_meta_link` varchar(100) DEFAULT NULL,
  `categoria_pai_data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `categoria_pai_data_alteracao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias_pai`
--

INSERT INTO `categorias_pai` (`categoria_pai_id`, `categoria_pai_nome`, `categoria_pai_ativa`, `categoria_pai_meta_link`, `categoria_pai_data_criacao`, `categoria_pai_data_alteracao`) VALUES
(5, 'genericos', 1, 'genericos', '2021-02-06 13:54:06', '2021-02-06 13:54:06'),
(6, 'teste2', 1, 'teste2', '2021-02-08 20:12:21', '2021-02-08 20:12:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_correios`
--

CREATE TABLE `config_correios` (
  `config_id` int(11) NOT NULL,
  `config_cep_origem` varchar(20) NOT NULL,
  `config_codigo_pac` varchar(10) NOT NULL,
  `config_codigo_sedex` varchar(10) NOT NULL,
  `config_somar_frete` decimal(10,2) NOT NULL,
  `config_valor_declarado` decimal(5,2) NOT NULL,
  `config_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `config_correios`
--

INSERT INTO `config_correios` (`config_id`, `config_cep_origem`, `config_codigo_pac`, `config_codigo_sedex`, `config_somar_frete`, `config_valor_declarado`, `config_data_alteracao`) VALUES
(1, '80530-000', '04510', '04014', '3.50', '21.50', '2020-05-23 02:11:48');

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_pagseguro`
--

CREATE TABLE `config_pagseguro` (
  `config_id` int(11) NOT NULL,
  `config_email` varchar(255) NOT NULL,
  `config_token` varchar(100) NOT NULL,
  `config_ambiente` tinyint(1) NOT NULL COMMENT '0 -> Ambiente real / 1 -> Ambiente sandbox',
  `config_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `config_pagseguro`
--

INSERT INTO `config_pagseguro` (`config_id`, `config_email`, `config_token`, `config_ambiente`, `config_data_alteracao`) VALUES
(1, 'caiool202020@gmail.com', 'BB162B3FD7324E59A5AE8B3C203B5515', 1, '2021-02-10 01:31:11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'clientes', 'clientes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

CREATE TABLE `marcas` (
  `marca_id` int(11) NOT NULL,
  `marca_nome` varchar(45) NOT NULL,
  `marca_meta_link` varchar(255) NOT NULL,
  `marca_ativa` tinyint(1) DEFAULT NULL,
  `marca_data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `marca_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `marcas`
--

INSERT INTO `marcas` (`marca_id`, `marca_nome`, `marca_meta_link`, `marca_ativa`, `marca_data_criacao`, `marca_data_alteracao`) VALUES
(2, 'EMS', 'ems', 1, '2021-02-05 15:42:20', '2021-02-11 14:35:03'),
(3, 'Aché', 'ache', 1, '2021-02-05 15:42:43', '2021-02-11 14:35:36'),
(4, 'Bayer', 'bayer', 1, '2021-02-11 14:36:04', NULL),
(5, 'Belfar', 'belfar', 1, '2021-02-11 14:36:34', NULL),
(6, 'Biolab', 'biolab', 1, '2021-02-11 14:36:53', NULL),
(7, 'Biosintética', 'biosintetica', 1, '2021-02-11 14:37:02', '2021-02-11 14:37:15'),
(8, 'Farmax', 'farmax', 1, '2021-02-11 14:38:27', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `produto_id` int(11) NOT NULL,
  `produto_codigo` varchar(45) DEFAULT NULL,
  `produto_data_cadastro` timestamp NULL DEFAULT current_timestamp(),
  `produto_categoria_id` int(11) DEFAULT NULL,
  `produto_marca_id` int(11) DEFAULT NULL,
  `produto_nome` varchar(255) DEFAULT NULL,
  `produto_meta_link` varchar(255) DEFAULT NULL,
  `produto_peso` int(11) DEFAULT 0,
  `produto_altura` int(11) DEFAULT 0,
  `produto_largura` int(11) DEFAULT 0,
  `produto_comprimento` int(11) DEFAULT 0,
  `produto_valor` varchar(45) DEFAULT NULL,
  `produto_destaque` tinyint(1) DEFAULT NULL,
  `produto_controlar_estoque` tinyint(1) DEFAULT NULL,
  `produto_quantidade_estoque` int(11) DEFAULT 0,
  `produto_ativo` tinyint(1) DEFAULT NULL,
  `produto_descricao` longtext DEFAULT NULL,
  `produto_data_alteracao` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`produto_id`, `produto_codigo`, `produto_data_cadastro`, `produto_categoria_id`, `produto_marca_id`, `produto_nome`, `produto_meta_link`, `produto_peso`, `produto_altura`, `produto_largura`, `produto_comprimento`, `produto_valor`, `produto_destaque`, `produto_controlar_estoque`, `produto_quantidade_estoque`, `produto_ativo`, `produto_descricao`, `produto_data_alteracao`) VALUES
(7, '43910568', '2021-02-15 16:00:00', 7, 8, 'Nivea Milk 400ml', 'nivea-milk-400ml', 2, 4, 3, 3, '20.00', 1, 1, 4, 1, 'creme nivea para o corpo', NULL),
(8, '82436091', '2021-02-15 16:00:49', 7, 8, 'Alcool em gel', 'alcool-em-gel', 1, 1, 1, 1, '10.00', 1, 1, 5, 1, 'alcool em gel', NULL),
(9, '25831940', '2021-02-15 16:01:22', 7, 2, 'Dorflex com 10cps', 'dorflex-com-10cps', 1, 1, 1, 1, '1.00', 1, 1, 1, 1, 'dorflex com 10 cps', NULL),
(10, '37514260', '2021-02-15 16:33:15', 7, 2, 'Dipirona com 10cps', 'dipirona-com-10cps', 3, 4, 4, 2, '1.00', 1, 1, 4, 1, 'dipirona com 10cps', NULL),
(11, '76538429', '2021-02-15 16:33:52', 7, 8, 'Protetor La roche', 'protetor-la-roche', 2, 3, 4, 3, '70.00', 1, 1, 2, 1, 'protetor solar 70fps', NULL),
(12, '96325014', '2021-02-15 16:35:43', 7, 6, 'Bepantriz pomada', 'bepantriz-pomada', 1, 1, 1, 1, '6.00', 1, 1, 7, 1, 'bepantriz pomada cicatrizante', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_fotos`
--

CREATE TABLE `produtos_fotos` (
  `foto_id` int(11) NOT NULL,
  `foto_produto_id` int(11) DEFAULT NULL,
  `foto_caminho` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos_fotos`
--

INSERT INTO `produtos_fotos` (`foto_id`, `foto_produto_id`, `foto_caminho`) VALUES
(50, 7, 'f535c4f59627fae454957efc1d98abd7.jpg'),
(51, 8, '589225a4db9a5de668c97476026138e9.jpg'),
(52, 9, '0c0dc0a28b2eb400ac56c73606c6694a.jpg'),
(53, 10, '6efca374c1aad03dafda2520e974458a.jpg'),
(54, 11, 'd1c08fb80defa9e292c3ba6ea878d341.jpg'),
(55, 12, '170404348e5fb3a285061cc3b862197a.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sistema`
--

CREATE TABLE `sistema` (
  `sistema_id` int(11) NOT NULL,
  `sistema_razao_social` varchar(145) DEFAULT NULL,
  `sistema_nome_fantasia` varchar(145) DEFAULT NULL,
  `sistema_cnpj` varchar(25) DEFAULT NULL,
  `sistema_ie` varchar(25) DEFAULT NULL,
  `sistema_telefone_fixo` varchar(25) DEFAULT NULL,
  `sistema_telefone_movel` varchar(25) NOT NULL,
  `sistema_email` varchar(100) DEFAULT NULL,
  `sistema_site_url` varchar(100) DEFAULT NULL,
  `sistema_cep` varchar(25) DEFAULT NULL,
  `sistema_endereco` varchar(145) DEFAULT NULL,
  `sistema_numero` varchar(25) DEFAULT NULL,
  `sistema_cidade` varchar(45) DEFAULT NULL,
  `sistema_estado` varchar(2) DEFAULT NULL,
  `sistema_produtos_destaques` int(11) NOT NULL,
  `sistema_texto` tinytext DEFAULT NULL,
  `sistema_data_alteracao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sistema`
--

INSERT INTO `sistema` (`sistema_id`, `sistema_razao_social`, `sistema_nome_fantasia`, `sistema_cnpj`, `sistema_ie`, `sistema_telefone_fixo`, `sistema_telefone_movel`, `sistema_email`, `sistema_site_url`, `sistema_cep`, `sistema_endereco`, `sistema_numero`, `sistema_cidade`, `sistema_estado`, `sistema_produtos_destaques`, `sistema_texto`, `sistema_data_alteracao`) VALUES
(1, 'Loja virtual teste', 'Vende Tudo!', '80.838.809/0001-26', '683.90228-49', '(41) 3232-3030', '(41) 9999-9999', 'vendetudo@contato.com.br', 'http://vendetudo.com.br', '80510-000', 'Rua da Programação', '54', 'Curitiba', 'PR', 6, 'Preço e qualidade!', '2021-02-16 14:51:58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$xtmtJgEYVCey1L20k.RDEO81b1q68x1ah8rnpyO69SSn9cMlS5hkq', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1613483276, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(4, '::1', 'caioteste', '$2y$10$GPzDduhDx8LhhWyf3TQ8J..xSVP/3kq74XR/E2obI95W/LwgOlVzm', 'caio@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1612534050, 1612888701, 1, 'Caio', 'Alves', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(34, 1, 1),
(32, 4, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`),
  ADD KEY `categoria_pai_id` (`categoria_pai_id`);

--
-- Índices para tabela `categorias_pai`
--
ALTER TABLE `categorias_pai`
  ADD PRIMARY KEY (`categoria_pai_id`);

--
-- Índices para tabela `config_correios`
--
ALTER TABLE `config_correios`
  ADD PRIMARY KEY (`config_id`);

--
-- Índices para tabela `config_pagseguro`
--
ALTER TABLE `config_pagseguro`
  ADD PRIMARY KEY (`config_id`);

--
-- Índices para tabela `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`marca_id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`produto_id`),
  ADD KEY `produto_categoria_id` (`produto_categoria_id`),
  ADD KEY `produto_marca_id` (`produto_marca_id`);

--
-- Índices para tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  ADD PRIMARY KEY (`foto_id`),
  ADD KEY `fk_foto_produto_id` (`foto_produto_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Índices para tabela `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `categorias_pai`
--
ALTER TABLE `categorias_pai`
  MODIFY `categoria_pai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `config_pagseguro`
--
ALTER TABLE `config_pagseguro`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `marca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  MODIFY `foto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categoria_pai_id` FOREIGN KEY (`categoria_pai_id`) REFERENCES `categorias_pai` (`categoria_pai_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  ADD CONSTRAINT `fk_foto_produto_id` FOREIGN KEY (`foto_produto_id`) REFERENCES `produtos` (`produto_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
