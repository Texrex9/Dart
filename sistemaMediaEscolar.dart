void main() {
  double? nota1;
  double? nota2;
  nota1 = 7.5;
  nota2 = null;

  // Considerar notas nulas como 0.0 e calcular a média
  // ignore: dead_null_aware_expression, dead_code
  double nota1Final = nota1 ?? 0.0;
  // ignore: dead_null_aware_expression
  double nota2Final = nota2 ?? 0.0;
  double media = (nota1Final + nota2Final) / 2;

  // Verificar situação do aluno
  String situacao = switch (media >= 7.0) {
    true => 'Aprovado',
    false => 'Recuperação',
  };

  print('Nota 1: $nota1Final');
  print('Nota 2: $nota2Final');
  print('Média: $media');
  print('Situação: $situacao');
}
