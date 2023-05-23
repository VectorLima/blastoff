import 'dart:io';

void main() {
  print('-------------- Calculadora --------------\n');

  double numero1 = pedirNumero("Digite o primeiro número: ");
  double numero2 = pedirNumero("Digite o segundo número: ");

  stdout.write("Escolha uma operação (+, -, *, /): ");
  String operacao = stdin.readLineSync()!;

  double resultado = calcular(numero1, numero2, operacao);
  if (resultado.isNaN) {
    print('Operação inválida!');
  } else {
    print("O resultado é: $resultado (${propriedadesNumero(resultado)})");
  }
}

double pedirNumero(String mensagem) {
  while (true) {
    stdout.write(mensagem);
    String? input = stdin.readLineSync();
    if (input != null && input.isNotEmpty) {
      double? numero = double.tryParse(input);
      if (numero != null) {
        return numero;
      }
    }
    print('Número inválido! Tente novamente.');
  }
}

double calcular(double numero1, double numero2, String operacao) {
  switch (operacao) {
    case "+":
      return numero1 + numero2;
    case "-":
      return numero1 - numero2;
    case "*":
      return numero1 * numero2;
    case "/":
      if (numero2 > 0) {
        return numero1 / numero2;
      } else {
        return double.nan;
      }
    default:
      return double.nan;
  }
}

String propriedadesNumero(double numero) {
  String tipo = "";
  if (numero % 2 == 0) {
    tipo += "par ";
  } else {
    tipo += "ímpar ";
  }

  if (numero > 0) {
    tipo += "positivo ";
  } else if (numero < 0) {
    tipo += "negativo ";
  }

  if (numero == numero.toInt().toDouble()) {
    tipo += "inteiro";
  } else {
    tipo += "decimal";
  }

  return tipo;
}