
import 'dart:math';

class Matriz {
  List<List<int>> matriz = List.generate(
      3, (i) => List.generate(4, (j) => 0, growable: false),
      growable: false);

  void alimentar() {
    int valor = 0;
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[i].length; j++) {
        matriz[i][j] = valor;
        valor++;
        if (valor > 50) {
          break;
        }
      }
    }
  }

  int somar() {
    int soma = 0;
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[i].length; j++) {
        soma += matriz[i][j];
      }
    }
    return soma;
  }

  void mostrarMenorMaior() {
    int menor = matriz[0][0];
    int maior = matriz[0][0];
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[i].length; j++) {
        if (matriz[i][j] < menor) {
          menor = matriz[i][j];
        }
        if (matriz[i][j] > maior) {
          maior = matriz[i][j];
        }
      }
    }
    print('Menor valor da matriz: $menor');
    print('Maior valor da matriz: $maior');
  }

  double calcularMedia() {
    int soma = somar();
    int quantidade = matriz.length * matriz[0].length;
    return soma / quantidade;
  }

  void mostrarMatriz() {
    String matrizString = '[';

    for (int i = 0; i < matriz.length; i++) {
      String linhaString = matriz[i].toString();
      matrizString += linhaString;

      if (i != matriz.length - 1) {
        matrizString += ', ';
      }
    }

    matrizString += ']';

    print(matrizString);
  }
}

class Pessoa {
  String nome;
  String endereco;
  String telefone;
  int idade;
  double altura;

  Pessoa(this.nome, this.endereco, this.telefone, this.idade, this.altura);

  void imprimirMensagem() {
    print('Nome: ${nome};\nEndereço: ${endereco};\nTelefone: ${telefone};\nIdade: ${idade};\nAltura: ${altura}m;');
  }
}

class Vetor {
  List<double> vetor = List.filled(5, 0.0);

  void alimentar() {
    for (int i = 0; i < vetor.length; i++) {
      double numeroAleatorio =
          double.parse((Random().nextDouble() * 100).toStringAsFixed(2));
      vetor[i] = numeroAleatorio;
    }
  }

  void mostrar() {
    print(vetor);
  }

  void mostrarParteInteira() {
    print(vetor.map((v) => v.toInt()).toList());
  }

  void multiplicarPorInteiro(int n) {
    print(vetor.map((v) => v * n).toList());
  }
}

void main() {
  Vetor vetor = Vetor();
  print("\n------ Vetor -------");
  vetor.alimentar();
  print("Mostrando vetor em float:");
  vetor.mostrar();
  print("Mostrando vetor em inteiro:");
  vetor.mostrarParteInteira();
  print("Multiplicando por um numero inteiro:");
  vetor.multiplicarPorInteiro(2);

  Matriz matriz = Matriz();
  print("\n------- Matriz -------");
  matriz.alimentar();
  print("Mostrando a matriz gerada:");
  matriz.mostrarMatriz();
  print("Soma da matriz: ${matriz.somar()}");
  matriz.mostrarMenorMaior();
  print("Media da matriz: ${matriz.calcularMedia()}");

  print("\n------- Pessoa -------");
  Pessoa pessoa = Pessoa('Victor', 'Avenida Brasil, 1247', '11 95691-8715', 30, 1.80);
  pessoa.imprimirMensagem();
}