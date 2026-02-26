// Exercício 3 - Lucas Medeira
// Matéria: ADS / Dart

void main() {

  String valorTexto = '42';
  
  
  print('Valor: $valorTexto | antes: ${valorTexto.runtimeType}');

  
  int valorInt = int.parse(valorTexto);
  print('Valor: $valorInt | depois (int): ${valorInt.runtimeType}');

  double valorDouble = double.parse(valorTexto);
  print('Valor: $valorDouble |  depois (double): ${valorDouble.runtimeType}');

  print('--------------------------------------');

  
  int numeroOriginal = 100;
  
  print('Valor: $numeroOriginal |  antes: ${numeroOriginal.runtimeType}');

  String numeroString = numeroOriginal.toString();
  print('Valor: "$numeroString" |  depois (String): ${numeroString.runtimeType}');
}