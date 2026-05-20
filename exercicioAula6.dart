void main() {
  // Este Map simula dados recebidos de uma fonte externa, como uma API.
  // Todos os valores são armazenados em formato simples, semelhante ao JSON.
  final map = {
    "paciente": "João da Silva",
    "medico": "Dra. Maria Oliveira",
    "exames": ["Hemograma", "Glicemia"],
    "data": "2026-05-17",
  };

  // 1) Converte o Map para um objeto de domínio (`Consulta`).
  //    O método `fromMap` é responsável por ler cada campo do Map e criar
  //    uma instância de `Consulta` com os tipos corretos.
  final consulta = Consulta.fromMap(map);

  // 2) Exibe os valores do objeto para verificar se a conversão funcionou.
  //    Aqui mostramos como acessar cada propriedade do objeto.
  print('Paciente: ${consulta.paciente}');
  print('Médico: ${consulta.medico}');
  print('Exames: ${consulta.exames.join(', ')}');
  print('Data: ${consulta.data}');

  // 3) Converte o objeto de volta para Map.
  //    Esse processo é útil quando precisamos enviar os dados novamente para
  //    uma API, armazenar em banco ou gravar em um formato serializável.
  final novoMap = consulta.toMap();
  print('\nMap convertido de volta:');
  print(novoMap);
}

/// Representa os campos base de um registro médico.
///
/// Essa classe abstrata define a estrutura de dados que deve existir em qualquer
/// implementação concreta. Ela não pode ser instanciada diretamente.
abstract class RegistroMedico {
  final String paciente;
  final String medico;
  final List<String> exames;
  final String data;

  /// Construtor da abstração que recebe os campos obrigatórios.
  RegistroMedico({
    required this.paciente,
    required this.medico,
    required this.exames,
    required this.data,
  });

  /// Método que deve ser implementado por classes concretas para transformar
  /// o objeto em um Map. Isso é útil para serializar dados.
  Map<String, dynamic> toMap();
}

/// Modelo concreto que representa uma consulta médica específica.
///
/// Essa classe herda de [RegistroMedico] e implementa a conversão entre Map
/// e objeto de domínio, permitindo trabalhar com dados tipados em Dart.
class Consulta extends RegistroMedico {
  /// Construtor padrão de [Consulta].
  ///
  /// Ele recebe os valores já tipados e os repassa para o construtor da
  /// classe base [RegistroMedico].
  Consulta({
    required super.paciente,
    required super.medico,
    required super.exames,
    required super.data,
  });

  /// Construtor nomeado que cria uma [Consulta] a partir de um Map.
  ///
  /// O Map deve conter as chaves:
  ///   - paciente
  ///   - medico
  ///   - exames
  ///   - data
  Consulta.fromMap(Map<String, dynamic> map)
    : super(
        paciente: map['paciente'],
        medico: map['medico'],
        exames: List<String>.from(map['exames'] ?? []),
        data: map['data'],
      );

  /// Transforma a instância de [Consulta] de volta em um Map.
  ///
  /// Esse método garante que os dados possam ser convertidos novamente para um
  /// formato estruturado, ideal para serialização ou envio pela rede.
  @override
  Map<String, dynamic> toMap() {
    return {
      'paciente': paciente,
      'medico': medico,
      'exames': exames,
      'data': data,
    };
  }
}
