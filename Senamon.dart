import 'dart:io';

class Senamon{
  String _nombre;
  int _nivel;
  String _tipoSenamon; // 'Fuego', 'Agua', 'Hierva', 'Volador', 'Electrico'
  int _salud;
  int _ataque;
  String _descripcion;

  Senamon(this._nombre, this._nivel, this._tipoSenamon, this._salud, this._ataque, this._descripcion) {}

  void recibirAtaque(int ataque){
  _salud = _salud - ataque;
  }

  String getNombre(){
    return _nombre;
  }

  void subirNivel(){
    int puntos = 20;
    print("Puntos Disponibles: $puntos");
    print("Ingrese el numero de puntos que desea agregar a la salud de $_nombre");
    puntos -= validarRango(puntos, 0);
    _salud += salud;
    puntos -= salud;
    print("Ingrese el numero de puntos que desea agregar al ataque de $_nombre");
    _ataque += ataque;
    puntos -= ataque;
    print("El senamon: $_nombre ha quedado con un ataque de: $_ataque y con una salud de $_salud");
  }
}

int validarRango(int max, int min){
  int numero;
  do {
    numero =int.parse(stdin.readLineSync()!);
    if (numero < min || numero > max) {
      print("Ingrese un numero entre el rango [$min, $max]");
      numero = int.parse(stdin.readLineSync()!);
    }
  } while (numero < min || numero > max);
  return numero;
}