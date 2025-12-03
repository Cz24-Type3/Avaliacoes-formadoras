-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/12/2025 às 23:48
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
(1, 'Serra Circular', 'Serra', 'Makita', 'img_forma_3/6930bc551669d_serra_circular.webp', '2025-12-03 22:40:21');

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
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `ulogin` (`ulogin`);

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
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `colaboradores`
--
ALTER TABLE `colaboradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ferramentas`
--
ALTER TABLE `ferramentas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `logcolaboradores`
--
ALTER TABLE `logcolaboradores`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `logferramentas`
--
ALTER TABLE `logferramentas`
  MODIFY `logfeid` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `logferramentas_ibfk_1` FOREIGN KEY (`id`) REFERENCES `ferramentas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
