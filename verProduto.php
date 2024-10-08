<?php
// Conexão com banco de dados
$conexao = new PDO('mysql:host=localhost;dbname=supermercado', 'root', '');

// Cria o SQL para buscar os produtos
$sql = "SELECT * FROM produtos WHERE id = :id";

// Pega o ID da URL
$id = $_GET['id'];

// Prepara a SQL para evitar Invasões
$con = $conexao->prepare($sql);

// Executa a SQL com os parametros
$con->execute([':id' => $id]);

// Guarda o produto na variável
$produto = $con->fetch();
?>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <title>Supermercados Marion - Produto - #<?= $produto['id'] ?></title>
</head>

<body>
    <div class="container">
        <p class="display-3">Nome: <?= $produto['nome'] ?></p>
        <div class="border p-2">
            <p>Preço: R$ <?= $produto['preco'] ?></p>
            <p>Descrição: <?= $produto['descricao'] ?></p>
        </div>

        <div class="mt-3 d-flex gap-2">
            <a class="btn btn-outline-primary btn-sm" href="listaProdutos.php">Voltar</a>
            <a class="ms-auto btn btn-warning btn-sm" href="#">Editar</a>
            <a class="btn btn-danger btn-sm" href="#">Apagar</a>
        </div>
    </div>
</body>

</html>