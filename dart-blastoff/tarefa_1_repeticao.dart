import 'dart:io';

void main() {
  List<int> clientes = [];
  int totalClientes = 0;
  int? codigo, codigoGordo, codigoMagro, codigoAlto, codigoBaixo;
  double? altura, peso, pesoGordo, pesoMagro, alturaAlto, alturaBaixo;
  double totalAlturas = 0, totalPesos = 0;

  alturaAlto = double.negativeInfinity;
  alturaBaixo = double.infinity;
  pesoGordo = double.negativeInfinity;
  pesoMagro = double.infinity;

  while (true) {
    print('------- Academia -------\n');
    codigo = registrarCliente(clientes);

    if (codigo == 0) {
      break;
    }

    altura = registrarAltura();
    peso = registrarPeso();
    alturaAlto = 0.5;

    if (altura! > alturaAlto) {
      alturaAlto = altura;
      codigoAlto = codigo;
    }

    if (altura < alturaBaixo!) {
      alturaBaixo = altura;
      codigoBaixo = codigo;
    }

    if (peso! > pesoGordo!) {
      pesoGordo = peso;
      codigoGordo = codigo;
    }

    if (peso < pesoMagro!) {
      pesoMagro = peso;
      codigoMagro = codigo;
    }
    totalAlturas += altura;
    totalPesos += peso;
    totalClientes++;
  }

  if (totalClientes > 0) {
    double? mediaAlturas = totalAlturas / totalClientes;
    double? mediaPesos = totalPesos / totalClientes;

    print(
        'O cliente mais alto possui o código $codigoAlto e tem uma altura de ${alturaAlto!.toStringAsFixed(2)} metros.');
    print(
        'O cliente mais baixo possui o código $codigoBaixo e tem uma altura de ${alturaBaixo!.toStringAsFixed(2)} metros.');
    print(
        'O cliente mais gordo possui o código $codigoGordo e tem um peso de ${pesoGordo!.toStringAsFixed(2)} kg.');
    print(
        'O cliente mais magro possui o código $codigoMagro e tem um peso de ${pesoMagro!.toStringAsFixed(2)} kg.');
    print(
        'A média de alturas dos clientes é de ${mediaAlturas.toStringAsFixed(2)} metros.');
    print(
        'A média de pesos dos clientes é de ${mediaPesos.toStringAsFixed(2)} kg.');
  } else {
    print('\nNão há clientes inseridos.\n');
  }
}

int? registrarCliente(List<int> clientes) {
  while (true) {
    try {
      stdout.write(
          'Insira o código do cliente (digite 0 para sair e exibir os resultados): ');
      int? codigo = int.tryParse(stdin.readLineSync()!);
      if (codigo == null || clientes.contains(codigo)) {
        throw FormatException('Código inválido.');
      } else if (codigo == 0) {
        return 0;
      } else if (codigo < 0) {
        throw RangeError('Código inválido.');
      } else {
        clientes.add(codigo);
        return codigo;
      }
    } catch (e) {
      print('Código inválido. Digite novamente.\n');
    }
  }
}

double? registrarAltura() {
  bool validateAltura = false;
  while (!validateAltura) {
    stdout.write('Digite a altura (em metros): ');
    try {
      double? altura = double.parse(stdin.readLineSync()!);
      if (altura == null) {
        throw FormatException('Altura inválida.');
      } else if (altura > 0.5 && altura <= 3) {
        validateAltura = true;
        return altura;
      } else {
        throw RangeError('Altura inválida.');
      }
    } catch (e) {
      print('Altura inválida. Digite novamente.\n');
    }
  }
}

double? registrarPeso() {
  bool validatePeso = false;
  while (!validatePeso) {
    stdout.write('Digite o peso do cliente (em kg): ');
    try {
      double? peso = double.parse(stdin.readLineSync()!);
      if (peso == null) {
        throw FormatException('Peso inválido.');
      } else if (peso > 0 && peso <= 595) {
        validatePeso = true;
        return peso;
      } else {
        throw FormatException('Peso inválido.');
      }
    } catch (e) {
      print('Peso inválido. Digite novamente.');
    }
  }
}
