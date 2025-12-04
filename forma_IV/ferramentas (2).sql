-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/12/2025 às 22:28
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ferramentas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `colaboradores`
--

CREATE TABLE `colaboradores` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `ulogin` varchar(255) NOT NULL,
  `usenha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `colaboradores`
--

INSERT INTO `colaboradores` (`id`, `nome`, `email`, `cpf`, `ulogin`, `usenha`) VALUES
(1, 'João Pedro', 'joao@gmail.com', '1567008700', 'joao', '$2y$10$Qm27ARv7xEQAognSesxZpO3mB92hTzeRsPO36XSJb0mAn12/hAOw6'),
(2, 'Leonardo Pires', 'leo@gmail.com', '156.700.807-00', 'leo', '$2y$10$/kCfUwl9nlNih8NjsaM5Nu/eKyltL3.EBrS2g7x2hdoB.sgXwf7mu'),
(3, 'Gloria Maria', 'gloria@outlook.com', '488.103.990-30', 'gloria', '$2y$10$pY3L7JYkLle.GpQtiZKkOuaiWb9e.eCS/fR2yK1brcZosZvQHcnb2');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ferramentas`
--

CREATE TABLE `ferramentas` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `tipo_de_ferramenta` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `adicionado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ferramentas`
--

INSERT INTO `ferramentas` (`id`, `nome`, `tipo_de_ferramenta`, `marca`, `imagem`, `adicionado_em`) VALUES
(27, 'Chave de boca fixa', 'chave', 'Eletrimaq', 'img_forma_3/692ce9d6c3c20_chave_de_boca_fixa_eletrimaq.webp', '2025-12-01 01:05:26'),
(28, 'Chave inglesa', 'chave', 'martineli', 'img_forma_3/692ce9f083a13_chave_inglesa.webp', '2025-12-01 01:05:52'),
(29, 'Torquimetro', 'Precisão', 'Stanley', 'img_forma_3/692cfecdc8d11_Torquimetro stanley.jpg', '2025-12-01 02:34:53');

-- --------------------------------------------------------

--
-- Estrutura para tabela `logcolaboradores`
--

CREATE TABLE `logcolaboradores` (
  `logid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `acao` enum('login','logout') NOT NULL,
  `feito_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `logcolaboradores`
--

INSERT INTO `logcolaboradores` (`logid`, `id`, `acao`, `feito_em`) VALUES
(1, 1, 'login', '2025-11-29 05:04:52'),
(2, 1, 'login', '2025-11-29 06:27:10'),
(3, 2, 'login', '2025-11-29 06:27:24'),
(4, 2, 'login', '2025-11-29 06:27:30'),
(5, 1, 'login', '2025-11-30 23:39:04'),
(6, 3, 'login', '2025-12-01 02:26:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `logferramentas`
--

CREATE TABLE `logferramentas` (
  `logfeid` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `acao` varchar(20) DEFAULT NULL,
  `feito_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `logferramentas`
--

INSERT INTO `logferramentas` (`logfeid`, `id`, `acao`, `feito_em`) VALUES
(11, 27, 'adicionado', '2025-12-01 01:05:26'),
(12, 28, 'adicionado', '2025-12-01 01:05:52'),
(13, 29, 'adicionado', '2025-12-01 02:34:53');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`cpf`,`ulogin`);

--
-- Índices de tabela `ferramentas`
--
ALTER TABLE `ferramentas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `logcolaboradores`
--
ALTER TABLE `logcolaboradores`
  ADD PRIMARY KEY (`logid`),
  ADD KEY `id` (`id`);

--
-- Índices de tabela `logferramentas`
--
ALTER TABLE `logferramentas`
  ADD PRIMARY KEY (`logfeid`),
  ADD KEY `fk_logferramentas` (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `colaboradores`
--
ALTER TABLE `colaboradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `ferramentas`
--
ALTER TABLE `ferramentas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `logcolaboradores`
--
ALTER TABLE `logcolaboradores`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `logferramentas`
--
ALTER TABLE `logferramentas`
  MODIFY `logfeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `logcolaboradores`
--
ALTER TABLE `logcolaboradores`
  ADD CONSTRAINT `logcolaboradores_ibfk_1` FOREIGN KEY (`id`) REFERENCES `colaboradores` (`id`);

--
-- Restrições para tabelas `logferramentas`
--
ALTER TABLE `logferramentas`
  ADD CONSTRAINT `fk_logferramentas` FOREIGN KEY (`id`) REFERENCES `ferramentas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
