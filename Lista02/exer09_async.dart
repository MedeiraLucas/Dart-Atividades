import 'dart:async';

void main() async {
  print('--- Iniciando Stream de Broadcast ---\n');

  
  final controller = StreamController<int>.broadcast();

  int quantidadeRecebida = 0;
  int somaTotal = 0;

  
  controller.stream.listen((numero) {
    print(' Listener 1 (Imprime): Recebeu o número $numero');
  });

  
  controller.stream.listen((numero) {
    quantidadeRecebida++;
    print('📊 Listener 2 (Conta): $quantidadeRecebida número(s) recebido(s) até agora');
  });

  
  controller.stream.listen((numero) {
    somaTotal += numero;
    print('Listener 3 (Soma): A soma total atual é $somaTotal\n');
  });

  print('Emitindo dados...\n');
  for (int i = 1; i <= 10; i++) {
    
    await Future.delayed(Duration(milliseconds: 500));
    controller.add(i);
  }

  
  await controller.close();
  print('--- Stream Encerrado ---');
}