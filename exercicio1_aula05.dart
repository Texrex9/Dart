List<Map<String, dynamic>> alunosMapa = [
  {"id": 98523488, "nome": "João da Silva", "telefone": null},
  {"id": 98523489, "nome": "Lucas Evangelista", "telefone": '11996541236'},
  {"id": 98523490, "nome": "Maria Teodoro", "telefone": '11944551236'},
  {"id": 98523491, "nome": "Isabel Santos", "telefone": null},
];

// Crie uma classe que represente a entidade do Map
// Converta sua lista de map e uma lista de objetos
// Imprima na tela o nome de cada aluno, requisito imprimir usando um atributo da classe

class Aluno {
  final int id;
  final String nome;
  final String? telefone;

  Aluno({required this.id, required this.nome, this.telefone});

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] as int,
      nome: map['nome'] as String,
      telefone: map['telefone'] as String?,
    );
  }
}

void main() {
  final List<Aluno> alunos = alunosMapa.map(Aluno.fromMap).toList();
  print("----ALUNOS----");
  for (final aluno in alunos) {
    print("Nome: ${aluno.nome}");
  }
}
