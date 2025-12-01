<?php
include 'conexao.php';
header('Content-Type: application/json; charset=utf-8');

$nome = $_POST['nome'] ?? '';
$tipo = $_POST['tipo'] ?? '';
$marca = $_POST['marca'] ?? '';
$iamgem = null;

//codigo de criação do bd de logferramentas
//CREATE TABLE logferramentas (
//	logfeid INT AUTO_INCREMENT PRIMARY KEY,
//    ferramenta_id INT,
//    acao VARCHAR(20), -- adicionado, removido ou editado--
//    feito_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
//);

//Upload da imagem
if(!empty($_FILES['foto']['name'])) {

    //pasta aonde as imagens vão ficar
    $pasta = __DIR__."/img_forma_3/";//ATENÇÃO Aqui será a pasta

    // Cria a pasta se não existir
    if(!is_dir($pasta)) {
        mkdir($pasta, 0777, true);
    }

    $nomeArquivo = uniqid() . "_".basename($_FILES['foto']['name']);
    $caminho = $pasta . $nomeArquivo;

    if(move_uploaded_file($_FILES['foto']['tmp_name'], $caminho)) { //Linha 24 aqui
        $imagem = "img_forma_3/" . $nomeArquivo;
    }
}

//Inserindo no banco
if($nome && $tipo && $marca) {
    $stmt = $conexao->prepare("INSERT INTO ferramentas (nome, tipo_de_ferramenta, marca, imagem) VALUES (?, ?, ?, ?)"
    );
    $stmt->bind_param("ssss", $nome, $tipo, $marca, $imagem);

    if($stmt->execute()) {

        // Pega o id da ferramenta adicionada
        $ferramenta_id = $conexao->insert_id;
        //Registrando o log
        $log = $conexao->prepare("INSERT INTO logferramentas (id, acao) VALUES (?, 'adicionado')");
        $log->bind_param("i", $ferramenta_id);
        $log->execute();


        echo json_encode([header("location: editar.html")]);
        
    } else {
        echo json_encode(["mensagem" => "Erro ao adicionar: " . $stmt->error]);
    }
    $stmt->close();
} else{
    echo json_encode(["mensagem" => "Dados inválidos!"]);
}
?>