void main() {
  
  List<String> frutas = ['maçã', 'banana', 'manga', 'uva', 'morango', 'melancia'];

  
  List<String> frutasComM = frutas.where((fruta) => fruta.startsWith('m')).toList();
  
  print('Frutas que começam com a letra M:');
  print(frutasComM);
  
  print('\n-------------------\n'); 

  List<String> frutasMaiusculas = frutas.map((fruta) => fruta.toUpperCase()).toList();
  
  print('Lista com todas as frutas em MAIÚSCULAS:');
  print(frutasMaiusculas);
}