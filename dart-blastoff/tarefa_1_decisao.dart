import 'dart:io';

void main() {
  double? nota1, nota2;

  do {
    stdout.write('Digite a primeira nota (entre 0 e 10): ');
    nota1 = double.tryParse(stdin.readLineSync() ?? '');
  } while (nota1 == null || nota1 < 0 || nota1 > 10);

  do {
    stdout.write('Digite a segunda nota (entre 0 e 10): ');
    nota2 = double.tryParse(stdin.readLineSync() ?? '');
  } while (nota2 == null || nota2 < 0 || nota2 > 10);

  double media = (nota1 + nota2) / 2;

  String conceito;

  if (media >= 9.0 && media <= 10.0) {
    conceito = 'A';
  } else if (media >= 7.5 && media < 9.0) {
    conceito = 'B';
  } else if (media >= 6.0 && media < 7.5) {
    conceito = 'C';
  } else if (media >= 4.0 && media < 6.0) {
    conceito = 'D';
  } else {
    conceito = 'E';
  }

  print('Notas: $nota1 e $nota2');
  print('Média: $media');
  print('Conceito: $conceito');

  if (conceito == 'A' || conceito == 'B' || conceito == 'C') {
    print('APROVADO');
  } else {
    print('REPROVADO');
  }
}
