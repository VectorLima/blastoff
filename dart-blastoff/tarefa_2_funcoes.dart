import 'dart:io';

void main() {
  int n;
  while (true) {
    stdout.write("Digite um número: ");
    String? input = stdin.readLineSync();
    if (input != null && int.tryParse(input)! > 0) {
      n = int.parse(input);
      break;
    }
    print("Número inválido, tente novamente.");
  }
  imprimirNumerosAteN(n);
}

void imprimirNumerosAteN(int n) {
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write("$j\t");
    }
    stdout.write("\n");
  }
}