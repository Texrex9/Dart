void main() {
  int diasDeAtraso = 10;
  double multa = 0;

  switch (diasDeAtraso) {
    case <= 5:
      multa = 0.00;
    case > 5 && <= 15:
      multa = 10.00;
    case > 15 && <= 20:
      multa = 15.00;
    default:
      multa = 20.00;
  }
  print("Multa por atraso: $multa");
}
