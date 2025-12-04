<?php
include('conexao.php');

session_start();

// Recebe os dados do formulário
$email = $_POST['email'];
$usenha = $_POST['usenha'];

// Como você está usando o mesmo campo para buscar por email ou login:
$ulogin = $email;

// Busca o usuário no banco de dados
$sql = "SELECT id, nome, ulogin, email, usenha 
        FROM colaboradores 
        WHERE email = ? OR ulogin = ?
        LIMIT 1";
$stmt = $conexao->prepare($sql);
$stmt->bind_param("ss", $email, $ulogin);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {

    $usuario = $result->fetch_assoc();

    if (password_verify($usenha, $usuario['usenha'])) {

        // CRIA A SESSÃO CORRETA
        $_SESSION['id'] = $usuario['id'];
        $_SESSION['nome'] = $usuario['nome'];
        $_SESSION['email'] = $usuario['email'];
        $_SESSION['ulogin'] = $usuario['ulogin'];

        // Registra log
        $stmt_log = $conexao->prepare("INSERT INTO logcolaboradores (id, acao) VALUES (?, 'login')");
        $stmt_log->bind_param("i", $usuario['id']);
        $stmt_log->execute();

        header("location: index.html");
        exit;
    } else {
        echo "<script>alert('Senha incorreta!'); window.location.href='index.html';</script>";
    }
} else {
    echo "<script>alert('Usuário não encontrado'); window.location.href='index.html';</script>";
}

$stmt->close();
$conexao->close();

        // CRIAÇÃO DA TABELA DE LOGS
        
        //CREATE TABLE logcolaboradores (
	    //    logid INT AUTO_INCREMENT PRIMARY KEY,
        //    id INT NOT NULL,
        //    acao ENUM('login', 'logout') NOT NULL,
        //    feito_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
        //    FOREIGN KEY (id) REFERENCES colaboradores(id)
	    //    );
?>


