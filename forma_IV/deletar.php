<?php
include ('conexao.php');
header('Content-Type: application/json; charset=utf-8');

$id = $_GET['id'] ?? null;

if ($id) {

    // 1. REGISTRAR NO LOG QUE FOI REMOVIDO
    $log = $conexao->prepare("INSERT INTO logferramentas (id, acao) VALUES (?, 'removido')");
    $log->bind_param("i", $id);
    $log->execute();
    $log->close();

    // 2. EXCLUIR A FERRAMENTA
    $stmt = $conexao->prepare("DELETE FROM ferramentas WHERE id = ?");
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "mensagem" => "Item deletado com sucesso!"]);
    } else {
        echo json_encode(["success" => false, "mensagem" => "Erro ao deletar: " . $stmt->error]);
    }

    $stmt->close();

} else {
    echo json_encode(["success" => false, "mensagem" => "ID inválido"]);
}
?>