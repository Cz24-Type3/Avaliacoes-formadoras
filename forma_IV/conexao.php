<?php
    //conexão com o SQL
    $servidor = "localhost";
    $usuario = "root";
    $senha = "";
    $banco = "ferramentas";//Nome do BD

    //Conexão
    $conexao = new mysqli(hostname:$servidor, username:$usuario,password:$senha,database:$banco);

    //Verificando conexão
    if($conexao->connect_error) {
        die("Erro na conexão: " . $conexao->connect_error);
    }

?>