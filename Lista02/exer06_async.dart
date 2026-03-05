Stream<int> contadorStream() async* {
  for (int i = 1; i <= 10; i++) {
   
    
    yield i;
  }
}

void main() {
  print('Iniciando o contador...');

  contadorStream().listen(
    (numero) {
      print('Número recebido: $numero');
    },
    onDone: () {
      
      print('Contagem finalizada!');
    },
    onError: (erro) {
      
      print('Ocorreu um erro: $erro');
    }
  );
  
  
  print('Aguardando os dados chegarem...');
}