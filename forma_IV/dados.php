<?php
$pdo = new PDO("mysql:host=localhost;dbname=ferramentas", "root", "");



$sql = $pdo->query(
    "SELECT DATE(feito_em) AS dia, COUNT(*) AS total
    FROM logcolaboradores
    WHERE acao = 'login'
    GROUP BY DATE(feito_em)
    ORDER BY dia ASC
    ");

$dados = $sql->fetchALL(PDO::FETCH_ASSOC);

echo json_encode($dados);

?>