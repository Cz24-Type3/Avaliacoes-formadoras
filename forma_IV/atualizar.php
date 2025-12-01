<?php
include 'conexao.php';
header('Content-Type: application/json; charset=utf-8');

$id = $_POST['id'] ?? null;
$nome = $_POST['nome'] ?? '';
$tipo = $_POST['tipo'] ?? '';
$marca = $_POST['marca'] ?? '';

if ($id) {
    $sql = "UPDATE ferramentas 
        SET nome='$nome', tipo_de_ferramenta='$tipo', marca='$marca' 
        WHERE id=$id";
    if ($conexao->query($sql)) {
        echo json_encode(["mensagem" => "Item atualizado com sucesso!"]);
    } else {
        echo json_encode(["mensagem" => "Erro ao atualizar: " . $conexao->error]);
    }
} else {
    echo json_encode(["mensagem" => "ID inválido"]);
}
?>