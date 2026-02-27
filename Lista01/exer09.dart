void main() {

  Map<int, String> produtos = {
    101: 'Notebook',
    102: 'Mouse Sem Fio',
    103: 'Teclado Mecânico',
    104: 'Monitor 24 polegadas',
    105: 'Cadeira Ergonômica'
  };

 
  listarProdutos(produtos);

  
  print('\n--- Buscando Produtos ---');
  buscarProdutoPorId(produtos, 103); // Vai encontrar o Teclado
  buscarProdutoPorId(produtos, 999); // Não vai encontrar

  
  print('\n--- Removendo Produto ---');
  removerProdutoPorId(produtos, 102); // Vai remover o Mouse
  
  
  print('\n');
  listarProdutos(produtos);
}


void buscarProdutoPorId(Map<int, String> mapa, int id) {
  
  if (mapa.containsKey(id)) {
    print('Produto encontrado: ${mapa[id]}');
  } else {
    print('Erro: Produto com ID $id não encontrado.');
  }
}


void listarProdutos(Map<int, String> mapa) {
  print('--- Lista de Todos os Produtos ---');

  mapa.forEach((id, nome) {
    print('ID: $id | Nome: $nome');
  });
}

// (3) Função para remover um produto por ID
void removerProdutoPorId(Map<int, String> mapa, int id) {
  if (mapa.containsKey(id)) {
    // O método .remove() apaga o item do Map e ainda te devolve o valor que foi apagado
    String? produtoRemovido = mapa.remove(id);
    print('Sucesso! O produto "$produtoRemovido" (ID $id) foi removido.');
  } else {
    print('Erro ao remover: O ID $id não existe na lista.');
  }
}