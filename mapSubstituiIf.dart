/*void main() {
  String categoria = 'A';
  double valor = 0;

  if (categoria == 'DIAMANTE') {
    valor = 0.30;
  } else {
    if (categoria == 'OURO') {
      valor = 0.20;
    } else {
      if (categoria == 'PRATA') {
        valor = 0.10;
      } else {
        if (categoria == 'BRONZE') {
          valor = 0.05;
        } else {
          valor = 0.0; //O 'Else' final que é o valor padrão
        }
      }
    }
  }
  print("O valor para a categoria $categoria é: $valor");
}*/

void main() {
  String categoria = 'OURO';
  double valor = 0;

  final descontos = {
    'DIAMANTE': 0.30,
    'OURO': 0.20,
    'PRATA': 0.10,
    'BRONZE': 0.05,
  };
  valor =
      descontos[categoria] ??
      0.0; // O Map + Null safety substitui toda escada de IFs
  print("O valor para a categoria $categoria é: $valor");
}
