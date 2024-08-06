<?php
    // Recebe as informações do formulário

    $nome = $_POST['nome']; // Pega o valor do campo nome do POST e armazena na variável $nome
    $preco = $_POST['preco'];
    $descricao = $_POST['descricao'];

    // Variavel para mensagem de retorno
    $mensagem = '';

    // Verifica se as informações estão corretas
    if (empty($nome)) {
        $mensagem = "O campo nome é obrigatório"; // Mensagem de erro
        header("Location: index.php?msg=$mensagem"); // Volta para a tela de cadastro
    } 

    if (empty($preco) || empty($descricao))
    {
        $mensagem = "O campo preço e descrição são obrigatórios";
        header("Location: index.php?msg=$mensagem");
    }

    // Conectar ao banco de dados
    $conexao = new PDO('mysql:host=localhost;dbname=supermercado', 'root', '');

    // Cria a SQL para inserir o produto
    $sql = "INSERT INTO produtos (
                nome, 
                preco, 
                descricao
            ) VALUES (
                :nome,
                :preco,
                :descricao
            )";

    // Prepara a SQL
    $resposta = $conexao->prepare($sql);

    // Executa a SQL
    $resposta->execute([
        ':nome' => $nome,
        ':preco' => $preco,
        ':descricao' => $descricao
    ]);

    // Verificar se deu certo
    $armazenou = $conexao->lastInsertId();

    // Redirecionar para a tela de cadastro
    if ($armazenou) { // Se armazenou for verdadeiro
        $mensagem = "Produto cadastrado com sucesso!";
        header("Location: index.php?msg=$mensagem");
    } else { // Se armazenou for falso
        $mensagem = "Erro ao cadastrar o produto";
        header("Location: index.php?msg=$mensagem");
    }