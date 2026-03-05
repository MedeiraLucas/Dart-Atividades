Future<List<String>> buscarProdutos() async {
  await Future.delayed(Duration(seconds: 2));
  return ['Smartphone', 'Notebook'];
}

Future<List<String>> buscarCategorias() async {
  await Future.delayed(Duration(seconds: 2));
  return ['Eletrônicos', 'Informática'];
}

Future<List<String>> buscarPromocoes() async {
  await Future.delayed(Duration(seconds: 2));
  return ['10% OFF em Smartphones'];
}

Future<List<String>> buscarDestaques() async {
  await Future.delayed(Duration(seconds: 2));
  return ['Lançamento do Ano'];
}

void main() async {
  print('--- Iniciando Teste de Performance ---\n');

  print('Iniciando carregamento SEQUENCIAL...');
  final cronometroSequencial = Stopwatch()..start();
  
  await buscarProdutos();
  await buscarCategorias();
  await buscarPromocoes();
  await buscarDestaques();
  
  cronometroSequencial.stop();
  print('Tempo Sequencial: ${cronometroSequencial.elapsed.inSeconds} segundos\n');

  print('Iniciando carregamento PARALELO (Future.wait)...');
  final cronometroParalelo = Stopwatch()..start();
  
  
  final resultados = await Future.wait([
    buscarProdutos(),
    buscarCategorias(),
    buscarPromocoes(),
    buscarDestaques(),
  ]);
  
  cronometroParalelo.stop();
  
 
  final produtos = resultados[0];
  final categorias = resultados[1];
  
  print(' Tempo Paralelo: ${cronometroParalelo.elapsed.inSeconds} segundos');
  print(' Dados carregados com sucesso. Exemplo: $produtos, $categorias\n');
  
  print('--- Conclusão ---');
  print('Na execução sequencial, o tempo é a SOMA de todos os atrasos (2+2+2+2 = 8s).');
  print('No Future.wait, o tempo é igual ao do processo MAIS DEMORADO (2s).');
}