Future<String> buscarUsuario() {
  
  return Future.delayed(Duration(seconds: 2), () => 'Lucas Medeira');
}

void main() {
  print('Iniciando a busca...');
  
  buscarUsuario().then((resultado) {
    print(resultado);
  });
}