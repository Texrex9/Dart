/// Função principal que executa o programa de análise de produtos
///
/// Este programa recebe uma lista de produtos com informações de venda e compra,
/// realiza análises e gera relatórios sobre lucros, prejuízos e médias.
void main() {
  // SEÇÃO 1: CRIAÇÃO E INICIALIZAÇÃO DA LISTA DE PRODUTOS
  // ========================================================
  // Esta lista armazena todos os produtos disponíveis no estoque
  // Cada produto é um Map contendo:
  //   - id: identificador único do produto
  //   - produto: nome/descrição do produto
  //   - valor_venda: preço pelo qual o produto é vendido
  //   - valor_compra: preço pelo qual o produto foi comprado

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

  // SEÇÃO 2: EXIBIÇÃO DO CABEÇALHO
  // ==============================
  // Imprime um cabeçalho visual para separar a seção de produtos
  print("\n\nPRODUTOS\n");

  // SEÇÃO 3: TRANSFORMAÇÃO E NORMALIZAÇÃO DOS DADOS
  // ================================================
  // Contexto: A API fornece valores mistos (alguns com vírgula, alguns com ponto)
  // Precisamos converter tudo para formato numérico (double) para fazer cálculos
  // Além disso, calculamos o lucro de cada produto (valor_venda - valor_compra)

  final listaFormatada = produtos.map((e) {
    // Converte a string de valor_venda (que usa vírgula) em double (que usa ponto)
    // Exemplo: "8,17" vira 8.17 para cálculos matemáticos
    String valorVendaString = e["valor_venda"].toString().replaceAll(
      RegExp(r','),
      ".",
    );
    // Converte a string formatada em um número decimal (double)
    double valorVenda = double.parse(valorVendaString);
    // Converte o valor de compra (já está com ponto) em double
    double valorCompra = double.parse(e["valor_compra"]);
    // Calcula o lucro: diferença entre venda e compra
    // Se for positivo = lucro, se for negativo = prejuízo
    double lucro = valorVenda - valorCompra;

    // Retorna um novo mapa com os dados normalizados e o lucro calculado
    return {
      "id": e['id'],
      "produto": e['produto'],
      "valor_venda": valorVenda,
      "valor_compra": valorCompra,
      "lucro": lucro,
    };
  }).toList();

  // Exibe a lista formatada completa para debug (vê todos os dados processados)
  print(listaFormatada);

  // SEÇÃO 4: EXIBIÇÃO DETALHADA DOS PRODUTOS COM LUCRO
  // ==================================================
  // Para cada produto, exibe: ID | NOME DO PRODUTO | LUCRO POR VENDA
  // Exemplos de saída esperada:
  //   - "ID: 1 | PRODUTO: Feijão Flutterado 1kg | LUCRO POR VENDA: R$ 3,02"
  //   - "ID: 7 | PRODUTO: Leite Widget Tree 1l | LUCRO POR VENDA: -R$ 0,90"

  listaFormatada.forEach((e) {
    // Obtém o ID do produto como string para exibição
    String id = e['id'].toString();
    // Obtém o nome do produto
    String produto = e['produto'];
    // Converte o valor do lucro para formato de dinheiro brasileiro (R$ com vírgula)
    // Usa a extension criada no final do arquivo
    String lucro = (e['lucro'] as double).transformarEmDinheiroBr();

    // Imprime na tela no formato especificado
    print("ID: $id | PRODUTO: $produto | LUCRO POR VENDA: $lucro");
  });

  // SEÇÃO 5: GERAÇÃO DE RELATÓRIOS SINTÉTICOS
  // ==========================================
  // Exibe um cabeçalho para a seção de médias
  print("\n\nMÉDIAS\n");

  // Contexto: Calculamos totais e quantidades para gerar análises
  // sobre a saúde geral do negócio (lucro, vendas, etc)

  // Variáveis para armazenar somas acumuladas de todos os produtos
  double totalVeda = 0.0; // Soma de todos os valores de venda
  double totalCompra = 0.0; // Soma de todos os valores de compra
  double totalLucro = 0.0; // Soma de todos os lucros (ou prejuízos)
  int quantidadeDaLucro = 0; // Contador de produtos com lucro positivo
  int quantidadeAcimaDeDois = 0; // Contador de produtos com lucro > R$ 2,00

  // SEÇÃO 6: CÁLCULO DE TOTAIS E CONTADORES
  // ========================================
  // Percorre todos os produtos já formatados para:
  //   1. Acumular totais de venda, compra e lucro
  //   2. Contar quantos produtos têm lucro positivo
  //   3. Contar quantos produtos têm lucro acima de R$ 2,00

  listaFormatada.forEach((e) {
    // Adiciona o lucro deste produto ao total acumulado
    totalLucro += e['lucro'];
    // Adiciona o valor de venda deste produto ao total
    totalVeda += e['valor_venda'];
    // Adiciona o valor de compra deste produto ao total
    totalCompra += e['valor_compra'];

    // Se o lucro é maior que 0, incrementa o contador de produtos lucrativos
    if (e['lucro'] > 0) {
      quantidadeDaLucro++;
    }
    // Se o lucro é maior que 2 reais, incrementa este contador específico
    if (e['lucro'] > 2) {
      quantidadeAcimaDeDois++;
    }
  });

  // SEÇÃO 7: EXIBIÇÃO DAS MÉDIAS
  // =============================
  // Calcula e exibe:
  //   - Média do valor de venda: totalVeda ÷ quantidade de produtos
  //   - Média do valor de compra: totalCompra ÷ quantidade de produtos
  //   - Média do lucro: totalLucro ÷ quantidade de produtos

  // Imprime a média dos valores de venda
  // Exemplo esperado: "Média valor de venda: R$ 21,00"
  print(
    "Média valor de venda: ${(totalVeda / listaFormatada.length).transformarEmDinheiroBr()}",
  );

  // Imprime a média dos valores de compra
  // Exemplo esperado: "Média valor compra: R$ 18,00"
  print(
    "Média valor compra: ${(totalCompra / listaFormatada.length).transformarEmDinheiroBr()},",
  );

  // Imprime a média dos lucros
  // Exemplo esperado: "Média valor lucro: R$ 3,50"
  print(
    "Média valor lucro: ${(totalLucro / listaFormatada.length).transformarEmDinheiroBr()},",
  );

  // SEÇÃO 8: ANÁLISE BOOLEANA - MAIORIA LUCRA?
  // ===========================================
  // Verifica se a maioria dos produtos dão lucro (lucro > 0)
  // Exibe "SIM" se mais de 50% dos produtos são lucrativos, senão "NÃO"

  print("\n\nMaior parte dos produtos dão lucro?: \n");
  // quantidadeDaLucro > (listaFormatada.length / 2) verifica se mais da metade são lucrativos
  print(quantidadeDaLucro > (listaFormatada.length / 2) ? "SIM" : "NÃO");

  // SEÇÃO 9: ANÁLISE BOOLEANA - MAIORIA LUCRA ACIMA DE R$ 2?
  // =========================================================
  // Verifica se a maioria dos produtos lucrativos têm lucro acima de R$ 2,00
  // Compara quantidadeAcimaDeDois com metade de quantidadeDaLucro

  print("Maior parte dos produtosdão lucro acima de R\$ 2,00?\n");
  // Se mais de 50% dos produtos lucrativos têm lucro > R$2, responde SIM
  print(quantidadeAcimaDeDois > (quantidadeDaLucro / 2) ? "SIM" : "NÃO");

  // SEÇÃO 10: GERAÇÃO DE RELATÓRIO ANALÍTICO - PRODUTOS COM PREJUÍZO
  // ================================================================
  // Contexto: Identifica quais produtos estão gerando prejuízo
  // (onde valor_venda < valor_compra, ou seja, lucro negativo)
  // Isso ajuda a identificar produtos que precisam de preço revisado

  print("\n\n----PRODUTOS QUE DÃO PREJUIZO:----\n");

  // Filtra da lista apenas os produtos onde lucro < 0 (prejuízo)
  // Usa o método where() para criar uma nova coleção com apenas esses produtos
  final listaDePrejuizo = listaFormatada.where((e) => e['lucro'] < 0);

  // Para cada produto com prejuízo, exibe:
  // ID do produto | NOME | VALOR DO PREJUÍZO
  // Exemplo esperado: "ID: 7 | PRODUTO: Leite Widget Tree 1l | PREJUIZO: -R$ 0,90"
  listaDePrejuizo.forEach((e) {
    // Converte ID para string
    String id = e['id'].toString();
    // Obtém o nome do produto
    String produto = e['produto'];
    // Converte o prejuízo (lucro negativo) para formato de dinheiro
    String lucro = (e['lucro'] as double).transformarEmDinheiroBr();
    // Imprime na tela o relatório de prejuízo
    print("ID: $id | PRODUTO: $produto | PREJUIZO: $lucro");
  });
}

