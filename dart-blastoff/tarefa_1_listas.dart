import 'dart:io';

void main() {
  List<double> temperatures = [];
  bool validate = false;
  bool overAverage = false;

  print('\n------ Calcular Temperatura Média ------\n');

  while(!validate){
    for (int i = 1; i <= 12;) {
     try{
      stdout.write('Digite a temperatura média do mês de ${getMonthName(i)}: ');
      double? temperature = double.parse(stdin.readLineSync()!);
      if(temperature == null){
        return;
      }
      else if(!(temperature is double)){
        return;
      } else if(temperature > 100){
        return;
      }
      else{
        temperatures.add(temperature);
        validate = true;
        i++;
      }
     } on Exception catch (e) {
        print('Valor inserido foi inválido. Digite novamente.\n');
    }
    }
  }

  double annualAverage = temperatures.reduce((a, b) => a + b) / 12;

  for (int i = 0; i < temperatures.length; i++) {
    if (temperatures[i] > annualAverage) {
        overAverage = true;
    }
  }

  if(overAverage == true){
    print('Esses foram os meses com temperatua acima da média:\n');
    for(int i = 0; i < temperatures.length; i++){
      String monthName = getMonthName(i + 1);
      print('Temperatura acima da média anual em $monthName: ${temperatures[i]}°C');
    }
  } else{
    print('\n------ Este ano as temperaturas se manteram estáveis ------\n');
  }
}

// Retorna o nome do mês correspondente ao número informado
String getMonthName(int monthNumber) {
  switch (monthNumber) {
    case 1:
      return 'Janeiro';
    case 2:
      return 'Fevereiro';
    case 3:
      return 'Março';
    case 4:
      return 'Abril';
    case 5:
      return 'Maio';
    case 6:
      return 'Junho';
    case 7:
      return 'Julho';
    case 8:
      return 'Agosto';
    case 9:
      return 'Setembro';
    case 10:
      return 'Outubro';
    case 11:
      return 'Novembro';
    case 12:
      return 'Dezembro';
    default:
      throw Exception('Mês inválido');
  }
}