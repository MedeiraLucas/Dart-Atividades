import 'dart:math';

Future<String> buscarUsuario() async {
  
  await Future.delayed(Duration(seconds: 2));
  
  bool simularErro = Random().nextBool();
  
  if (simularErro) {
    // Lança a exceção conforme a dica do exercício
    throw Exception('Falha de conexão com a API.');
  }

  return 'Lucas Medeira';
}

void main() async {
  print('Iniciando a busca...');

  try {
    
    String resultado = await buscarUsuario();
    print('Usuário encontrado: $resultado');
    
  } catch (e) {
    
    print('Erro capturado: $e');
  }
  
  print('Fim da execução.');
}