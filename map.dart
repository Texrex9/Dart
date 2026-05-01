void main() {
  // Tanto a chave como o valor podem ser de qualquer tipo,
  //mas geralmente se utiliza as chave como String e o valor
  // como dynamic

  Map<String, dynamic> meuMapa = {};

  print(meuMapa);

  Map<String, dynamic> meuMapaComDados = {
    "id": 15,
    "produto": "Guitarra ESP EC-1000",
    "preco": 5000.00,
    "quantidadeEmEstoque": 3,
  };

  print(meuMapaComDados);
  print(meuMapaComDados['produto']);
  meuMapaComDados['cor'] = 'verde';
  print("\nAdicionando a chave cor: $meuMapaComDados \n");
  meuMapaComDados['quantidadeEmEstoque'] = 2;
  print("\nAtualizando a chave quantidadeEmEstoque: $meuMapaComDados \n");
  meuMapaComDados.remove("cor");
  print("\nRemovendo a chave cor: $meuMapaComDados \n");
}
