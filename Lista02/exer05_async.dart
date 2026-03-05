import 'dart:async';

Future<String> buscarDadosLentos() async {
  print('Conectando ao servidor...');
  await Future.delayed(Duration(seconds: 5));
  return 'Dados confidenciais carregados com sucesso!';
}

void main() async {
  print('--- Iniciando Requisição ---');

  try {
    
    final resultado = await buscarDadosLentos().timeout(Duration(seconds: 3));
    
    
    print('✅ Sucesso: $resultado');
    
  } on TimeoutException {
    
    print('⏱️ Aviso: O servidor demorou muito para responder. Por favor, verifique sua conexão ou tente novamente mais tarde.');
    
  } catch (e) {
   
    print(' Ocorreu um erro inesperado: $e');
  }

  print('--- Fim do Processo ---');
}