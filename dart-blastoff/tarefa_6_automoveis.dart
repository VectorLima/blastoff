import 'dart:io';

class Automovel {
  String placa;
  String modelo;
  int combustivel;
  String cor;
  int ano;

  static const int GASOLINA = 1;
  static const int ALCOOL = 2;
  static const int DIESEL = 3;
  static const int GAS = 4;

  Automovel(this.placa, this.modelo, this.combustivel, this.cor, this.ano);

  double calcularCusto() {
    switch (combustivel) {
      case GASOLINA:
        return 12000.0;
      case ALCOOL:
        return 10500.0;
      case DIESEL:
        return 11000.0;
      case GAS:
        return 13000.0;
      default:
        return 0.0;
    }
  }
}

class AutomovelLuxo extends Automovel {
  bool arCondicionado;
  bool direcaoHidraulica;
  bool vidroEletrico;
  bool computadorDeBordo;

  static const double arCondicionadoPreco = 2000.0;
  static const double direcaoPreco = 1500.0;
  static const double vidroPreco = 800.0;

  AutomovelLuxo(
      String placa, String modelo, int combustivel, String cor, int ano,
      {this.arCondicionado = false,
      this.direcaoHidraulica = false,
      this.vidroEletrico = false,
      this.computadorDeBordo = true})
      : super(placa, modelo, combustivel, cor, ano);

  @override
  double calcularCusto() {
    double custoBase = super.calcularCusto();
    double custoAcessorios = 0.0;
    if (arCondicionado) {
      custoAcessorios += arCondicionadoPreco;
    }
    if (direcaoHidraulica) {
      custoAcessorios += direcaoPreco;
    }
    if (vidroEletrico) {
      custoAcessorios += vidroPreco;
    }
    return custoBase + custoAcessorios;
  }
}

void main() {

    print('------------- Calcular Custo de Automóvel -------------');
    String placa = obterPlacaDoCarro();
    String modelo = modeloCarro();
    print("Tipo de Combustível: \n (1) Gasolina \n (2) Álcool \n (3) Diesel \n (4) Gás");
    int tipoCombustivel = combustivel(combustivelCarro());

    String cor = corCarro();
    
    print("Digite o ano do seu veiculo (4 digitos):");
    int ano = anoCarro();
    
    print("Seu veiculo é de luxo: (1) Sim (2) Não");
    int automovelLuxo = luxoCarro();
    
    
    if (automovelLuxo == 1) {
      print("Possui ar-condicionado: (1) Sim (2) Não");
      bool arcondicionado = opcao()!;
      ;
      print("Possui direção hidraulica: (1) Sim (2) Não");
      bool direcaoHidraulica = opcao()!;
      ;
      print("Possui vidros eletricos: (1) Sim (2) Não");
      bool vidroEletrico = opcao()!;
      ;
      AutomovelLuxo carroLuxo = AutomovelLuxo(
          placa, modelo, tipoCombustivel, cor, ano,
          arCondicionado: arcondicionado,
          direcaoHidraulica: direcaoHidraulica,
          vidroEletrico: vidroEletrico);
      double custoCarroLuxo = carroLuxo.calcularCusto();
      print("Custo do automóvel de luxo: $custoCarroLuxo");
    } else {
      Automovel carro = Automovel(placa, modelo, tipoCombustivel, cor, ano);
      double custoCarro = carro.calcularCusto();
      print("Custo do automóvel: $custoCarro\nAno: ${carro.ano}\nModelo: ${carro.modelo}\nCor: ${carro.cor} ");
  }
}

int combustivel(int entrada) {
  switch (entrada) {
    case 1:
      return Automovel.GASOLINA;
    case 2:
      return Automovel.ALCOOL;
    case 3:
      return Automovel.DIESEL;
    case 4:
      return Automovel.GAS;
    default:
      return 0;
  }
}

String obterPlacaDoCarro() {
  String placa;
  do {
    print("Por favor, informe a placa do veículo (formato: ABC1234): ");
    placa = stdin.readLineSync()!.toUpperCase();
  } while (!verificarPlacaNoDetran(placa));
  return placa;
}

String corCarro() {
  String cor;
  do {
    print("Digite a cor do automóvel: ");
    cor = stdin.readLineSync()!.trim().toLowerCase();
  } while (cor.isEmpty);
  return cor;
}


String modeloCarro() {
  String modelo;
  do{
  print("Digite o modelo do automóvel: ");
  modelo = stdin.readLineSync()!.toLowerCase();
  } while(modelo.isEmpty);
  return modelo;
}

int combustivelCarro() {
  bool dadosValido = false;
  int? tipoCombustivel;
  while (!dadosValido) {
    tipoCombustivel = int.tryParse(stdin.readLineSync()!);
    if (tipoCombustivel != null &&
        tipoCombustivel > 0 &&
        tipoCombustivel <= 4) {
      dadosValido = true;
    } else {
      print('Tipo de combustível inválido! Digite novamente:');
    }
  }
  return tipoCombustivel!;
}

int luxoCarro() {
  bool dadosValido = false;
  int? automovelLuxo;
  while (!dadosValido) {
    automovelLuxo = int.tryParse(stdin.readLineSync()!);
    if (automovelLuxo != null && automovelLuxo > 0 && automovelLuxo <= 2) {
      dadosValido = true;
    } else {
      print('Entrada inválida! Digite novamente:');
    }
  }
  return automovelLuxo!;
}

int anoCarro() {
  bool dadosValido = false;
  int? ano;
  while (!dadosValido) {
    ano = int.tryParse(stdin.readLineSync()!);
    if (ano != null && ano >= 1000 && ano <= 9999) {
      dadosValido = true;
    } else {
      print('Ano inválido! Digite novamente(4 digitos):');
    }
  }
  return ano!;
}

bool? opcao() {
  bool opcaoValida = false;
  int? opcao;
  while (!opcaoValida) {
    opcao = int.tryParse(stdin.readLineSync()!);
    if (opcao == 1) {
      opcaoValida = true;
      return true;
    } else if (opcao == 2) {
      opcaoValida = true;
      return false;
    } else {
      print('Entrada inválida! Digite 1 para sim ou 2 para não.');
    }
  }
}

bool verificarPlacaNoDetran(String placa) {
  RegExp validarPlaca = RegExp(r'^[A-Z]{3}[0-9]{4}$');
  return validarPlaca.hasMatch(placa);
}
