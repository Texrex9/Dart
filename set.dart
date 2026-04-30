// ignore_for_file: unused_local_variable

void main() {
  Set minhaListaGenerica = {1, 10, 25};
  Set? minhaListaGenericaNullable;
  Set<int> minhaListaComTipagem;
  Set<int?>? minhaListaComTipagemNullable;

  minhaListaComTipagemNullable = {};

  minhaListaComTipagemNullable.add(1);
  minhaListaComTipagemNullable.add(2);
  minhaListaComTipagemNullable.add(1);

  minhaListaComTipagemNullable.add(null);
  minhaListaComTipagemNullable.add(null);

  print(minhaListaComTipagemNullable);

  List<String> frutas = ['banana', 'pera', 'mamão', 'pera', 'uva', 'banana'];
  Set<String> frutasSemRepeticao = frutas.toSet();
  print(frutas);
  print(frutasSemRepeticao);
  print(frutasSemRepeticao.length);
  print(
    frutasSemRepeticao.contains('banana')
        ? 'Contém banana'
        : 'Não contém banana',
  );
}
