void main() {

  double somar(double a, double b) => a + b;
  double subtrair(double a, double b) => a - b;
  double multiplicar(double a, double b) => a * b;
  double dividir(double a, double b) => a / b;

  
  print('Soma: ${executarOperacao(10, 5, somar)}');
  print('Subtração: ${executarOperacao(10, 5, subtrair)}');
  print('Multiplicação: ${executarOperacao(10, 5, multiplicar)}');
  print('Divisão: ${executarOperacao(10, 5, dividir)}');

  print('Resto da divisão: ${executarOperacao(10, 3, (a, b) => a % b)}');
}

double executarOperacao(double a, double b, Function operacao) {
  return operacao(a, b);
}