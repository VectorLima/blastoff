import 'dart:io';

void main() {
  bool cpfValido = false;
  while (!cpfValido) {
    try {
      print('Digite o CPF (formato xxx.xxx.xxx-xx):');
      String? cpf = stdin.readLineSync();
      if (cpf == null || cpf.length != 14 || !cpf.contains('-')) {
        throw FormatException('CPF inválido!');
      }

      cpf = cpf.replaceAll('-', '').replaceAll('.', '');
      int soma = 0;
      for (int i = 0; i < 9; i++) {
        soma += int.parse(cpf[i]) * (10 - i);
      }
      int primeiroDigito = 11 - (soma % 11);
      if (primeiroDigito > 9) {
        primeiroDigito = 0;
      }

      soma = 0;
      for (int i = 0; i < 10; i++) {
        soma += int.parse(cpf[i]) * (11 - i);
      }
      int segundoDigito = 11 - (soma % 11);
      if (segundoDigito > 9) {
        segundoDigito = 0;
      }

      if (cpf[9] == primeiroDigito.toString() && cpf[10] == segundoDigito.toString()) {
        cpfValido = true;
        print('CPF válido!');
      } else {
        throw FormatException('CPF inválido!');
      }
    } on FormatException catch (e) {
      print('${e.message} Digite novamente.');
    }
  }
}
