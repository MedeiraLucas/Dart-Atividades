void main() {
  // Criando os dois Sets de números inteiros
  Set<int> a = {1, 2, 3, 4, 5};
  Set<int> b = {4, 5, 6, 7, 8};

  
  print('União: ${a.union(b)}');
  print('Interseção: ${a.intersection(b)}');
  print('Diferença (A - B): ${a.difference(b)}');
  bool temOtres = a.contains(3);
  print('O número 3 está no conjunto A? $temOtres');
}