void main() {
  // Map com usuários e senhas
  Map<String, String> usuarios = {"admin": "123456", "user": "senha123"};

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

  Map<String, int> carrinho = {};
  carrinho.addAll({"Detergente": 10, "Carne": 15, "Refrigerante": 5});
  print(carrinho);
  carrinho["Detergente"] =
      carrinho["Detergente"]! + 2; // Atualiza a quantidade de detergente
  print(carrinho);
  carrinho.remove("Carne"); // Remove o item "Carne" do carrinho
  print(carrinho.length);
  print(carrinho);
  carrinho.addAll({'Carne': 20, 'Arroz': 10});
  print(carrinho);
  print(carrinho.length);
  
  }
