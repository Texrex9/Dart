// Lista inicial de alunos representada como uma lista de mapas.
// Cada mapa (Map<String, dynamic>) representa os atributos de um aluno:
// - "id": número inteiro que identifica unicamente o aluno
// - "nome": nome completo do aluno (String)
// - "telefone": número de telefone (String) ou null quando não há telefone
List<Map<String, dynamic>> alunos = [
  {"id": 98523488, "nome": "João da Silva", "telefone": null},
  {"id": 98523489, "nome": "Lucas Evangelista", "telefone": '11996541236'},
  {"id": 98523490, "nome": "Maria Teodoro", "telefone": '11944551236'},
  {"id": 98523491, "nome": "Isabel Santos", "telefone": null},
];

// Objetivo deste exercício:
// 1) Criar uma classe `Aluno` que represente os dados do mapa.
// 2) Converter a lista de mapas (`alunos`) em uma lista de objetos `Aluno`.
// 3) Imprimir o nome de cada aluno usando o atributo da classe.

// Definição da classe `Aluno`.
// - Campos marcados como `final` porque seu valor é definido na criação
//   do objeto e não deve ser alterado posteriormente.
// - `telefone` é do tipo `String?` (nullable) porque alguns alunos
//   não possuem número de telefone (valor `null` nos mapas).
class Aluno {
  final int id;
  final String nome;
  final String? telefone;

  // Construtor nomeado: `Aluno.salaDeAula` recebe um Map e extrai
  // os valores correspondentes para inicializar os campos da classe.
  // Usamos `Map<String, dynamic>` para refletir a estrutura da lista
  // original (`alunos`). A conversão aqui assume que as chaves existem
  // e têm tipos compatíveis; em um código mais robusto faríamos validações.
  Aluno.salaDeAula(Map<String, dynamic> aulunosDaSala)
    : id = aulunosDaSala['id'],
      nome = aulunosDaSala['nome'],
      telefone = aulunosDaSala['telefone'];

  // Construtor padrão com parâmetros nomeados. Pode ser usado para
  // criar instâncias manualmente (não necessário neste exercício,
  // mas útil como alternativa).
  Aluno({required this.id, required this.nome, this.telefone});
}

void main() {
  // `map` percorre cada elemento da lista `alunos` (cada elemento é um Map)
  // e aplica a função que cria um `Aluno` a partir do Map. O resultado de
  // `map` é um `Iterable<Aluno>`, então chamamos `toList()` para obter
  // uma `List<Aluno>` concreta.
  final alunosLista = alunos.map((e) => Aluno.salaDeAula(e)).toList();

  // Impressão de um cabeçalho simples para visualização.
  print('----ALUNOS----');

  // `forEach` itera sobre cada `Aluno` na lista e imprime o `nome`.
  // Observação: estamos acessando diretamente o atributo `nome` da classe,
  // conforme solicitado no requisito.
  alunosLista.forEach((aluno) => print('Nome: ${aluno.nome}'));

  // Observações extras e possíveis extensões:
  // - Se quisermos imprimir o telefone, devemos tratar o caso `null`:
  //   `print(aluno.telefone ?? 'Telefone não informado');`
  // - Para código em produção, valide o mapa antes de converter (checar
  //   chaves requeridas e tipos) para evitar exceções em tempo de execução.
}
