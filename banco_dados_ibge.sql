-- banco_dados_ibge.sql

CREATE DATABASE IF NOT EXISTS ibge;

USE ibge;

CREATE TABLE IF NOT EXISTS pessoas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    rg VARCHAR(9) NOT NULL
);

CREATE TABLE IF NOT EXISTS generos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS religioes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS sexualidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS profissoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS etnias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS cidades (    
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    cep VARCHAR(8) NOT NULL
);

CREATE TABLE IF NOT EXISTS pesquisas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cidade_id INT NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (cidade_id) REFERENCES cidades(id)
);

CREATE TABLE IF NOT EXISTS RespostasPesquisas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pesquisa_id INT NOT NULL,
    pessoa_id INT NOT NULL,
    genero_id INT NOT NULL,
    religiao_id INT NOT NULL,
    sexualidade_id INT NOT NULL,
    profissao_id INT NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    etnia_id INT NOT NULL,
    FOREIGN KEY (pesquisa_id) REFERENCES pesquisas(id),
    FOREIGN KEY (pessoa_id) REFERENCES pessoas(id),
    FOREIGN KEY (genero_id) REFERENCES generos(id),
    FOREIGN KEY (religiao_id) REFERENCES religioes(id),
    FOREIGN KEY (sexualidade_id) REFERENCES sexualidades(id),
    FOREIGN KEY (profissao_id) REFERENCES profissoes(id),
    FOREIGN KEY (etnia_id) REFERENCES etnias(id)
);