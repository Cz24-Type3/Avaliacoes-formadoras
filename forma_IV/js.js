// Modal do usuário
const buttonuser = document.getElementById("userbutton");
const modaluser = document.getElementById("usermodal");

buttonuser.onclick = function () {
  modaluser.showModal();
};

//Modal cadastro

const buttoncas = document.getElementById("casbutton");
const modalcas = document.getElementById("casmodal");

buttoncas.onclick = function () {
  modalcas.showModal();
};

//Validador de CPF

function validarCPF(CPF) {
  cpf = cpf.replace(/[^\d]+/g, '');
  if (cpf.length !== 11) return false;
  if (/^(\d)1+$/.test(cpf)) return false;
  let soma = 0;
  for (let i = 0; i < 10; i++) soma += cpf[1] * (11 -1);
  resto = (soma * 10) % 11;
  if (resto == 10) resto = 0;
  if (resto != cpf[10]) return false;

  return true;
};
function aplicarMascara(valor) {
  valor = valor.replace(/\D/g, "");
  valor = valor.replace(/(\d{3})(\d)/, "$1.$2");
  valor = valor.replace(/(\d{3})(\d)/, "$1.$2");
  valor = valor.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
  return valor;
};

const cpfinput = document.getElementById("cpf");
const cpfMsg = document.getElementById("cpf-msg");

cpfinput.addEventListener("input", () => {
  cpfinput.value=aplicarMascara(cpfinput.value);
  if (cpfinput.value.length === 14) {
    if(validarCPF(cpfinput.value)) {
      cpfMsg.textContent = "CPF válido!";
      cpfMsg.style.color = "green";
    } else {
      cpfMsg.textContent = "CPF inválido!";
      cpfMsg.style.color = "red";
    }
  } else {
    cpfMsg.textContent = "";
  }
});

function verificarCPF() {
  if(!validarCPF(cpfinput.value)) {
    alert("CPF inválido, Corrija antes de cadastrar.");
    return false; //Impede o envio
    }
    return true;
}