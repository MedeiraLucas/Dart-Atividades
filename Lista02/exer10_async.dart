import 'dart:async';
import 'dart:math';


Stream<String> geradorDeEventos() async* {
  final tipos = ['clique', 'scroll', 'input'];
  final random = Random();

  print('📱 Iniciando simulação...\n');

  
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    String evento = '${tipos[random.nextInt(tipos.length)]} (ID: $i)';
    print('👆 Disparado: $evento');
    yield evento;
  }

  
  await Future.delayed(Duration(milliseconds: 1500));

  String eventoFinal = 'clique (ID: 6)';
  print('👆 Disparado: $eventoFinal');
  yield eventoFinal;
}

void main() {
  
  Timer? debounceTimer;

  geradorDeEventos().listen(
    (evento) {
    
      debounceTimer?.cancel();

      debounceTimer = Timer(Duration(seconds: 1), () {
        print('  🎯 PROCESSADO pelo app: $evento\n');
      });
    },
    onDone: () {
      
      Future.delayed(Duration(seconds: 2), () {
        print('Fim da execução.');
      });
    }
  );
}