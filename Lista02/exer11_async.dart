import 'dart:async';

Map<String, String> cache = {
  'tema': 'escuro',
  
};

Future<String?> buscarDaAPI(String chave) async {
  print(' Buscando "$chave" no servidor (API)...');
  await Future.delayed(Duration(seconds: 2));
  
  if (chave == 'idioma') {
    return 'pt-BR';
  }
  
  return null; 
}

Future<String?> buscarConfiguracao(String chave) async {
  print('🔍 Solicitando configuração: $chave');
  
  
  String? resultado = cache[chave] ?? await buscarDaAPI(chave);
  
  if (resultado != null && !cache.containsKey(chave)) {
    cache[chave] = resultado;
    print(' "$chave" foi salvo no cache local!');
  }
  
  return resultado;
}

void main() async {
  print('--- Teste 1: Valor já existe no Cache ---');
  String? tema = await buscarConfiguracao('tema');
  
 
  print('Tema atual: ${tema?.toUpperCase()}\n');

  print('--- Teste 2: Valor não está no Cache, mas está na API ---');
  String? idioma = await buscarConfiguracao('idioma');
  print('Idioma configurado: $idioma\n');

  print('--- Teste 3: Valor não existe em lugar nenhum ---');
  String? fonte = await buscarConfiguracao('fonte');
  
  
  print('Fonte carregada: ${fonte ?? 'Roboto (Padrão do Sistema)'}\n');

  print('--- Teste 4: O perigo do operador ! (Bang) ---');
  
  String idiomaGarantido = cache['idioma']!;
  print('Tamanho da string do idioma: ${idiomaGarantido.length} caracteres.');
}