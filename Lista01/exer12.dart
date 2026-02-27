class Produto {
  String nome;
  double preco;
  int estoque;

  
  Produto(this.nome, this.preco, this.estoque);

  
  Produto.semEstoque(this.nome, this.preco) : estoque = 0;

  
  Produto.promocao(this.nome, double precoOriginal, this.estoque) 
      : preco = precoOriginal * 0.8;

  void exibirInfo() {
    print('Produto: $nome | R\$ $preco | Estoque: $estoque');
  }
}

void main() {
  print('--- Testando os Construtores ---');

  
  Produto produtoNormal = Produto('Mesa de Escritório', 500.00, 10);
  produtoNormal.exibirInfo();

  
  Produto produtoEsgotado = Produto.semEstoque('Webcam HD', 250.00);
  produtoEsgotado.exibirInfo();

  
  Produto produtoDesconto = Produto.promocao('Cadeira Gamer', 1000.00, 5);
  produtoDesconto.exibirInfo();
}