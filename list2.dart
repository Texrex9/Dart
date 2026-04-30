void main() {
  List? minhaLista;
  minhaLista = [];
  minhaLista.add(2);

  //iniciando lista com tipagem

  List<int> minhaListaGenerica1 = [1, 10, 25];

  List<int>? minhaListaNullable;
  minhaListaNullable = [1, 25];

  List<int?>? minhaListaNullable2;
  minhaListaNullable2 = [1, null];

  print(minhaListaNullable2);
  print(minhaListaNullable);
  print(minhaListaGenerica1);
  print(minhaLista);
}
