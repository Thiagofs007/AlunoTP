-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Nov-2023 às 17:51
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja_de_brinquedos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id_fornecedor` int(2) NOT NULL,
  `nome_fantasia` varchar(70) NOT NULL,
  `CNPJ` varchar(20) NOT NULL,
  `endereco` varchar(70) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `nome_contato` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id_fornecedor`, `nome_fantasia`, `CNPJ`, `endereco`, `telefone`, `nome_contato`, `email`) VALUES
(3, 'Ri Happy', '58.731.662/0001 -11', 'Av. José Pinheiro Borges - Itaquera, São Paulo - SP', '11 98936-4437', 'Ronaldo Pereira J', 'vendascorporativas@rihappy.com.br'),
(4, 'Mattel', '54.558.002/0001-20', 'R. Verbo Divino, 1488 - Chácara Santo Antônio, São Paulo - SP, 04719-0', '0800 575 0780', 'Ynon Kreiz', 'sac.matteldobrazil@mattel.com'),
(5, 'Glow', '47.167.924/0001-40', ' R. Jaime Ribeiro Wright, 65 - Colônia, São Paulo - SP', '11 95151-7291', 'Carlinhos Maia', 'sac@grow.com.br');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(3) NOT NULL,
  `quantidade` int(2) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `Valor` int(3) NOT NULL,
  `id_fornecedor` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `quantidade`, `descricao`, `Valor`, `id_fornecedor`) VALUES
(2, 20, 'caminhao verde', 110, 3),
(3, 50, 'Barbie sereia magica', 99, 4),
(4, 40, 'War', 180, 5),
(5, 10, 'Uno minimalista', 50, 4),
(6, 50, 'Max Steel', 149, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `id_fornecedor` (`id_fornecedor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id_fornecedor` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
