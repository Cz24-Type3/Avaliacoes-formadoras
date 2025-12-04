<?php
session_start();
include("conexao.php");

// Verifica se o usuário está logado
if (!isset($_SESSION['id'])) {
    header("Location: index.html");
    exit();
}

$id = $_SESSION['id'];

// Registra logout
$stmt = $conexao->prepare("INSERT INTO logcolaboradores (id, acao) VALUES (?, 'logout')");
$stmt->bind_param("i", $id);
$stmt->execute();

// Limpa sessões
session_unset();
session_destroy();

// Redireciona
header("Location: index.html");
exit();
?>
