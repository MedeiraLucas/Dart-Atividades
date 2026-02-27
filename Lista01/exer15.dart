mixin Voador {
  void voar() => print('🦅 Voando alto pelo céu!');
}

mixin Nadador {
  void nadar() => print('🌊 Nadando nas águas!');
}

mixin Corredor {
  void correr() => print('💨 Correndo muito rápido!');
}

class Pato with Nadador, Voador {
  String nome;
  Pato(this.nome);
}

// O Golfinho ganha apenas a habilidade de Nadar
class Golfinho with Nadador {
  String nome;
  Golfinho(this.nome);
}

// O Avestruz ganha apenas a habilidade de Correr
class Avestruz with Corredor {
  String nome;
  Avestruz(this.nome);
}

void main() {
  
  Pato donald = Pato('Donald');
  Golfinho flipper = Golfinho('Flipper');
  Avestruz papaLeguas = Avestruz('Papa-Léguas');

 
  print('--- Ações do Pato (${donald.nome}) ---');
  donald.nadar();
  donald.voar();
  

  print('\n--- Ações do Golfinho (${flipper.nome}) ---');
  flipper.nadar();

  print('\n--- Ações do Avestruz (${papaLeguas.nome}) ---');
  papaLeguas.correr();
}