// SEÇÃO 11: EXTENSÃO PARA FORMATAÇÃO DE VALORES MONETÁRIOS
// ==========================================================
// Esta extensão adiciona um método customizado à classe double
// Permite converter valores numéricos para o formato de dinheiro brasileiro
//
// Exemplo de uso:
//   8.50.transformarEmDinheiroBr() retorna "R$ 8,50"
//   -3.25.transformarEmDinheiroBr() retorna "R$ 3,25" (sempre positivo visualmente)

extension FormatadoresDeDinheiro on double {
  /// Transforma um valor numérico (double) para o formato de dinheiro brasileiro
  ///
  /// Funcionalidades:
  ///   - Adiciona o prefixo "R$ " (símbolo de real brasileiro)
  ///   - Converte o ponto (.) em vírgula (,) para formato BR
  ///   - Garante sempre 2 casas decimais (centavos)
  ///   - Trata valores negativos (mantém apenas o valor absoluto na exibição)
  ///
  /// Exemplos:
  ///   12.50.transformarEmDinheiroBr() → "R$ 12,50"
  ///   8.1.transformarEmDinheiroBr() → "R$ 8,10"
  ///   -5.25.transformarEmDinheiroBr() → "R$ 5,25"
  String transformarEmDinheiroBr() => this.isNegative
      // Se for negativo, exibe o valor absoluto (sem o sinal) formatado como dinheiro
      ? "R\$ ${abs().toStringAsFixed(2).replaceAll(".", ",")}"
      // Se for positivo, exibe normalmente formatado como dinheiro
      : "R\$ ${abs().toStringAsFixed(2).replaceAll(".", ",")}";
}
