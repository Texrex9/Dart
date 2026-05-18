/// Ponto de entrada do programa.
///
/// Este exemplo demonstra como transformar uma lista de mapas (dados em formato
/// JSON-like) em objetos fortemente tipados usando construtores nomeados.
/// Depois disso, percorre a lista de pedidos e imprime informações chave de cada pedido.
void main() {
  // Converte cada item do `listaPedidos` em um objeto `Pedido`.
  // Essa conversão envolve criar também objetos `Cliente`, `Pagamento` e `Produto`.
  final pedidos = listaPedidos.map((e) => Pedido.fromMap(e)).toList();

  // Percorre os pedidos convertidos para verificar se a transformação funcionou.
  // Imprime informações principais de cada pedido na saída do console.
  pedidos.forEach(
    (element) => print(
      "Id pedido: ${element.id}, id cliente: ${element.cliente.id}, metodo pagamento: ${element.pagamento.metodo}, quantidade de produto: ${element.produtos.length}",
    ),
  );
}

/// Classe que representa um pedido realizado por um cliente.
///
/// Cada pedido contém dados básicos de identificação, cliente, pagamento e itens.
class Pedido {
  final String id;
  final String data;
  final String status;
  final Cliente cliente;
  final Pagamento pagamento;
  final List<Produto> produtos;

  /// Construtor nomeado que cria um `Pedido` a partir de um mapa (`Map`).
  ///
  /// Espera um mapa com as chaves:
  ///   - id_pedido
  ///   - data_criacao
  ///   - status
  ///   - cliente
  ///   - pagamento
  ///   - itens
  Pedido.fromMap(Map map)
    : id = map['id_pedido'],
      data = map['data_criacao'],
      status = map['status'],
      // Converte o sub-map do cliente para o objeto Cliente
      cliente = Cliente.fromMap(map['cliente']),
      // Converte o sub-map de pagamento para o objeto Pagamento
      pagamento = Pagamento.fromMap(map['pagamento']),
      // Converte a lista de itens (maps) em lista de objetos Produto
      produtos = (map['itens'] as List).map((e) => Produto.fromMap(e)).toList();
}

/// Classe que representa os dados de um cliente.
///
/// Utilizada dentro de um pedido para armazenar informações do comprador.
class Cliente {
  final String id;
  final String nome;
  final String email;

  /// Construtor nomeado que cria um `Cliente` a partir de um mapa.
  ///
  /// Espera um mapa com as chaves:
  ///   - id_cliente
  ///   - nome
  ///   - email
  Cliente.fromMap(Map map)
    : id = map['id_cliente'],
      nome = map['nome'],
      email = map['email'];
}

/// Classe que representa os dados de pagamento de um pedido.
///
/// Contém o método de pagamento, número de parcelas e se foi confirmado.
class Pagamento {
  final String metodo;
  final int parcelas;
  final bool confirmado;

  /// Construtor nomeado que cria um `Pagamento` a partir de um mapa.
  ///
  /// Espera um mapa com as chaves:
  ///   - metodo
  ///   - parcelas
  ///   - confirmado
  Pagamento.fromMap(Map map)
    : metodo = map['metodo'],
      parcelas = map['parcelas'],
      confirmado = map['confirmado'];
}

/// Classe que representa um produto dentro de um pedido.
///
/// Cada produto contém informações de identificação, preço e quantidade.
class Produto {
  final String id;
  final String nome;
  final double preco;
  final int quantidade;

  /// Construtor nomeado que cria um `Produto` a partir de um mapa.
  ///
  /// Espera um mapa com as chaves:
  ///   - id_produto
  ///   - nome
  ///   - preco_unitario
  ///   - quantidade
  Produto.fromMap(Map map)
    : id = map['id_produto'],
      nome = map['nome'],
      preco = map['preco_unitario'],
      quantidade = map['quantidade'];
}

/// Lista de pedidos fictícios usada para simular dados retornados de uma API.
///
/// Cada pedido contém informações de cliente, pagamento e itens de produto.
final listaPedidos = [
  {
    "id_pedido": "REQ-9872",
    "data_criacao": "2026-05-14T10:00:00Z",
    "status": "processando",
    "cliente": {
      "id_cliente": "USR-441",
      "nome": "Ana Silva",
      "email": "ana.silva@email.com",
    },
    "pagamento": {
      "metodo": "cartao_credito",
      "parcelas": 3,
      "confirmado": true,
    },
    "itens": [
      {
        "id_produto": "PROD-001",
        "nome": "Teclado Mecânico RGB",
        "preco_unitario": 349.90,
        "quantidade": 1,
      },
      {
        "id_produto": "PROD-012",
        "nome": "Mouse Pad Extendido",
        "preco_unitario": 89.90,
        "quantidade": 2,
      },
    ],
  },
  {
    "id_pedido": "REQ-9873",
    "data_criacao": "2026-05-14T10:15:00Z",
    "status": "entregue",
    "cliente": {
      "id_cliente": "USR-102",
      "nome": "Carlos Souza",
      "email": "carlos.s@email.com",
    },
    "pagamento": {"metodo": "pix", "parcelas": 1, "confirmado": true},
    "itens": [
      {
        "id_produto": "PROD-055",
        "nome": "Fone de Ouvido Bluetooth",
        "preco_unitario": 199.00,
        "quantidade": 1,
      },
    ],
  },
];
