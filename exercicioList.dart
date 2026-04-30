void main() {
  List<String> listaAlunos = ['Ana', 'Bruno', 'Carla'];
  listaAlunos.add('Daniel');
  print(listaAlunos.first);
  print(listaAlunos.last);
  listaAlunos.remove('Ana');
  print(listaAlunos);
  print(listaAlunos.first);

  List<String> estoque = ['Arroz', 'Feijão', 'Macarrão'];
  estoque.contains("Carne")
      ? print("Produto disponível")
      : print("Produto indisponível. 'Carne'");

  estoque.add("Carne");
  print(estoque.length);
}
