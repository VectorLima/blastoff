
import 'dart:io';

class Triangulo {
  late double base;
  late double altura;

  double get area => (base * altura) / 2;

  void exibirDados() {
    print('Base: $base');
    print('Altura: $altura');
    print('Área: ${area.toStringAsFixed(2)} m²');
  }
}

void main() {
  Triangulo triangulo = Triangulo();

    print('---------- Area do Triangulo ----------');
    stdout.write('Informe a base do triângulo: ');
    triangulo.base = validarDados();

    stdout.write('Informe a altura do triângulo: ');
    triangulo.altura = validarDados();

    triangulo.exibirDados();

}

double validarDados() {
  bool dadosValido = false;
  double? entrada;
  while (!dadosValido) {
    try {
      entrada = double.parse(stdin.readLineSync()!);
      if (entrada > 0) {
        dadosValido = true;
      } else {
        stdout.write('Entrada inválida! Digite novamente:');
      }
    } catch (e) {
      stdout.write('Entrada inválida! Digite novamente:');
    }
  }
  return entrada!;
}
