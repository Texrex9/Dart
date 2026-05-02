enum EtapaPintura {
  primeiraDemao(2),
  segundaDemao(4),
  verniz(1);

  final int horasSecagem;
  const EtapaPintura(this.horasSecagem); // Construtor

  void mostrarAviso() {
    print("Aguarde $horasSecagem horas para esta etapa.");
  }
}

void main() {
  var etapa = EtapaPintura.segundaDemao;
  print(etapa.horasSecagem); // Saída: 4
  etapa.mostrarAviso();
}
