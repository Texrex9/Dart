void main() {
  double valorReais = 40.0;
  double cotacaoDolar = 5.0;
  double valorDolar = valorReais / cotacaoDolar;
  if (valorDolar < 10) {
    print('Saldo insuficiente para viajar. Saldo em dólares: \$${valorDolar.toStringAsFixed(2)}');
  } else {
    print(
      'Saldo suficiente para viajar. Saldo em dólares: \$${valorDolar.toStringAsFixed(2)}',
    );
  }
}
