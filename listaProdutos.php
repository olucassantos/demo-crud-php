<?php
    // Conectar ao banco de dados
    $conexao = new PDO('mysql:host=localhost;dbname=supermercado', 'root', '');

    // Cria o SQL para buscar os produtos
    $sql = "SELECT id, nome, preco FROM produtos";

    // Prepara a SQL para evitar SQL Injection
    $con = $conexao->prepare($sql);

    // Executa a SQL
    $con->execute();

    // Armazena os produtos em uma variável
    $produtos = $con->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <title>Supermercados Marion</title>
    </head>

    <body>
        <div class="container">
            <h1>Lista de Produtos</h1>
        
            <table class="table">
                <tr>
                    <th>#</th>
                    <th>Nome</th>
                    <th>Preço</th>
                    <th></th>
                </tr>

                <?php
                    // Executa uma vez para cada produto encontrado na lista de produtos
                    foreach ($produtos as $produto) {
                        echo "<tr>
                                <td>{$produto["id"]}</td>
                                <td>{$produto["nome"]}</td>
                                <td>R$ {$produto["preco"]}</td>
                                <td>
                                    <a class='btn btn-sm btn-success' href='verProduto.php?id={$produto["id"]}'>Ver</a>
                                </td>
                            </tr>";
                    }
                ?>
            </table>
        </div>
    </body>
</html>