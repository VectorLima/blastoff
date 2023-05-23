import 'dart:io';

class Funcionario {
  String nome;
  String cpf;
  double salario;

  Funcionario(this.nome, this.cpf, this.salario);

  double calcularBonificacao() {
    return 0;
  }

  void adicionarBonificacao(Funcionario funcionario) {
    double bonificacao = funcionario.calcularBonificacao();
    print('Bonificação adicionada: $bonificacao');
  }
}

class Engenheiro extends Funcionario {
  String _crea;
  String _categoria;
  String _projeto;

  Engenheiro(String nome, String cpf, double salario, this._crea,
      this._categoria, this._projeto)
      : super(nome, cpf, salario);
  String get crea => _crea;

  set crea(String value) {
    _crea = value;
  }

  String get categoria => _categoria;

  set categoria(String value) {
    _categoria = value;
  }

  String get projeto => _projeto;

  set projeto(String value) {
    _projeto = value;
  }

  @override
  double calcularBonificacao() {
    return salario * 0.05;
  }
}


class Gerente extends Funcionario {
  String _senhaEspecial;
  int _quantidadeFuncionarios;

  Gerente(String nome, String cpf, double salario, this._senhaEspecial,
      this._quantidadeFuncionarios)
      : super(nome, cpf, salario);

  String get senhaEspecial => _senhaEspecial;

  set senhaEspecial(String value) {
    _senhaEspecial = value;
  }

  int get quantidadeFuncionarios => _quantidadeFuncionarios;

  set quantidadeFuncionarios(int value) {
    _quantidadeFuncionarios = value;
  }

  @override
  double calcularBonificacao() {
    return salario * 0.1;
  }
}

void main() {
    String nome;
    String cpf;
    double salario;
    print('------------ Pagamento ------------');
    print('Insira o tipo de funcionário: \n (1) Funcionário \n (2) Gerente \n (3) Engenheiro');
        int funci = inserirTipoFuncionario();
        if (funci == 1) {
        print('Insira o nome do funcionário:');
        nome = inserirNome();
        print('Insira o CPF (xxx.xxx.xxx-xx):');
        cpf = inserirCPF();
        print('Insira o salário:');
        salario = inserirSalario();
        
        Funcionario funcionario = Funcionario(nome, cpf, salario);
        funcionario.adicionarBonificacao(funcionario);
    } else if (funci == 2) {
        print('Insira o nome do gerente:');
        nome = inserirNome();
        print('Insira o CPF (xxx.xxx.xxx-xx) :');
        cpf = inserirCPF();
        print('Insira o salário:');
        salario = inserirSalario();
        print('Insira a senha:');
        String senha = inserirSenha();

        print('Insira o número de funcionários:');
        int quantidadeFuncionario = inserirNumeroFuncionarios();
        
        Gerente gerente = Gerente(nome, cpf, salario, senha, quantidadeFuncionario);

        gerente.adicionarBonificacao(gerente);
    } else {
        print('Insira o nome do engenheiro:');
        nome = inserirNome();
        print('Insira o CPF (xxx.xxx.xxx-xx):');
        cpf = inserirCPF();
        print('Insira o salário:');
        salario = inserirSalario();
        print('Insira o número do CREA (XX.XXXXXX/D): ');
        String crea = inserirCREA();
        print('Insira a categoria do engenheiro:');
        String categoria = inserirCategoria();
        print('Insira o projeto atual do engenheiro:');
        String projeto = inserirProjeto();

        Engenheiro engenheiro = Engenheiro(nome, cpf, salario, crea, categoria, projeto);

        engenheiro.adicionarBonificacao(engenheiro);
    }
}

int inserirTipoFuncionario() {
  bool validar = false;
  int? opcao;
  while (!validar) {
    opcao = int.tryParse(stdin.readLineSync()!);
    if (opcao == 1) {
      validar = true;
      return 1;
    } else if (opcao == 2) {
      validar = true;
      return 2;
    } else if (opcao == 3) {
      validar = true;
      return 3;
    } else {
      print('Tipo inválido. \n (1) Funcionário \n (2) Gerente \n (3) Engenheiro');
    }
  }
  return 0;
}

double inserirSalario() {
  bool validar = false;
  double? saldo;
  while (!validar) {
    saldo = double.tryParse(stdin.readLineSync()!);
    if (saldo != null && saldo > 0) {
      validar = true;
    } else {
      print('Valor inválido. Tente novamente:');
    }
  }
  return saldo!;
}

bool nomeValido(String nome) {
  RegExp regex = RegExp(r'^[A-Za-z]+( [A-Za-z]+)*$');
  return regex.hasMatch(nome);
}

bool senhaValida(String senha) {
  RegExp regex = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$");
  return regex.hasMatch(senha);
}

String inserirSenha() {
  bool validar = false;
  String? senha;
  int x = 0;
  while (!validar) {
    stdin.echoMode = false;
    stdin.lineMode = true;
    senha = stdin.readLineSync()!;
    stdin.echoMode = true;
    if (senhaValida(senha)) {
      validar = true;
    } else if(x == 3){
        print('Senha inválida inserida várias vezes. Acesso negado');
        exit(1);
    }else {
      print('Senha inválida. Tente novamente:');
    }
    x++;
  }
  return senha!;
}

String inserirNome() {
  bool validar = false;
  String? nome;
  while (!validar) {
    nome = stdin.readLineSync()!;
    if (nomeValido(nome)) {
      validar = true;
    } else {
      print('Nome inválido. Tente novamente:');
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
      print('Número de CPF inválido. Tente novamente:');
    }
  }
  return cpf!;
}

String inserirCREA() {
  bool validars = false;
  String? crea;

  while (!validars) {
    crea = stdin.readLineSync();
    if (creaFormatoValido(crea!)) {
      validars = true;
    } else {
      print('Número de CREA inválido. Tente novamente:');
    }
  }

  return crea!;
}

bool creaFormatoValido(String crea) {
  final RegExp regexCreaSP = RegExp(r'^\d{2}\.\d{6}\/\d{1}$');
  return regexCreaSP.hasMatch(crea);
}

int inserirNumeroFuncionarios() {
  int? qtdFuncionario;
  bool validar = false;
  while (!validar) {
    qtdFuncionario = int.tryParse(stdin.readLineSync()!);
    if (qtdFuncionario != null && qtdFuncionario > 0) {
      validar = true;
    } else {
      print('Número de funcionários inválido. Tente novamente:');
    }
  }
  return qtdFuncionario!;
}

String inserirCategoria() {
  bool validars = false;
  String? categoria;
  while (!validars) {
    categoria = stdin.readLineSync();
    if (nomeValido(categoria!)) {
      validars = true;
    } else {
      print('Categoria inválida. Tente novamente:');
    }
  }
  return categoria!;
}

String inserirProjeto() {
  bool validars = false;
  String? projeto;
  while (!validars) {
    projeto = stdin.readLineSync();
    if (nomeValido(projeto!)) {
      validars = true;
    } else {
      print('Projeto inválido. Tente novamente:');
    }
  }
  return projeto!;
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


