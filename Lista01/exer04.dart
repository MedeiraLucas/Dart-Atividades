void main() {
  
  print(calcularArea(5, 10));
  print(calcularAreaArrow(5, 10));
}

double calcularArea(double largura, double altura) {
  return largura * altura;
}

double calcularAreaArrow(double largura, double altura) => largura * altura;