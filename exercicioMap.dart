void main() {
  // Map com usuários e senhas
  Map<String, String> usuarios = {
    "admin": "123456",
    "user": "senha123",
    "joao": "abc789",
  };

  // Variáveis com login e senha digitados
  String loginDigitado = "admin";
  String senhaDigitada = "123456";

  // Verificação de autenticação
  if (usuarios.containsKey(loginDigitado)) {
    if (usuarios[loginDigitado] == senhaDigitada) {
      print("Acesso concedido");
    } else {
      print("Senha incorreta");
    }
  } else {
    print("Usuário não encontrado");
  }
}
