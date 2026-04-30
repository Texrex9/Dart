import 'dart:math';

void main() {
  List<int> minhaLista = [1, 2, 3, 4, 5, 6];
  List<String> minhaLista2 = ['a', 'b', 'c', 'd', 'e', 'f'];
  minhaLista.shuffle();
  bool contemA = minhaLista2.contains((element) => element == 'h');
  String listaFormatada = minhaLista.join(' | ');
  int numeroAleatorio = Random().nextInt(6);
  List<int> filtraPar = minhaLista
      .where((element) => element % 2 == 0)
      .toList();
  print(listaFormatada);
  print(minhaLista);
  print(minhaLista2);
  print(contemA);
  print(numeroAleatorio);
  print(filtraPar);
}
