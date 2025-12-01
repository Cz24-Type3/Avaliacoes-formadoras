<?php
include("conexao.php");

$busca = trim($_GET['busca'] ?? '');

if ($busca == '') {
    echo "Digite um nome ou alguma característica da ferramenta para buscar.";
    exit;
}

$sql = "SELECT id, nome, tipo_de_ferramenta, marca, imagem FROM ferramentas 
        WHERE nome LIKE '%$busca%' OR marca LIKE '%$busca%'";
$result = mysqli_query($conexao, $sql);

if (mysqli_num_rows($result) > 0) {

    echo "<table border='1' 

    style='color:black;
    background-color:white;
    width:80%;
    text-align:center;
    margin-left: 11%;
    margin-top: 2%;
    '>";

    echo "<tr'>
    <th></th>
    <th>Nome</th>
    <th>Tipo de ferramenta</th>
    <th>Marca</th> 
    </tr>";

    while ($ferramenta = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>";
            if (!empty($ferramenta['imagem'])) {
                echo "<a href='" . htmlspecialchars($ferramenta['imagem']) . "' target='_blank'>
                <button style='padding:5px;'>📷 Ver Foto</button>
                </a>";
            } else {
                echo "—";
                }
        echo "</td>";
        echo "<td>" . htmlspecialchars($ferramenta['nome']) . "</td>";
        echo "<td>" . htmlspecialchars($ferramenta['tipo_de_ferramenta']) . "</td>";
        echo "<td>" . htmlspecialchars($ferramenta['marca']) . "</td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "Nenhuma ferramenta encontrada.";
}
?>