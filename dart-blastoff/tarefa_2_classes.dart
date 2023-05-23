import 'dart:io';

class BombaCombustivel {
  String tipoCombustivel;
  double valorLitro;
  double quantidadeCombustivel;

  BombaCombustivel(
      this.tipoCombustivel, this.valorLitro, this.quantidadeCombustivel);

  void abastecerValor(double valor) {
    double litros = valor / valorLitro;
    if (litros <= quantidadeCombustivel) {
      quantidadeCombustivel -= litros;
      print(
          "Litros abastecidos: ${litros.toStringAsFixed(2)} \n Valor: R\$${valor.toStringAsFixed(2)}");
    } else {
      print("A bomba não possui quantidade suficiente de combustível.");
    }
  }

  void abastecerLitro(double litros) {
    double valor = litros * valorLitro;
    if (litros <= quantidadeCombustivel) {
      quantidadeCombustivel -= litros;
      print(
          "Litros abastecidos: ${litros.toStringAsFixed(2)}\n Valor: R\$${valor.toStringAsFixed(2)}");
    } else {
      print("A bomba não possui quantidade suficiente de combustível.");
    }
  }

  double alterarValor(double novoValorLitro) {
    return valorLitro = novoValorLitro;
  }

  String alterarCombustivel(String novoTipoCombustivel) {
    return tipoCombustivel = novoTipoCombustivel;
  }

  double alterarQuantidadeCombustivel(double novaQuantidadeCombustivel) {
    return quantidadeCombustivel = novaQuantidadeCombustivel;
  }
}

void main() {
  BombaCombustivel bombaCombustivelGasolina =
      BombaCombustivel("Gasolina", 5.52, 150);
  BombaCombustivel bombaCombustivelAlcool =
      BombaCombustivel("Alcool", 3.96, 150);

  print('------------ Posto de Gasolina ------------\n');

  print("Selecione o tipo de combustível: A para Álcool ou G para Gasolina.");
  String tipoCombustivel = lerTipoCombustivel();

  print("Gostaria de abastecer por litro (L) ou por valor (V)?");
  String opcao = litroValor();

  print("Digite a quantidade:");
  double quantidade = validar();
  abastecer(tipoCombustivel, opcao, quantidade, bombaCombustivelGasolina,
      bombaCombustivelAlcool);
}

void abastecer(
    String tipoCombustivel,
    String opcao,
    double quantidade,
    BombaCombustivel bombaCombustivelGasolina,
    BombaCombustivel bombaCombustivelAlcool) {
  if (tipoCombustivel == 'G') {
    if (opcao == 'V') {
      bombaCombustivelGasolina.abastecerValor(quantidade);
    } else {
      bombaCombustivelGasolina.abastecerLitro(quantidade);
    }
    print(
        "Quantidade de Gasolina restante no posto: ${bombaCombustivelGasolina.quantidadeCombustivel.toStringAsFixed(2)}");
  } else {
    if (opcao == 'V') {
      bombaCombustivelAlcool.abastecerValor(quantidade);
    } else {
      bombaCombustivelAlcool.abastecerLitro(quantidade);
    }
    print(
        "Quantidade de Alcool restante no posto: ${bombaCombustivelAlcool.quantidadeCombustivel.toStringAsFixed(2)}");
  }
}

double validar() {
  bool validador = false;
  double? entrada;
  while (!validador) {
    entrada = double.tryParse(stdin.readLineSync()!);
    if (entrada != null && entrada > 0) {
      validador = true;
    } else {
      print('O tipo inserido é inválido. Digite novamente:');
    }
  }
  return entrada!;
}

String litroValor() {
  bool validador = false;
  String? entrada;
  while (!validador) {
    entrada = stdin.readLineSync()!.toUpperCase();
    if (entrada == 'V' || entrada == 'L') {
      validador = true;
    } else {
      print('O tipo inserido é inválido. Digite novamente:');
    }
  }
  return entrada!;
}

String lerTipoCombustivel() {
  bool validador = false;
  String? entrada;
  while (!validador) {
    entrada = stdin.readLineSync()!.toUpperCase();
    if (entrada == 'G' || entrada == 'A') {
      validador = true;
    } else {
      print('O tipo inserido é inválido. Digite novamente:');
    }
  }
  return entrada!;
}
