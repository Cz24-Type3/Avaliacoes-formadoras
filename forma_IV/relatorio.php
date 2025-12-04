<?php
include 'conexao.php';

// TOTAL de ações
$total = $conexao->query("SELECT COUNT(*) AS total_acoes FROM logferramentas")->fetch_assoc()['total_acoes'];

// Quantas foram adicionadas
$adicionados = $conexao->query("SELECT COUNT(*) AS total FROM logferramentas WHERE acao = 'adicionado'")->fetch_assoc()['total'];

// Quantas foram removidas
$removidos = $conexao->query("SELECT COUNT(*) AS total FROM logferramentas WHERE acao = 'removido'")->fetch_assoc()['total'];

// Lista completa de logs
$lista = $conexao->query("
    SELECT 
        logfeid,
        id,
        acao,
        feito_em
    FROM logferramentas
    ORDER BY feito_em DESC
")->fetch_all(MYSQLI_ASSOC);

// Retorna JSON
echo json_encode([
    "totais" => [
        "total" => $total,
        "adicionados" => $adicionados,
        "removidos" => $removidos
    ],
    "lista" => $lista
]);
?>