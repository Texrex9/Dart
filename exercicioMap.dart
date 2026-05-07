void main() {
  // Map com usuários e senhas
  Map<String, String> usuarios = {"user": "texrex", "pass": "senha123"};
  String usuario = usuarios["user"]!;
  String senha = usuarios["pass"]!;
  if (usuario == "texrex" && senha == "senha123") {
    print("Login bem-sucedido!");
  } else {
    print("Credenciais inválidas.");
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
