void main() {
  //variaveis para circunferencia
  const double pi = 3.1415;
  double raio = 5.0;

  //cálculo da area do círculo
  double areaCirculo = pi * (raio * raio);

  //variáveis para retângulo
  double largura = 10.0;
  double altura = 20.5;

  //cálculo da area do retângulo
  double areaRetangulo = largura * altura;

  //Cálculo do perimetro do retângulo
  double perimetroRetangulo = 2 * (largura + altura);

  //Exibindo os resultados com Interpolação de Strings ($)
  print('----Resultados----');
  print('Área do círculo: $areaCirculo');
  print('Área do retângulo: $areaRetangulo');
  print('Perímetro do retângulo: $perimetroRetangulo');
}
