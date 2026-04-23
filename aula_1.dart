void main() {
  String nome = "João";
  int idade = 25;
  print("Nome: $nome, Idade: $idade");
  print(nome.toUpperCase()); // Imprime o nome em letras maiúsculas
  print(nome.trim()); // Remove espaços em branco no início e no final do nome
  print(nome.trim().toUpperCase()); // Remove espaços e converte para maiúsculas
  print(nome.trim().toLowerCase()); // Remove espaços e converte para minúsculas
  print(nome.trim().length,); // Imprime o número de caracteres do nome sem espaços
  print(nome.isEmpty); // Verifica se o nome está vazio
  print(nome.contains("Jo")); // Verifica se o nome contém a substring "Jo"
}
