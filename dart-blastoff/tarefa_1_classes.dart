import 'dart:io';

class Retangulo {
  final double comprimento;
  final double largura;

  const Retangulo(this.comprimento, this.largura);

  double calcularArea() => comprimento * largura;

  double calcularPerimetro() => 2 * (comprimento + largura);
}

void main() async {
  double comprimento = await inserirMedida("Insira o comprimento:");
  double largura = await inserirMedida("Insira a largura:");

  final retangulo = Retangulo(comprimento, largura);

  final area = retangulo.calcularArea();
  final perimetro = retangulo.calcularPerimetro();

  const areaPiso = 1;
  const alturaRodape = 0.25;
  final areaTotal = area + (perimetro * alturaRodape);
  final quantidadePisos = (areaTotal / areaPiso).ceil();
  final quantidadeRodapes = (perimetro / alturaRodape).ceil();

  print('Área do local: ${area.toStringAsFixed(2)} m²');
  print('Perímetro do local: ${perimetro.toStringAsFixed(2)} m');
  print('Quantidade de pisos necessários: $quantidadePisos');
  print('Quantidade de rodapés necessários: $quantidadeRodapes');
}

Future<double> inserirMedida(String mensagem) async {
  while (true) {
    stdout.write("$mensagem ");
    final input = stdin.readLineSync();
    if (input == null) {
      print("Entrada inválida. Tente novamente.");
      continue;
    }
    try {
      final medida = double.parse(input);
      if (medida <= 0) {
        print("Medida inválida. Insira um valor positivo.");
        continue;
      }
      return medida;
    } on FormatException {
      print("Entrada inválida. Tente novamente.");
      continue;
    }
  }
}
