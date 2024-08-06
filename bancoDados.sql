-- Criação do banco de dados e da tabela produtos

CREATE DATABASE IF NOT EXISTS supermercado;

USE supermercado;

CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    descricao TEXT NOT NULL
);