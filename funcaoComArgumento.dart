void main() {
  cadastroUsuario(nome: 'José', idade: 49);
  print(cadastroUsuario);
  saudacao(nome: 'Marcos');
  print(saudacao);
}

//Argumentos nomeados não opcionais (Obrigatórios)
void cadastroUsuario({required String nome, required int idade}) {
  print('Nome: $nome, Idade: $idade');
  print(nome);
  print(idade);
}

//Argumentos nomeados opcionais
void saudacao({required String nome, String? saudacao, int idade = 18}) {
  saudacao ??= 'Olá'; // se saudacao for nula, atribui 'Olá'
  print('$saudacao, $nome!');
  print('Idade: $idade anos.');
}
