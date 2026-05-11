void main() {
  List<Map<String, dynamic>> produtos = [
    {
      "id": 1,
      "produto": "Feijão Flutterado 1kg",
      "valor_venda": "8,17",
      "valor_compra": "5.15",
    },
    {
      "id": 2,
      "produto": "Suco dartado 1l",
      "valor_venda": "12,00",
      "valor_compra": "10.15",
    },
    {
      "id": 3,
      "produto": "Bolacha null safety",
      "valor_venda": "4,20",
      "valor_compra": "2.50",
    },
    {
      "id": 4,
      "produto": "Arroz Clean Code 5kg",
      "valor_venda": "28,50",
      "valor_compra": "19.90",
    },
    {
      "id": 5,
      "produto": "Macarrão Async/Await 500g",
      "valor_venda": "5,40",
      "valor_compra": "3.10",
    },
    {
      "id": 6,
      "produto": "Café Hot Reload 500g",
      "valor_venda": "18,90",
      "valor_compra": "12.00",
    },
    {
      "id": 7,
      "produto": "Leite Widget Tree 1l",
      "valor_venda": "6,25",
      "valor_compra": "7.15",
    },
    {
      "id": 8,
      "produto": "Açúcar State Management 1kg",
      "valor_venda": "4,80",
      "valor_compra": "2.90",
    },
    {
      "id": 9,
      "produto": "Óleo de Soja Boilerplate 900ml",
      "valor_venda": "7,30",
      "valor_compra": "8.10",
    },
    {
      "id": 10,
      "produto": "Detergente Singleton 500ml",
      "valor_venda": "2,15",
      "valor_compra": "1.05",
    },
    {
      "id": 11,
      "produto": "Pão de Forma Material Design",
      "valor_venda": "9,90",
      "valor_compra": "6.20",
    },
    {
      "id": 12,
      "produto": "Manteiga Build Context 200g",
      "valor_venda": "7,40",
      "valor_compra": "7.80",
    },
    {
      "id": 13,
      "produto": "Iogurte GetX 170g",
      "valor_venda": "3,20",
      "valor_compra": "1.95",
    },
  ];

  print("\n\nPRODUTOS\n");

  //*Contexto: Você recebeu uma lista de Produtos da API e
  //*precisar mostrar para o usuário algumas informações,
  //*sendo elas o ID do produto, o nome e o lucro que esta dando

  final listaFormatada = produtos.map((e) {
    double valorCompra = double.parse(e["valor_compra"]);
    String valorVendaStringFormatada = e["valor_venda"].toString().replaceAll(
      RegExp(r','),
      '.',
    );
    double valorVenda = double.parse(valorVendaStringFormatada);
    double lucro = valorVenda - valorCompra;
    return {
      "id": e["id"],
      "produto": e["produto"],
      "valor_venda": valorVenda,
      "valor_compra": valorCompra,
      "lucro": lucro,
    };
  }).toList();
  print(listaFormatada);

  print("\n\n----LISTA DOS PRODUTOS----\n");
  listaFormatada.forEach((produto) {
    String lucroFormatado = produto["lucro"].toStringAsFixed(2);
    print(
      "ID: ${produto["id"]}| PRODUTO: ${produto["produto"]} | LUCRO DA VENDA: R\$$lucroFormatado",
    );
  });

  print("\n\n----MÉDIAS----\n");

  //*Contexto: Agora você precisar gerar alguns relatórios sintéticos para o usuário:

  //? Imprimir a média do valor de venda: Média valor venda: R$21,00
  //? Imprimir a média do valor de compra: Média valor compra: R$18,00
  //? Imprimir a média do lucro: Média valor compra: R$3,50
  double mediaVenda =
      listaFormatada.map((e) => e["valor_venda"]).reduce((a, b) => a + b) /
      listaFormatada.length;
  double mediaCompra =
      listaFormatada.map((e) => e["valor_compra"]).reduce((a, b) => a + b) /
      listaFormatada.length;
  double mediaLucro =
      listaFormatada.map((e) => e["lucro"]).reduce((a, b) => a + b) /
      listaFormatada.length;

  print("Média valor venda: R\$${mediaVenda.toStringAsFixed(2)}");
  print("Média valor compra: R\$${mediaCompra.toStringAsFixed(2)}");
  print("Média lucro: R\$${mediaLucro.toStringAsFixed(2)}");

  // Próxima etapa
  print("\n\nMAIOR PARTE DOS PRODUTOS DA LUCRO?:\n");

  int produtosComLucro = listaFormatada.where((e) => e["lucro"] > 0).length;
  print(produtosComLucro > listaFormatada.length / 2 ? "SIM" : "NÃO");

  print("\n\nMAIOR PARTE DOS PRODUTOS DA LUCRO ACIMA DE R\$2,00?:\n");
  int produtosLucroAcima2 = listaFormatada
      .where((e) => e["lucro"] > 2.00)
      .length;
  print(produtosLucroAcima2 > listaFormatada.length / 2 ? "SIM" : "NÃO");

  print("\n\nPRODUTOS QUE DÃO PREJUÍZO:\n");
  listaFormatada.where((e) => e["lucro"] < 0).forEach((produto) {
    String prejuizoFormatado = produto["lucro"].toStringAsFixed(2);
    print(
      "ID: ${produto["id"]} | PRODUTO: ${produto["produto"]} | PREJUÍZO: -R\$${prejuizoFormatado.substring(1)}",
    );
  });
}
