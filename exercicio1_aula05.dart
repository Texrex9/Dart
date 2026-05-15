List<Map<String, dynamic>> alunos = [
  {"id": 98523488, "nome": "João da Silva", "telefone": null},
  {"id": 98523489, "nome": "Lucas Evangelista", "telefone": '11996541236'},
  {"id": 98523490, "nome": "Maria Teodoro", "telefone": '11944551236'},
  {"id": 98523491, "nome": "Isabel Santos", "telefone": null},
];

// Crie uma classe que represente a entidade do Map
// Converta sua lista de map e uma lista de objetos
// Imprima na tela o nome de cada aluno, requisito imprimir usando um atributo da classe

class Aluno {
  int id;
  String nome;
  String? telefone;

  Aluno.salaDeAula(Map aulunosDaSala)
    : id = aulunosDaSala["id"],
      nome = aulunosDaSala["nome"],
      telefone = aulunosDaSala["telefone"];

  Aluno(this.id, this.nome, this.telefone);
}

void main() {
  final alunosLista = alunos.map((e) {
    return Aluno.salaDeAula(e);
  }).toList();
  print("----ALUNOS----");
  alunosLista.forEach((e) => print("Nome: ${e.nome}"));
}
