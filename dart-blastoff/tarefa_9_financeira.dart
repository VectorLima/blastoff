import 'dart:io';

class Contrato {
  int numero;
  String contratante;
  double valor;
  int prazo;

  Contrato(this.numero, this.contratante, this.valor, this.prazo);

  double prestacao() {
    return valor / prazo;
  }

  void mostrarContrato() {
    print("Nome do contratante: $contratante");
    print("Valor do contrato: $valor");
    print("Valor da prestação: ${prestacao().toStringAsFixed(2)}");
    print("Prazo: $prazo meses");
  }
}
class ContratoPessoaFisica extends Contrato {
  String cpf;
  int idade;

  ContratoPessoaFisica(int numero, String contratante, double valor, int prazo,
      this.cpf, this.idade)
      : super(numero, contratante, valor, prazo);

  @override
  double prestacao() {
    double adicional;
    if (idade >= 18 && idade <= 30) {
      adicional = 1.0;
    } else if (idade <= 40) {
      adicional = 2.0;
    } else if (idade <= 50) {
      adicional = 3.0;
    } else {
      adicional = 4.0;
    }
    return super.prestacao() + adicional;
  }

  @override
  void mostrarContrato() {
    super.mostrarContrato();
    print("Idade do contratante: $idade anos");
  }
}
class ContratoPessoaJuridica extends Contrato {
  String cnpj;
  String inscricaoEstadual;

  ContratoPessoaJuridica(int numero, String contratante, double valor, int prazo, this.cnpj, this.inscricaoEstadual): super(numero, contratante, valor, prazo);

  @override
  double prestacao() {
    return super.prestacao() + 3.0;
  }
}

void main() {
  int numeroContrato;
  String nome;
  double valor;
  int prazo;
 
    print('-------------- Agência Financeira --------------\n');

    print("Insira um tipo de contrato: \n (1) Pessoa física \n (2) Pessoa jurídica");
    int tipo = inserirTipo();

    if (tipo == 1) {
      print("Insira o número do contrato:");
      numeroContrato = inserirContrato();
      print("Insira o nome do contratante:");
      nome = inserirNome();
      print("Insira o valor:");
      valor = inserirSaldo();
      print("Insira o prazo:");
      prazo = inserirPrazo();
      print("Insira o CPF (xxx.xxx.xxx-xx):");
      String cpf = inserirCPF();
      print("Insira a idade (superior a 18 anos):");
      int idade = inserirIdade();
      ContratoPessoaFisica contratoPF = ContratoPessoaFisica(numeroContrato, nome, valor, prazo, cpf, idade);

      print("Contrato Pessoa Física:");
      contratoPF.mostrarContrato();
    } else {
      print("Insira o número do contrato:");
      numeroContrato = inserirContrato();
      print("Insira o nome do contratante:");
      nome = inserirNome();
      print("Insira o valor:");
      valor = inserirSaldo();
      print("Insira o prazo:");
      prazo = inserirPrazo();
      print("Insira o CNPJ (xx.xxx.xxx/xxxx-xx):");
      String cnpj = inserirCNPJ();
      print("Insira a o número dainscricao estadual (xxx.xxx.xxx.xxx)");
      String inscEstadual = inserirIE();
      ContratoPessoaJuridica contratoPJ = ContratoPessoaJuridica(
          numeroContrato, nome, valor, prazo, cnpj, inscEstadual);

      print("\nContrato Pessoa Jurídica:");
      contratoPJ.mostrarContrato();
    }
}

int inserirTipo() {
  bool tipoValido = false;
  int? opcao;
  while (!tipoValido) {
    opcao = int.tryParse(stdin.readLineSync()!);
    if (opcao == 1) {
      tipoValido = true;
      return 1;
    } else if (opcao == 2) {
      tipoValido = true;
      return 2;
    } else {
      print('Tipo inválido! Insira (1) Pessoa física ou (2) Pessoa jurídica:');
    }
  }
  return 0;
}

int inserirContrato() {
  int? numContrato;
  bool validar = false;
  while (!validar) {
    numContrato = int.tryParse(stdin.readLineSync()!);
    if (numContrato != null && numContrato > 0) {
      validar = true;
    } else {
      print('Número do contrato inválido. Tente novamente');
    }
  }
  return numContrato!;
}

double inserirSaldo() {
  bool validar = false;
  double? saldo;
  while (!validar) {
    saldo = double.tryParse(stdin.readLineSync()!);
    if (saldo != null && saldo > 0) {
      validar = true;
    } else {
      print('Valor inválido. Tente novamente');
    }
  }
  return saldo!;
}

