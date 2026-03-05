
Future<String> autenticar() async {
  print('Autenticando usuário...');
  await Future.delayed(Duration(seconds: 2)); // Simula o tempo de login
  return 'token_secreto_123';
}
Future<Map<String, dynamic>> buscarPerfil(String token) async {
  print('Buscando perfil com o token fornecido...');
  await Future.delayed(Duration(seconds: 2)); 
  
  if (token == 'token_secreto_123') {
    return {
      'id': 101, 
      'nome': 'Lucas Medeira', 
      'email': 'lucas@email.com'
    };
  } else {
    throw Exception('Token inválido ou expirado.');
  }
}

Future<List<String>> buscarPedidos(int userId) async {
  print('Buscando pedidos para o usuário ID: $userId...');
  await Future.delayed(Duration(seconds: 2)); // Simula a busca no banco de dados
  
  if (userId == 101) {
    return ['Pedido #001 (Smartphone)', 'Pedido #002 (Fone Bluetooth)'];
  } else {
    return []; 
  }
}

void main() async {
  print('--- Iniciando Fluxo do Aplicativo ---\n');

  try {
    
    final token = await autenticar();
    print('Sucesso: Token obtido ($token)\n');

    
    final perfil = await buscarPerfil(token);
    print(' Sucesso: Perfil carregado -> Bem-vindo(a), ${perfil['nome']}\n');

    
    final pedidos = await buscarPedidos(perfil['id'] as int);
    print(' Sucesso: Pedidos encontrados:');
    for (var pedido in pedidos) {
      print('  - $pedido');
    }

  } catch (e) {
   
    print(' Erro na operação: $e');
  }
  
  print('\n--- Fim do Fluxo ---');
}