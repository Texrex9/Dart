void main() {
  double valorDoProduto = 150.0;
  bool temCupomDesconto = true;
  double valorFinal = temCupomDesconto ? valorDoProduto * 0.85 : valorDoProduto;

  print("Valor final do produto: R\$ ${valorFinal.toStringAsFixed(2)}");
}
