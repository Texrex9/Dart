void main() {
  int idade = 17;

  idade >= 18
      ? print("Você é MAIOR de idade")
      : print("Você é MENOR de idade.");

  int diasDeAtraso = 3;
  double multaPorAtraso = diasDeAtraso >= 3 ? 1.5 : 1.3;
  print(
    "A multa por atraso é: $diasDeAtraso * $multaPorAtraso = ${diasDeAtraso * multaPorAtraso}",
  );
}
