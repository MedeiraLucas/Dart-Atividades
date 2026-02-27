void main() {
  List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  
  numeros.add(11);

  
  numeros.remove(5);

  
  print('Tamanho da lista: ${numeros.length}');
  print('Primeiro elemento: ${numeros.first}');
  print('Último elemento: ${numeros.last}');

  print('\nImprimindo todos os elementos com forEach:');
  
  numeros.forEach((numero) {
    print(numero);
  });
}