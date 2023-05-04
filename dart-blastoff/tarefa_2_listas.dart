import 'dart:math';

void main() {

  List<int> contadores = List<int>.filled(6, 0);

  for (int i = 0; i < 100; i++) {
    int valorDado = Random().nextInt(6) + 1;

    contadores[valorDado - 1]++;
  }

  for (int i = 0; i < 6; i++) {
    print("O valor ${i + 1} foi obtido ${contadores[i]} vezes");
  }
}
