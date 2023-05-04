import 'dart:io';

void main() {
    print('------ Comparar Strings ------\n');
    
    print('Insira a primeira string:');
    String texto1 = stdin.readLineSync()!.toLowerCase();
    print('Insira a segunda string:');
    String texto2 = stdin.readLineSync()!.toLowerCase();

    print('Tamanho de "$texto1": ${texto1.length} caracteres');
    print('Tamanho de "$texto2": ${texto2.length} caracteres');

    if (texto1.length == texto2.length) {
      print('As duas strings são de tamanhos iguais.');
    } else {
      print('As duas strings são de tamanhos diferentes.');
    }

    if (texto1 == texto2) {
      print('As duas strings possuem conteúdo iguais.');
    } else {
      print('As duas strings possuem conteúdo diferente.');
    }
}
