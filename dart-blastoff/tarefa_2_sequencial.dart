import 'dart:io';

void main() {
    double pesoLimite = 50.0;
    double multaValor = 4.0;
    bool continuar = true;

    print('------ Calcular Multa ------\n');
    double peso = inserirPeso()!;

    if (peso > pesoLimite) {
        double excesso = peso - pesoLimite;
        double multa = excesso * multaValor;

        print("O peso limite foi ultrapassado em $excesso kg");
        print("O valor da multa será de R\$ ${multa.toStringAsFixed(2)}");
    } else {
        print("O peso não foi ultrapassado.");
    }
}

double? inserirPeso() {
  bool validatePeso = false;
  while (!validatePeso) {
    try{
        print('Digite o peso do peixe (em kg):');
            double? peso = double.tryParse(stdin.readLineSync()!);
        if (peso == null) {
            throw FormatException('Peso inválido!');
        } else if (peso > 0 && peso <= 2500) {
        validatePeso = true;
            return peso;
        } else {
            throw RangeError('Peso deve estar entre 0 e 2500 kg.');
        }
    } on FormatException catch (e) {
        print('${e.message} Digite novamente.');
    } on RangeError catch (e) {
        print('${e.message} Digite novamente.');
    }
  }
}
