-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Maio-2022 às 21:23
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `syscash`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `tipo` smallint(6) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `descricao`, `tipo`, `usuario_id`) VALUES
(1, 'Marketing', 2, 1),
(2, 'Revista', 1, 1),
(3, 'nova', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta_pagar`
--

CREATE TABLE `conta_pagar` (
  `id` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `favorecido` varchar(100) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_vencimento` date NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta_receber`
--

CREATE TABLE `conta_receber` (
  `id` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `favorecido` varchar(100) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_vencimento` date NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `conta_receber`
--

INSERT INTO `conta_receber` (`id`, `descricao`, `favorecido`, `valor`, `data_vencimento`, `categoria_id`, `usuario_id`) VALUES
(1, 'teste', 'eu', '2.00', '2022-06-05', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `login`, `senha`) VALUES
(1, 'Eduardo da Silva', 'eduardopsn03@gmail.com', 'admin', '$2y$12$b7bJgA.y7HUL./W3x24f9.Ag3ioEnvqr1VdMseps/87Re6tR4mbra');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categoria_usuario` (`usuario_id`);

--
-- Índices para tabela `conta_pagar`
--
ALTER TABLE `conta_pagar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_conta_pagar_categoria` (`categoria_id`) USING BTREE,
  ADD KEY `fk_conta_pagar_usuario` (`usuario_id`) USING BTREE;

--
-- Índices para tabela `conta_receber`
--
ALTER TABLE `conta_receber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_conta_receber_categoria` (`categoria_id`),
  ADD KEY `fk_conta_receber_usuario` (`usuario_id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `conta_pagar`
--
ALTER TABLE `conta_pagar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `conta_receber`
--
ALTER TABLE `conta_receber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_categoria_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `conta_receber`
--
ALTER TABLE `conta_receber`
  ADD CONSTRAINT `fk_conta_receber_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `fk_conta_receber_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
