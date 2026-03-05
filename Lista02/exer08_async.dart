// 1. Criamos a função geradora do Stream que emite números de 1 a 20
Stream<int> numerosStream() async* {
  for (int i = 1; i <= 20; i++) {
    // Adicionei um pequeno delay de meio segundo para podermos visualizar o fluxo acontecendo
    await Future.delayed(Duration(milliseconds: 500));
    yield i;
  }
}

void main() {
  print('--- Iniciando Transformação de Stream ---\n');

  
  numerosStream()
      .where((n) {
        
        return n % 2 == 0;
      })
      .map((n) {
        
        return n * 2;
      })
      .take(5) 
      .listen(
        (resultado) {
          print('Resultado final emitido: $resultado');
        },
        onDone: () {
        
          print('\n✅ Operação finalizada pelo limitador .take()!');
        },
      );
}