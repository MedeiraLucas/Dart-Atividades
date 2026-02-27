class ContaBancaria {
  String titular;
  double saldo;

  ContaBancaria(this.titular, this.saldo);

  void depositar(double valor) {
    saldo += valor;
    print('[$titular] Depósito de R\$ $valor. Novo saldo: R\$ $saldo');
  }

  void sacar(double valor) {
    if (valor <= saldo) {
      saldo -= valor;
      print('[$titular] Saque de R\$ $valor. Novo saldo: R\$ $saldo');
    } else {
      print('[$titular] Erro: Saldo insuficiente para sacar R\$ $valor!');
    }
  }
}

class ContaPoupanca extends ContaBancaria {
  
  ContaPoupanca(String titular, double saldo) : super(titular, saldo);

  void aplicarRendimento(double taxa) {
    saldo += saldo * taxa;
    print('[$titular] Rendimento de ${taxa * 100}% aplicado! Novo saldo: R\$ $saldo');
  }
}

void main() {
  print('--- Testando a Conta Poupança ---');

  
  ContaPoupanca minhaConta = ContaPoupanca('Ana', 1000.00);

  
  minhaConta.depositar(500.00); 
  minhaConta.sacar(200.00);     
  minhaConta.sacar(5000.00);    

  minhaConta.aplicarRendimento(0.05); 
}