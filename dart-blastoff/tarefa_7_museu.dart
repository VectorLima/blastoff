
import 'dart:io';
import 'dart:core';
import 'dart:math';

class Visitante {
  String nome;
  String cpf;
  DateTime dataNascimento;
  int codTema;
  static const int itensVintage = 135;
  static const int itensNumismatica = 300;
  static const int itensHistoriaMusica = 67;
  static const int itensPinturas = 72;
  static const int itensEsculturas = 46;
  Visitante(this.nome, this.cpf, this.dataNascimento, this.codTema);

  void qtdItensExpostos() {
    int total = itensVintage +
        itensNumismatica +
        itensHistoriaMusica +
        itensPinturas +
        itensEsculturas;
    print('Quantidade de itens que têm exposto no museu: $total unidades.');
  }

  String obterNomeTema() {
    switch (codTema) {
      case 1:
        return 'Vintage (computadores e videogames antigos)';
      case 2:
        return 'Numismática (notas e moedas antigas)';
      case 3:
        return 'História da música';
      case 4:
        return 'Pinturas';
      case 5:
        return 'Esculturas';
      default:
        return 'Tema desconhecido';
    }
  }
}

class VisitantePremium extends Visitante {
  late double saldo;
  int numeroVale = Random().nextInt(10000);

  static const double valorValeRefeicao = 100.0;

  VisitantePremium(
      String nome, String cpf, DateTime dataNascimento, int codTema, this.saldo)
      : super(nome, cpf, dataNascimento, codTema);

  int getNumeroVale() {
    return numeroVale;
  }

  double calcularSaldoRestante(double totalGasto) {
    if (totalGasto > 100) {
      print("Saldo insuficiente!");
      return saldo;
    }
    return saldo - totalGasto;
  }
}

void main() {
  print('******** Sistema de Museu ******** ');
  int quantidadeVisitantes = lerQuantidadeVisitantes();
  clearConsole();
  for (int i = 1; i <= quantidadeVisitantes; i++) {
    print('Informe os dados do visitante $i:');
    print('Digite o nome:');
    String nome = lerNome();
    clearConsole();
    print('Digite o CPF no formato xxx.xxx.xxx-xx :');
    String cpf = lerCpf();
    clearConsole();
    print('Digite a data no formato DD/MM/AAAA:');
    DateTime dataNascimento = lerData()!;
    clearConsole();
    print(
        'Escolha o tema: \n (1) Vintage (computadores e videogames antigos)\n (2) Numismática (notas e moedas antigas) \n (3) História da música \n (4) Pinturas\n (5) Esculturas');
    int codTema = lerCodTema();
    clearConsole();
    print('O visitante é premium? (1)Sim (2)Não');
    int vistPremium = lerVistPremium();
    clearConsole();
    if (vistPremium == 1) {
      VisitantePremium visitantePremium = VisitantePremium(nome, cpf,
          dataNascimento, codTema, VisitantePremium.valorValeRefeicao);
      print('Número do vale-refeição: ${visitantePremium.getNumeroVale()}');
      print('Quanto foi gasto pelo visitante?');
      double totalGastoPorVisitante = lerSaldo();
      double saldoRestante =
          visitantePremium.calcularSaldoRestante(totalGastoPorVisitante);
      print('Saldo restante de ${visitantePremium.nome}: R\$$saldoRestante');
      print(
          '${visitantePremium.nome} visitou: ${visitantePremium.obterNomeTema()}\n');
      visitantePremium.qtdItensExpostos();
    } else {
      Visitante visitante = Visitante(nome, cpf, dataNascimento, codTema);
      print('${visitante.nome} visitou: ${visitante.obterNomeTema()}\n');
      visitante.qtdItensExpostos();
    }
  }
}

bool nomeValido(String nome) {
  RegExp regex = RegExp(r'^[A-Za-z]+( [A-Za-z]+)*$');
  return regex.hasMatch(nome);
}

String lerNome() {
  bool dadosValido = false;
  String? nome;
  while (!dadosValido) {
    nome = stdin.readLineSync()!;
    if (nomeValido(nome)) {
      dadosValido = true;
    } else {
      print('Nome inválido! Digite novamente:');
    }
  }
  return nome!;
}

String lerCpf() {
  bool dadosValido = false;
  String? cpf;
  while (!dadosValido) {
    cpf = stdin.readLineSync()!;
    if (cpfFormatoValido(cpf)) {
      dadosValido = true;
    } else {
      print('Número de CPF inválido! Digite novamente:');
    }
  }
  return cpf!;
}

int lerCodTema() {
  bool dadosValido = false;
  int? codTema;
  while (!dadosValido) {
    codTema = int.tryParse(stdin.readLineSync()!);
    if (codTema != null && codTema > 0) {
      dadosValido = true;
    } else {
      print('Código do tema inválido! Digite novamente:');
    }
  }
  return codTema!;
}

double lerSaldo() {
  bool dadosValido = false;
  double? saldo;
  while (!dadosValido) {
    saldo = double.tryParse(stdin.readLineSync()!);
    if (saldo != null && saldo >= 0) {
      dadosValido = true;
    } else {
      print('Valor inválido! Digite novamente:');
    }
  }
  return saldo!;
}

DateTime? lerData() {
  bool dadosValidos = false;
  DateTime? data;

  while (!dadosValidos) {
    String? entrada = stdin.readLineSync();
    if (entrada != null) {
      List<String> dataSplit = entrada.split('/');
      if (dataSplit.length == 3) {
        int dia = int.tryParse(dataSplit[0]) ?? 0;
        int mes = int.tryParse(dataSplit[1]) ?? 0;
        int ano = int.tryParse(dataSplit[2]) ?? 0;

        if (dia > 0 && mes > 0 && ano > 1930 && ano <= 2024) {
          try {
            data = DateTime(ano, mes, dia);
            if (data.month == mes && data.day == dia && data.year == ano) {
              dadosValidos = true;
            } else {
              throw FormatException('Data inválida!');
            }
          } catch (e) {
            print('Data inválida! Digite novamente (DD/MM/AAAA):');
          }
        } else {
          print('Data inválida! Digite novamente (DD/MM/AAAA):');
        }
      } else {
        print('Data inválida! Digite novamente (DD/MM/AAAA):');
      }
    }
  }

  return data;
}

int lerQuantidadeVisitantes() {
  int? quantidade;
  bool dadosValido = false;

  print('Informe a quantidade de visitantes:');

  while (!dadosValido) {
    quantidade = int.tryParse(stdin.readLineSync()!);
    if (quantidade != null && quantidade > 0) {
      dadosValido = true;
    } else {
      print('Quantidade inválida! Digite novamente:');
    }
  }
  return quantidade!;
}

int lerVistPremium() {
  bool opcaoValida = false;
  int? opcao;
  while (!opcaoValida) {
    opcao = int.tryParse(stdin.readLineSync()!);
    if (opcao == 1) {
      opcaoValida = true;
      return 1;
    } else if (opcao == 2) {
      opcaoValida = true;
      return 2;
    } else {
      print('Entrada inválida! Digite (1) para sim ou (2) para não.');
    }
  }
  return 0;
}

void clearConsole() {
  print('\x1B[2J\x1B[0;0H');
}