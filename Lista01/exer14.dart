abstract class Veiculo {
  
  void acelerar();
}


class Carro implements Veiculo {

  @override
  void acelerar() {
    print('🚗 Carro acelerando: Vrum vrum!');
  }
}


class Moto implements Veiculo {
  @override
  void acelerar() {
    print('🏍️ Moto acelerando: Rén rén rén!');
  }
}

void main() {
  
  List<Veiculo> frota = [
    Carro(),
    Moto(),
  ];

  print('--- Testando a Frota ---');

  
  for (var veiculo in frota) {
    veiculo.acelerar();
  }
}