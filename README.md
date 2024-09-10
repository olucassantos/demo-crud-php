# Conectando e armazenando no banco de dados com PHP

https://github.com/olucassantos/demo-crud-php

## Introdução

Neste artigo, vamos aprender como conectar e armazenar dados em um banco de dados MySQL usando PHP. Vamos criar um formulário HTML para coletar dados do usuário e, em seguida, armazenar esses dados no banco de dados MySQL usando PHP.

## 1 - Criando o formulário HTML

Primeiro, vamos criar um formulário HTML para coletar dados do usuário. O formulário irá armazenar um produto com nome, preço e descrição. 

 - Cada campo precisa de um nome para que possamos acessar os dados do formulário usando PHP.
 - O formulário deve ter um método de envio POST para enviar os dados do formulário para o servidor.
 - O formulário deve ter um botão de envio para enviar os dados do formulário para o servidor.
 - O formulário deve ter um atributo `action` que aponta para o arquivo PHP que processará os dados do formulário.

> Verifique o arquivo `index.php` para o código HTML do formulário.

## 2 - Conectando ao banco de dados MySQL

Depois de criado o formulário é necessário lidar com as informações enviadas pelo usuário. Para isso, vamos criar um arquivo PHP chamado `armazenaProduto.php` que irá lidar com os dados do formulário.

Vamos utilizar uma biblioteca chamada PDO para conectar e interagir com o banco de dados MySQL. A biblioteca PDO fornece uma interface de acesso a dados consistente para trabalhar com diferentes tipos de bancos de dados.

- Para conectar ao banco de dados MySQL, você precisa criar uma instância da classe `PDO` e passar o nome do banco de dados, nome de usuário e senha como argumentos para o construtor da classe `PDO`. Ex:
```php
    $conexao = new PDO('mysql:host=localhost;dbname=supermercado', 'root', '');
```

Depois de criar a instância da classe `PDO`, você pode preparar uma consulta SQL usando o método `prepare` da instância da classe `PDO`. Ele serve para preparar uma consulta SQL para execução e retorna um objeto de instrução que você pode usar para executar a consulta. Ex:
```php
    $state = $conexao->prepare($sql);
```

Depois de preparar a consulta SQL, você pode executá-la usando o método `execute` do objeto de instrução. Ex:
```php
    $state->execute();
```

> É necessário passar as informações para o codigo que será executado:

```php
    $state->execute([
        ':nome' => $nome,
        ':preco' => $preco,
        ':descricao' => $descricao
    ]);
```

Para garantir que a operação foi concluida com sucesso, podemos pegar o ID do último registro inserido no banco de dados usando o método `lastInsertId` da instância da classe `PDO`. Ex:
```php
    $id = $conexao->lastInsertId();
```

Com isso podemos verificar se o produto foi inserido corretamente no banco de dados.

```php	
    if ($id) { // Se armazenou for verdadeiro
        $mensagem = "Produto cadastrado com sucesso!";
        header("Location: index.php?msg=$mensagem");
    } else { // Se armazenou for falso
        $mensagem = "Erro ao cadastrar o produto";
        header("Location: index.php?msg=$mensagem");
    }
```

> No exemplo acima estamos redirecionando o usuário para a página inicial com uma mensagem de sucesso ou erro. Baseado no retorno da função `lastInsertId`.

> Verifique o arquivo `armazenaProduto.php` para o código PHP que conecta e armazena os dados no banco de dados MySQL.

## Criando o Banco de Dados MySQL

O PHP vai se conectar a um banco de dados MySQL chamado `supermercado`. Vamos criar um banco de dados chamado `supermercado` e uma tabela chamada `produtos` para armazenar os produtos.

- Para criar o banco de dados `supermercado`, execute o seguinte comando SQL:
```sql
    CREATE DATABASE supermercado;
```

- Para criar a tabela `produtos`, execute o seguinte comando SQL:
```sql
    CREATE TABLE produtos (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(100) NOT NULL,
        preco DECIMAL(10, 2) NOT NULL,
        descricao TEXT NOT NULL
    );
```

O código deve ser executado em algum SGBD (Sistema Gerenciador de Banco de Dados) como o MySQL Workbench, phpMyAdmin, HeidiSQL, etc. Ou pode ser executado diretamente no terminal do MySQL.

> Verifique o arquivo `bancoDados.sql` para o código SQL que cria o banco de dados e a tabela.


## Executando o projeto

Para executar o projeto, você precisa de um servidor web com PHP e MySQL instalados. Você pode usar o XAMPP, WAMP, MAMP ou qualquer outro pacote de servidor web que inclua PHP e MySQL.

Também é possivel utilizar o servidor embutido do PHP. Para isso, basta executar o seguinte comando no terminal:

```bash
    php -S localhost:8000
```

Depois de executar o servidor, abra o navegador e acesse `http://localhost:8000` para ver o formulário HTML. Preencha o formulário e envie os dados. Os dados serão armazenados no banco de dados MySQL.

## Criação da listagem de produtos

No arquivo `listaProdutos.php` foi criado um código PHP para listar os produtos cadastrados no banco de dados. O código PHP se conecta ao banco de dados, executa uma consulta SQL para selecionar todos os produtos da tabela `produtos` e exibe os produtos em uma tabela HTML.

- Para listar os produtos, é necessário criar uma instancia do PDO e preparar a consulta SQL para selecionar todos os produtos da tabela `produtos`. Ex:
```php
    $state = $conexao->prepare("SELECT id, nome, preco FROM produtos");
```

O comando `prepare()` prepara o código de SQL evitando SQL Injection. O método `execute()` executa a consulta SQL e o método `fetchAll()` retorna todas as linhas do resultado da consulta como um array.

```php
    $state->execute(); // Executa a consulta SQL

    $produtos = $state->fetchAll(); // Retorna todas as linhas do resultado da consulta como um array na variável $produtos
```

Com a lista de produtos na variável podemos fazer um laço de repetição para mostrar os produtos em uma tabela.

```php
    foreach ($produtos as $produto) {
        echo "<tr>";
        echo "<td>{$produto['id']}</td>";
        echo "<td>{$produto['nome']}</td>";
        echo "<td>{$produto['preco']}</td>";
        echo "</tr>";
    }
```

> Verifique o arquivo `listaProdutos.php` para o código PHP que lista os produtos cadastrados no banco de dados.

## Conclusão

Neste artigo, aprendemos como conectar e armazenar dados em um banco de dados MySQL usando PHP. Criamos um formulário HTML para coletar dados do usuário e, em seguida, armazenamos esses dados no banco de dados MySQL usando PHP.