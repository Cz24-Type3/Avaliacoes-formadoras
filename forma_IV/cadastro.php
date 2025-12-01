<?php
include('conexao.php');

//Função para validar o CPF TALVEZ EU A DEVA COLOCAR NO FINAL DA PAGINA
function validarCPF($cpf) {
        $cpf = preg_replace('/[^0-9]/', '', $cpf);
        if(strlen($cpf) != 11) return false;
        if(preg_match('/(\d)\1{10}/', $cpf)) return false;

        for($t = 9; $t < 11; $t++) {
                $soma = 0;
                for ($i = 0; $i < $t; $i++) {
                        $soma += $cpf[$i]*(($t+1)-$i);
                }
                $resto = ($soma*10)%11;
                if ($resto == 10) $resto = 0;
                if ($resto != $cpf[$t]) return false;
        }
        return true;
}

//recebe o formulário

$nome = $_POST['nome'];
$email = $_POST['email'];
$cpf = $_POST['cpf'];
//botando o validador para funcionar
if(!validarCPF($cpf)) {
        die("CPF inválido. Cadastro cancelado.");
};
$ulogin = $_POST['ulogin'];
$usenha = $_POST['usenha'];
$hash = password_hash($usenha, PASSWORD_BCRYPT); //transforma a senha em um hash
$cusenha = $_POST['cusenha'];

//Criação da tabela usuários

// Comando para adicionar ao BD
$sql = "INSERT INTO  colaboradores (nome, email, cpf, ulogin, usenha)
        VALUES (?, ?, ?, ?, ?)";

//statement
$stmt = $conexao->prepare($sql);
$stmt->bind_param("sssss", $nome, $email, $cpf, $ulogin, $hash);

if($stmt->execute()) {
        header("Location: index.html?msg=sucesso");
        exit;
} else {
        header("Location: index.html?msg=erro");
        exit;
        }

$stmt->close();
$conexao->close();
