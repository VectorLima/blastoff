import 'dart:io';

void main() {
  print('-------- Conversão de Data --------\n');
  String? dataExtenso = data();
  if (dataExtenso != null) {
    print(dataExtenso);
  } else {
    print('Data inválida!');
  }
}

String? data() {
  bool dataValida = false;
  while (!dataValida) {
    stdout.write('Digite a data no formato DD/MM/AAAA: ');
    String? data = stdin.readLineSync();
    if (data != null && validarData(data)) {
      dataValida = true;
      String? dataExtenso = dataPorExtenso(data);
      if (dataExtenso != null) {
        return dataExtenso;
      } else {
        return null;
      }
    } else {
      print('Data inválida!');
    }
  }
}

bool validarData(String data) {
  RegExp validar = RegExp(r'^\d{2}/\d{2}/\d{4}$');
  return validar.hasMatch(data);
}

String? dataPorExtenso(String data) {
  final List<String> valores = data.split('/');
  if (valores.length != 3) {
    return null;
  }

  final int? dia = int.tryParse(valores[0]);
  final int? mes = int.tryParse(valores[1]);
  final int? ano = int.tryParse(valores[2]);

  if (dia == null || mes == null || ano == null) {
    return null;
  }

  if (dia < 1 || dia > 31 || mes < 1 || mes > 12 || ano < 1) {
    return null;
  }

  final List<String> meses = [
    '',
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
  ];

  return 'Data por extenso: $dia de ${meses[mes]} de $ano';
}