<?php
include ('conexao.php');

$sql = "SELECT id, nome, tipo_de_ferramenta, marca, imagem FROM ferramentas";
$result = $conexao->query($sql);

$dados = [];

while ($linha = $result->fetch_assoc()) {
    $dados[] = $linha;
};

echo json_encode($dados);
?>