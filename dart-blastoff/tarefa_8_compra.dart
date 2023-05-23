import 'dart:io';

class Compra {
  double preco;
  int parcelas;
  String tipo;

  Compra(this.preco, this.parcelas, this.tipo);

  void pagarParcela() {
    double precoParcela = preco / parcelas;
    parcelas -= 1;
    preco = preco - precoParcela;
  }

  void quitarCompra() {
    preco = 0;
    parcelas = 0;
  }

  void cancelarCompra() {
    print('Compra cancelada');
    parcelas = 0;
    preco = 0;
  }

  void atualizarParcela(double juros, int novaQtdParcelas) {
    parcelas = novaQtdParcelas;
    double precoFinal = preco + (preco * juros * novaQtdParcelas);
    this.preco = precoFinal;
  }
}

class ContaEstudante extends Compra {
  ContaEstudante(double preco, int parcelas, String tipo)
      : super(preco, parcelas, tipo);

  @override
  void pagarParcela() {
    double precoParcela = preco / parcelas;
    parcelas -= 1;
    preco = preco - precoParcela;
  }

  @override
  void quitarCompra() {
    parcelas = 0;
    preco = 0;
  }
}

void main() {
  double preco;
  int parcelas;
  String tipo;
  int opcao;

    print('---------- Compra ----------');
    print('Insira: \n (1) Compra\n (2) Conta de Estudante');
    int entrada = tipoCompra();
    if (entrada == 1) {
      print('Insira o preço:');
      preco = inserirSaldo();
      print('Insira o número de parcelas:');
      parcelas = inserirParcela();
      print('Insira o tipo do produto:');
      tipo = inserirNome();
      
      Compra compra = Compra(preco, parcelas, tipo);
      verificarTipoObjeto(compra);
      print('Escolha uma opção:\n(1) Pagar parcelas\n(2) Atualizar parcelas\n(3) Quitar compra\n(4) Cancelar compra');
      opcao = lerOpcao();
      menuCompra(opcao, compra);
    } else {
      print('Insira o preço:');
      preco = inserirSaldo();
      print('Insira o número de parcelas:');
      parcelas = inserirParcela();
      print('Insira o tipo do produto:');
      tipo = inserirNome();
      
      ContaEstudante contaEstudante = ContaEstudante(preco, parcelas, tipo);
      verificarTipoObjeto(contaEstudante);
      print('Escolha uma opção:\n (1) Pagar parcelas\n (2) Quitar compra');
      opcao = lerOpcao();
      menuEstudante(opcao, contaEstudante);
    }
}

void verificarTipoObjeto(Object obj) {
  if (obj is ContaEstudante) {
    if (obj.parcelas > 0) {
      double precoComDesconto = obj.preco / 2;
      int parcelasComDesconto = obj.parcelas ~/ 2;
      obj.preco = precoComDesconto;
      obj.parcelas = parcelasComDesconto;
      print('Preço com desconto: ${precoComDesconto.toStringAsFixed(2)}');
      print('Total de parcelas com desconto: $parcelasComDesconto');
    } else {
      obj.quitarCompra();
      print('Preço com desconto: ${obj.preco}');
      print('Total de parcelas com desconto: ${obj.parcelas}');
    }
  } else if (obj is Compra) {
    double totalPreco = obj.preco * obj.parcelas;
    int totalParcelas = obj.parcelas;
    obj.preco = totalPreco;
    obj.parcelas = totalParcelas;
    print('Preço total: ${totalPreco.toStringAsFixed(2)}');
    print('Total de parcelas: $totalParcelas');
  }
}

void menuCompra(int entrada, Compra compra) {
  const double juros = 0.1;
  switch (entrada) {
    case 1:
      compra.pagarParcela();
      print('Parcelas restantes após pagamento: ${compra.parcelas}');
      print('Valor restante ${compra.preco} reais');
      break;
    case 2:
      print('Insira o novo número de parcelas: ');
      int novasParcelas = inserirParcela();
      compra.atualizarParcela(juros, novasParcelas);
      
      print('Preço atualizado: ${compra.preco}');
      print('Parcelas atualizadas: ${compra.parcelas}');
      break;
    case 3:
      compra.quitarCompra();
      print('Parcelas após quitar compra: ${compra.parcelas}');
      print('Valor restante ${compra.preco} reais');
      break;
    case 4:
      compra.cancelarCompra();
      print('Parcelas após cancelar compra: ${compra.parcelas}');
      print('Valor restante ${compra.preco} reais');
      break;
    default:
      print('Opção inválida!');
      break;
  }
}

void menuEstudante(int entrada, ContaEstudante contaEstudante) {
  switch (entrada) {
    case 1:
      contaEstudante.pagarParcela();
      print('Parcelas restantes após pagamento: ${contaEstudante.parcelas}');
      print('Valor restante ${contaEstudante.preco} reais');
      break;
    case 2:
      contaEstudante.quitarCompra();
      print('Parcelas após quitar conta: ${contaEstudante.parcelas}');
      print('Valor restante ${contaEstudante.preco} reais');
      break;
    default:
      print('Opção inválida!');
      break;
  }
}

int tipoCompra() {
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
      print('Tipo de compra inválido. Insira (1) Compra ou (2) Conta de Estudante:');
    }
  }
  return 0;
}

double inserirSaldo() {
  bool validar = false;
  double? saldo;
  while (!validar) {
    saldo = double.tryParse(stdin.readLineSync()!);
    if (saldo != null && saldo > 0) {
      validar = true;
    } else {
      print('Saldo inválido. Tente novamente:');
    }
  }
  return saldo!;
}

bool validarNome(String nome) {
  RegExp regex = RegExp(r'^[A-Za-z0-9]+( [A-Za-z0-9]+)*$');
  return regex.hasMatch(nome);
}

String inserirNome() {
  bool validar = false;
  String? nome;
  while (!validar) {
    nome = stdin.readLineSync()!;
    if (validarNome(nome)) {
      validar = true;
    } else {
      print('Nome inválido. Tente novamente:');
    }
  }
  return nome!;
}

int inserirParcela() {
  int? parcela;
  bool validar = false;
  while (!validar) {
    parcela = int.tryParse(stdin.readLineSync()!);
    if (parcela != null && parcela > 0) {
      validar = true;
    } else {
      print('Parcela inválida! Tente novamente:');
    }
  }
  return parcela!;
}

int lerOpcao() {
  int? opcao;
  bool validar = false;
  while (!validar) {
    opcao = int.tryParse(stdin.readLineSync()!);
    if (opcao != null && opcao > 0 && opcao <= 4) {
      validar = true;
    } else {
      print('Parcela inválida! Tente novamente:');
    }
  }
  return opcao!;
}
