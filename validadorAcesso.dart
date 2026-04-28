void main() {
  String? nomeUsuario;
  String exibicao = "Visitante";
  // ignore: unnecessary_null_comparison
  nomeUsuario == null ? exibicao = "Visitante" : exibicao = nomeUsuario;
  print("Bem vindo, $exibicao!");
}
