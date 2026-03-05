import 'dart:async';

void main() async {
  print('--- Iniciando Chat Simulado ---\n');

  final chatController = StreamController<String>();

  chatController.stream.listen(
    (mensagem) {
      print(' $mensagem');
    },
    onDone: () {
      print('\n O chat foi encerrado pelo servidor.');
    },
  );

 
  final mensagens = [
    'Oi, tudo bem?',
    'Tudo certo! Estudando Dart hoje?',
    'Sim, focado em programação para dispositivos móveis!',
    'Excelente, Lucas! Flutter é um ótimo caminho.',
    'Com certeza! Vou continuar os testes aqui, até mais!'
  ];

  
  for (var mensagem in mensagens) {
    await Future.delayed(Duration(seconds: 1));
 
    chatController.add(mensagem); 
  }

  
  await chatController.close();
}