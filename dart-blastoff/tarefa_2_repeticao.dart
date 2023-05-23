import 'dart:io';

void main() {
  List<int> idades = [];
  int n;
  String classificacao;
   print('\n------ Calcular Idade Média ------\n');

 
  do {
    try {
      stdout.write('Quantas pessoas deseja cadastrar?: ');
      n = int.parse(stdin.readLineSync()!);
      if (n <= 0) {
        print('Digite um número maior que zero.\n');
      } else {
        break;
      }
    } on FormatException {
      print('Por favor, digite um número inteiro válido.\n');
    } on RangeError {}
  } while (true);

  for (int i = 1; i <= n; i++) {
    int idade;
    do {
      try {
        stdout.write('Digite a idade da pessoa $i: ');
        idade = int.parse(stdin.readLineSync()!);
        if (idade >= 0 && idade <= 118) {
          idades.add(idade);
          break;
        } else {
          print('Por favor, digite um número inteiro válido entre 0 e 118.');
        }
      } on FormatException {
        print('Por favor, digite um número inteiro válido.');
      }
    } while (true);
  }

  double mediaIdade = idades.reduce((a, b) => a + b) / n;
 
  if (mediaIdade <= 25) {
    classificacao = 'jovem';
  } else if (mediaIdade <= 60) {
    classificacao = 'adulta';
  } else {
    classificacao = 'idosa';
  }
  print('A média de idade da turma é de ${mediaIdade.toStringAsFixed(0)} anos, portanto a turma é $classificacao.\n');
}
