void main() {
  
  saudar(nome: 'Carlos');
  
  saudar(nome: 'Maria', titulo: 'Dra.');

  saudar(nome: 'José', mostrarHora: true);

  saudar(nome: 'Ana', titulo: 'Sra.', mostrarHora: true);
}

void saudar({
  required String nome,
  String titulo = 'Sr.',
  bool mostrarHora = false,
}) {

  String mensagem = 'Olá, $titulo $nome!';
  if (mostrarHora) {
    DateTime agora = DateTime.now();
    String horaFormatada = '${agora.hour}:${agora.minute.toString().padLeft(2, '0')}';
    
    mensagem += ' Agora são $horaFormatada.';
  }

  print(mensagem);
}