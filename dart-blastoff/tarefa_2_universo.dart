import 'dart:io';

class CorpoCeleste {
  late String nome;
  late String tipo;
  late double massa;
  late double tamanho;

  void InserirCorpo() {
    do {
      print('Digite o nome do corpo celeste:');
      nome = stdin.readLineSync()?.trim() ?? '';
    } while (nome.isEmpty);
    print('Digite o tipo do corpo celeste (asteroide, planeta ou nebulosa):');
    tipo = stdin.readLineSync()!;
    if (tipo != 'asteroide' && tipo != 'planeta' && tipo != 'nebulosa') {
      print('Tipo inválido! Será definido como asteroide.');
      tipo = 'asteroide';
    }

    do {
      print('Digite a massa do corpo celeste (em kg):');
      massa = double.parse(stdin.readLineSync() ?? '');
    } while (massa == null || massa < 0);

    print('Digite o tamanho do corpo celeste (em km):');
    tamanho = double.parse(stdin.readLineSync()!);
  }
}


void main() {
  List<CorpoCeleste> corpos = [];
  for (int i = 1; i <= 2; i++) {
    print('Digite os dados do corpo celeste $i:');
    CorpoCeleste corpo = CorpoCeleste();
    corpo.InserirCorpo();
    corpos.add(corpo);
  }
  int asteroides = 0;
  int planetas = 0;
  int nebulosas = 0;
  for (CorpoCeleste corpo in corpos) {
    if (corpo.tipo == 'asteroide') {
      asteroides++;
    } else if (corpo.tipo == 'planeta') {
      planetas++;
    } else {
      nebulosas++;
    }
  }
  print('Quantidade de asteroides: $asteroides');
  print('Quantidade de planetas: $planetas');
  print('Quantidade de nebulosas: $nebulosas');
}