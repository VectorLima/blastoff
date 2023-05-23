

import 'dart:io';

class Conta {
  int numeroConta;
  int agencia;
  double saldo;

  Conta(this.numeroConta, this.agencia, this.saldo);
}

class ContaCorrente extends Conta {
  double mensalidade;

  ContaCorrente(int numeroConta, int agencia, double saldo, this.mensalidade)
      : super(numeroConta, agencia, saldo);

  void descontaMensalidade() {
    saldo -= mensalidade;
  }
}

class ContaPoupanca extends Conta {
  double rendimento;

  ContaPoupanca(int numeroConta, int agencia, double saldo, this.rendimento)
      : super(numeroConta, agencia, saldo);

  double calculaRendimento(int nMeses) {
    double saldoFinal = saldo + saldo * rendimento * nMeses;
    return saldoFinal;
  }
}

void main() {
  print("-------- Banco --------");

    print("Escolha o tipo de conta:");
    print("(1) Corrente");
    print("(2) Poupança");
    int tipoConta = contaTipo();
    
    print("Insira o numero da conta (8 digitos): ");
    int conta = contaNumero();

    print("Insira a agência (4 digitos):");
    int agencia = contaAgencia();

    print("Insira o saldo:");
    double saldo = contaSaldo();

    if (tipoConta == 1) {
      print("Insira o valor da mensalidade:");
      double mensalidade = contaSaldo();
      ContaCorrente contaCorrente = ContaCorrente(conta, agencia, saldo, mensalidade);
      if (mensalidade > contaCorrente.saldo) {
        print("Saldo insuficiente!");
      } else {
        contaCorrente.descontaMensalidade();
        print('Saldo final da conta corrente: R\$${contaCorrente.saldo}');
      }
    } else{
      print("Para saber o rendimento digite o numero de meses:");
      int numeroMeses = meses();
      ContaPoupanca contaPoupanca = ContaPoupanca(conta, agencia, saldo, 0.92);
      print('Seu saldo final na conta poupança após ${numeroMeses} meses de rendimento será de R\$${contaPoupanca.calculaRendimento(numeroMeses).toStringAsFixed(2)}.');
    }


}

int contaTipo() {
  bool dadosValido = false;
  int? tipoconta;
  while (!dadosValido) {
    tipoconta = int.tryParse(stdin.readLineSync()!);
    if (tipoconta != null && tipoconta == 1) {
      dadosValido = true;
    } else if (tipoconta != null && tipoconta == 2) {
      dadosValido = true;
    } else {
      print('Por favor, informe o tipo de conta corretamente digitando (1) para Conta Corrente ou (2) para Conta Poupança. A sua resposta ajudará a prosseguir com a sua solicitação.');
    }
  }
  return tipoconta!;
}

int contaNumero() {
  bool dadosValido = false;
  int? conta;
  while (!dadosValido) {
    conta = int.tryParse(stdin.readLineSync()!);
    if (conta != null && conta >= 10000000 && conta <= 99999999) {
      dadosValido = true;
    } else {
      print('Desculpe, o número de conta que você digitou é inválido. Por favor, verifique se digitou corretamente e tente novamente. Certifique-se de que sua conta tenha 8 dígitos.');
    }
  }
  return conta!;
}

int contaAgencia() {
  bool dadosValido = false;
  int? agencia;
  while (!dadosValido) {
    agencia = int.tryParse(stdin.readLineSync()!);
    if (agencia != null && agencia >= 1000 && agencia <= 9999) {
      dadosValido = true;
    } else {
      print('Por favor, verifique a agência e digite novamente. O formato correto é de 4 dígitos.');
    }
  }
  return agencia!;
}

double contaSaldo() {
  bool dadosValido = false;
  double? saldo;
  while (!dadosValido) {
    saldo = double.tryParse(stdin.readLineSync()!);
    if (saldo != null && saldo > 0) {
      dadosValido = true;
    } else {
      print('Saldo inválido! Por favor, verifique novamente:');
    }
  }
  return saldo!;
}

int meses() {
  bool dadosValido = false;
  int? numMeses;
  while (!dadosValido) {
    numMeses = int.tryParse(stdin.readLineSync()!);
    if (numMeses != null && numMeses > 0) {
      dadosValido = true;
    } else {
      print('Número de meses inválido, verifique novamente:');
    }
  }
  return numMeses!;
}
