
class Produto {
  String nome;
  double preco;
  int estoque;

  
  Produto(this.nome, this.preco, this.estoque);

  
  void exibirInfo() {
    print('Produto: $nome | R\$ $preco | Estoque: $estoque');
  }
}

void main() {
  
  Produto produto1 = Produto('Notebook', 3500.00, 10);
  Produto produto2 = Produto('Mouse Sem Fio', 150.50, 50);
  Produto produto3 = Produto('Teclado Mecânico', 320.00, 25);

  print('--- Lista de Produtos ---');
  
  
  produto1.exibirInfo();
  produto2.exibirInfo();
  produto3.exibirInfo();
}