import 'dart:async';

class Usuario {
  final String id;
  final String nome;
  final String? avatarUrl; 

  Usuario({required this.id, required this.nome, this.avatarUrl});
}

Future<Usuario> autenticar(String email, String senha) async {
  print(' Iniciando autenticação...');
  await Future.delayed(Duration(seconds: 2));
  
  if (email.isEmpty || senha.isEmpty) {
    throw Exception('Credenciais inválidas.');
  }
  
  return Usuario(id: '101', nome: 'Lucas', avatarUrl: null); 
}

Future<Map<String, dynamic>?> buscarPreferencias() async {
  await Future.delayed(Duration(seconds: 2));
  return {'tema': 'Escuro', 'notificacoes_ativas': true};
}

Future<double?> buscarSaldoCripto() async {
  await Future.delayed(Duration(seconds: 2));
  
  return null; 
}

Stream<String> conectarWebSocketNotificacoes() async* {
  final eventos = [
    'Sua fatura foi fechada.',
    'Novo acesso detectado em Joinville.',
    'Dica: Ative a autenticação em duas etapas.'
  ];
  
  for (var evento in eventos) {
    await Future.delayed(Duration(seconds: 2));
    yield evento;
  }
}

// --- INTEGRAÇÃO DO SISTEMA (main) ---
void main() async {
  print('=== INICIALIZANDO APLICATIVO ===\n');

  try {
    // PASSO 1: Autenticação
    final usuario = await autenticar('lucas@email.com', 'senha123');
    print('Bem-vindo(a), ${usuario.nome}!');
    
    // Null Safety em ação usando o operador ??
    print('   Avatar: ${usuario.avatarUrl ?? 'Avatar padrão carregado.'}\n');

    // PASSO 2: Carregamento do Painel Inicial em Paralelo
    print(' Sincronizando dados do painel...');
    final cronometro = Stopwatch()..start();
    
    final resultados = await Future.wait([
      buscarPreferencias(),
      buscarSaldoCripto(),
    ]);
    cronometro.stop();

    // Fazendo o cast seguro dos resultados
    final preferencias = resultados[0] as Map<String, dynamic>?;
    final saldo = resultados[1] as double?;

    print(' Painel sincronizado em ${cronometro.elapsed.inSeconds} segundos.');
    
    // Null Safety com o operador ?. para acesso seguro
    print('   Tema da UI: ${preferencias?['tema'] ?? 'Claro (Padrão)'}');
    print('   Saldo Atual: R\$ ${saldo?.toStringAsFixed(2) ?? 'Indisponível no momento'}\n');

    // PASSO 3: Escutar eventos em tempo real
    print('📡 Conectando servidor de notificações...\n');
    final inscricaoStream = conectarWebSocketNotificacoes().listen(
      (notificacao) => print('    Nova Notificação: $notificacao'),
      onError: (erro) => print('    Erro na conexão: $erro'),
      onDone: () => print('\n Servidor de notificações desconectado.'),
    );

    
    await Future.delayed(Duration(seconds: 7));
    await inscricaoStream.cancel();
    
    print('\n=== ✨ APLICATIVO CARREGADO COM SUCESSO ===');

  } catch (e) {
    
    print('\nFALHA CRÍTICA AO INICIAR O APP:');
    print('   Detalhes do erro: $e');
    print('   Ação recomendada: Redirecionando para a tela de Login...');
  }
}