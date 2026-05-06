void main() {
  print(soma(5, 3));
  print(somar2(5, 4));
  print(areaCirculo(2));
  print(areaRetangulo(4, 5));
  print(areaTriangulo(4, 5));
}

int soma(int a, int b) {
  return a + b;
}

//arrow function, mais simples, sem a necessidade de usar return e chaves.
int somar2(int a, int b) => a + b;

double areaCirculo(double raio) => 3.14 * raio * raio;

double areaRetangulo(double largura, double altura) => largura * altura;

double areaTriangulo(double base, double altura) => (base * altura) / 2;
