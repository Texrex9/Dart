void main() {
  // Exemplo de dados em formato Map (por exemplo, vindo de uma API)
  final map = {
    "paciente": "João da Silva",
    "medico": "Dra. Maria Oliveira",
    "exames": ["Hemograma", "Glicemia"],
    "data": "2026-05-17",
  };

  // 1) Transformamos o Map em uma instância do modelo usando fromMap
  final consulta = ConsultaModel.fromMap(map);

  // 2) Podemos acessar os campos do modelo de forma segura e tipada
  print('Paciente: ${consulta.paciente}');
  print('Médico: ${consulta.medico}');
  print('Exames: ${consulta.exames}');
  print('Data (ISO): ${consulta.data.toIso8601String()}');

  // 3) Converter a instância de volta para Map (por exemplo, para enviar à API)
  final mapConvertido = consulta.toMap();
  print('Map convertido: $mapConvertido');
}

// -----------------------------
// Abstração da entidade (contrato)
// -----------------------------
// A ideia aqui é definir um contrato (interface) que descreve o que uma
// "Consulta" deve expor. A classe concreta (modelo) vai implementar
// esse contrato. Isso ajuda a separar a definição dos dados da
// implementação concreta e é útil para testes e manutenção.
abstract class ConsultaBase {
  String get paciente;
  String get medico;
  List<String> get exames;
  DateTime get data;

  // Método obrigatório para converter a entidade em Map
  Map<String, dynamic> toMap();
}

// -----------------------------
// Implementação concreta do modelo
// -----------------------------
// A classe `ConsultaModel` estende a abstração e fornece:
// - Um construtor padrão
// - Um `factory` constructor `fromMap` para criar a instância a partir de um Map
// - A implementação do método `toMap` para converter de volta
class ConsultaModel extends ConsultaBase {
  @override
  final String paciente;
  @override
  final String medico;
  @override
  final List<String> exames;
  @override
  final DateTime data;

  // Construtor principal com parâmetros obrigatórios
  ConsultaModel({
    required this.paciente,
    required this.medico,
    required this.exames,
    required this.data,
  });

  // Construtor que cria uma instância a partir de um Map
  factory ConsultaModel.fromMap(Map<String, dynamic> map) {
    return ConsultaModel(
      paciente: map['paciente'] as String,
      medico: map['medico'] as String,
      // Garantimos que 'exames' será uma List<String>
      exames: List<String>.from(map['exames'] ?? const []),
      // Convertemos a string de data para DateTime
      data: DateTime.parse(map['data'] as String),
    );
  }

  // Converte a instância atual em Map<String, dynamic>
  @override
  Map<String, dynamic> toMap() {
    return {
      'paciente': paciente,
      'medico': medico,
      'exames': exames,
      // Usamos ISO 8601 para manter um formato padrão de data
      'data': data.toIso8601String(),
    };
  }
}
