// ignore_for_file: unused_local_variable

void main() {
  List minhaListaGenerica1 = [1, "João", true];

  List minhaListaGenerica2 = [];

  List minhaListaGenerica3 = List.empty();

  List? minhaListaNullable;

  print("Print após criado da lista 1: $minhaListaGenerica1");

  // Adicionando novos elementos

  minhaListaGenerica1.add("Azul");
  print("Print após adição de um novo elemento: $minhaListaGenerica1");

  // Removendo elemento

  minhaListaGenerica1.removeAt(2);
  print("Print após remoção de um elemento: $minhaListaGenerica1");
}