bool nomeValido(String nome) {
  RegExp regex = RegExp(r'^[A-Za-z]+( [A-Za-z]+)*$');
  return regex.hasMatch(nome);
}

String inserirNome() {
  bool validar = false;
  String? nome;
  while (!validar) {
    nome = stdin.readLineSync()!;
    if (nomeValido(nome)) {
      validar = true;
    } else {
      print('Nome inválido. Tente novamente');
    }
  }
  return nome!;
}

String inserirCPF() {
  bool validar = false;
  String? cpf;
  while (!validar) {
    cpf = stdin.readLineSync()!;
    if (validarCPF(cpf)) {
      validar = true;
    } else {
      print('Número de CPF inválido. Tente novamente');
    }
  }
  return cpf!;
}

int inserirPrazo() {
  int? prazo;
  bool validar = false;
  while (!validar) {
    prazo = int.tryParse(stdin.readLineSync()!);
    if (prazo != null && prazo > 0) {
      validar = true;
    } else {
      print('Prazo inválido. Tente novamente');
    }
  }
  return prazo!;
}

int inserirIdade() {
  int? idade;
  bool validar = false;
  while (!validar) {
    idade = int.tryParse(stdin.readLineSync()!);
    if (idade != null && idade >= 18) {
      validar = true;
    } else {
      print('Idade inválida. Tente novamente');
    }
  }
  return idade!;
}

String inserirIE() {
  bool validar = false;
  String? inscEstadual;
  while (!validar) {
    inscEstadual = stdin.readLineSync()!;
    if (validarIE(inscEstadual)) {
      validar = true;
    } else {
      print('Inscricao estadual inválida. Tente novamente');
    }
  }
  return inscEstadual!;
}

bool validarIE(String inscricao) {
  RegExp regex = RegExp(r'^\d{3}\.\d{3}\.\d{3}\.\d{3}$');
  if (regex.hasMatch(inscricao)) {
    return true;
  }
  return false;
}

String inserirCNPJ() {
  bool validar = false;
  String? cnpj;
  while (!validar) {
    cnpj = stdin.readLineSync()!;
    if (cnpjFormatoValido(cnpj)) {
      validar = true;
    } else {
      print('Número de CNPJ inválido. Tente novamente');
    }
  }
  return cnpj!;
}

bool cnpjFormatoValido(String cnpj) {
  RegExp regex = RegExp(r'^\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$');
  if (!regex.hasMatch(cnpj)) {
    return false;
  }
  cnpj = cnpj.replaceAll(".", "").replaceAll("-", "").replaceAll("/", "");

  if (RegExp(r'^(\d)\1{13}$').hasMatch(cnpj)) return false;

  List<int> digitos = cnpj.split('').map((d) => int.parse(d)).toList();
  int digito1 = calcularDigitoVerificadorCNPJ(digitos.sublist(0, 12));
  int digito2 =
      calcularDigitoVerificadorCNPJ(digitos.sublist(0, 12) + [digito1]);

  return digitos[12] == digito1 && digitos[13] == digito2;
}

int calcularDigitoVerificadorCNPJ(List<int> digitos) {
  List<int> pesos;

  if (digitos.length == 12) {
    pesos = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
  } else {
    pesos = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
  }

  int soma = 0;
  for (int i = 0; i < digitos.length; i++) {
    soma += digitos[i] * pesos[i];
  }
  int resto = soma % 11;

  if (resto < 2) {
    return 0;
  } else {
    return 11 - resto;
  }
}

bool validarCPF(String cpf) {
  RegExp regex = RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$');
  if (!regex.hasMatch(cpf)) {
    return false;
  }
  cpf = cpf.replaceAll(".", "").replaceAll("-", "");

  if (RegExp(r'^(\d)\1{10}$').hasMatch(cpf)) return false;

  List<int> digitos = cpf.split('').map((d) => int.parse(d)).toList();
  int digito1 = validarDigitoCPF(digitos.sublist(0, 9));
  int digito2 = validarDigitoCPF(digitos.sublist(0, 9) + [digito1]);

  return digitos[9] == digito1 && digitos[10] == digito2;
}

int validarDigitoCPF(List<int> digitos) {
  int soma = 0;

  for (int i = 0; i < digitos.length; i++) {
    soma += digitos[i] * (digitos.length + 1 - i);
  }
  int resto = soma % 11;

  if (resto < 2) {
    return 0;
  } else {
    return 11 - resto;
  }
}
