class Senamon{
  String nombre;
  int nivel;
  String tipoSenamon; // 'Fuego', 'Agua', 'Hierva', 'Volador', 'Electrico'
  double peso;
  int puntos_salud;
  int nivelAtaque;
  String fase;
  int nivelEnergia;
  String descripcion;

  Senamon(this.nombre, this.nivel, this.tipoSenamon, this.peso, this.puntos_salud, this.nivelAtaque, this.fase, this.nivelEnergia, this.descripcion) {}

  void recibirAtaque(int ataque){
  puntos_salud = puntos_salud - ataque;
  }
}