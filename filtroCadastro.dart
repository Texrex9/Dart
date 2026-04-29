void main() {
  String? nome;
  int? idade;
  bool ativo = true;

  nome = "Clarice";
  idade = null;

  // 1. Se o nome for nulo, parar e imprimir erro
  // ignore: unnecessary_null_comparison, dead_code
  if (nome == null) {
    print("Erro: Nome obrigatório");
    return;
  }

  // 2. Se a idade for nula, considerar 18
  int idadeFinal = idade ?? 18;

  // 3. Se ativo for falso, imprimir e parar
  // ignore: dead_code
  if (!ativo) {
    print("Usuário desativado");
    return;
  }

  // 4. Se ativo e tiver 18 ou mais
  if (idadeFinal >= 18) {
    print("$nome, você pode dirigir");
  }
}
