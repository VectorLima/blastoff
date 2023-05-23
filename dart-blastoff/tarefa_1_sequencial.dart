import 'dart:io';

void main() {
  double? h;
  String? g;
  double peso;

  print('------ Calcular Peso Ideal ------\n');

  h = altura();
  g = genero();
  peso = calculoDePeso(h!, g!);

  try {
    if (peso > 0) {
      print('O peso ideal para ${((g == "m" || g == "M")?("uma mulher"):("um homem"))} com ${h}M de altura é ${peso.toStringAsFixed(2)}KG.');
    } else {
      throw Exception('Erro ao calcular peso ideal.');
    }
  }
  
  on Exception catch (e) {
    print(e.toString());
  }
}

double calculoDePeso(double h, String g) {
  if (g == 'm' || g == 'M') {
    return (62.1 * h) - 44.7;
  } else {
    return (72.7 * h) - 58;
  }
}

double? altura() {
  bool alturaValida = false;
  while (!alturaValida) {
    try {
      print('Digite a altura (em metros): ');
      double? h = double.tryParse(stdin.readLineSync()!);
      if (h == null) {
        throw FormatException('Altura inválida!');
      } else if (h <= 0 || h > 3) {
        throw RangeError('Altura deve estar entre 0 e 3 metros.');
      } else {
        alturaValida = true;
        return h;
      }
    } on FormatException catch (e) {
      print('${e.message} Digite novamente.');
    } on RangeError catch (e) {
      print('${e.message} Digite novamente.');
    }
  }
}

String? genero() {
  bool validateGenero = false;
  while (!validateGenero) {
    try {
      print('Insira o genero (M para mulher e H para homem): ');
      String g = stdin.readLineSync()!.toLowerCase();
      if (g != 'h' && g != 'm' && g != 'H' && g != 'M') {
        throw FormatException('Genero inválido!');
      } else {
        validateGenero = true;
        return g;
      }
    } on FormatException catch (e) {
      print('${e.message} Digite M para mulher ou H para homem.');
    }
  }
}
