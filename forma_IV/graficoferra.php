<?php
$pdo = new PDO("mysql:host=localhost;dbname=ferramentas", "root", "");

$query = $pdo->query("SELECT 
                        DATE(feito_em) AS dia,
                        SUM(acao = 'adicionado') AS adicionados,
                        SUM(acao = 'removido') AS removidos
                      FROM logferramentas
                      GROUP BY DATE(feito_em)
                      ORDER BY dia");

$dados = $query->fetchAll(PDO::FETCH_ASSOC);

header('content-Type: application/json');
echo json_encode($dados);
?>