void main() {
  String? nomeUsuario;
  String exibicao = "Visitante";

  nomeUsuario == null ? exibicao = "Visitante" : exibicao = nomeUsuario;

  print("Bem vindo, $exibicao!");
}
