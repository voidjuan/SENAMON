import 'dart:io';

class Senamon{
  String _nombre;
  int _nivel;
  String _tipoSenamon; // 'Fuego', 'Agua', 'Hierva', 'Volador', 'Electricidad'
  int _salud;
  int _ataque;
  String _descripcion;

  Senamon(this._nombre, this._nivel, this._tipoSenamon, this._salud, this._ataque, this._descripcion) {}

  String getNombre(){
    return _nombre;
  }

  int getSalud(){
    return _salud;
  }

  int getAtaque(){
    return _ataque;
  }

  String getTipoSenamon(){
    return _tipoSenamon;
  }

  void setSalud(int nuevaSalud){
    _salud = nuevaSalud;
  }

  void mostrarInformacion(){
    print("""
    Nombre: $_nombre
    Nivel: $_nivel
    Tipo de Senamon: $_tipoSenamon
    Salud: $_salud
    Ataque: $_ataque
    Descripcion: $_descripcion
    """);
  }

  void subirNivel(){
    int puntos = 20;
    print("Puntos Disponibles: $puntos");
    print("Ingrese el numero de puntos que desea agregar a la salud de $_nombre");
    int salud = validarRango(puntos, 0);
    _salud += salud;
    puntos -= salud;
    print("Ingrese el numero de puntos que desea agregar al ataque de $_nombre");
    int ataque = validarRango(puntos, 0);
    _ataque += ataque;
    puntos -= ataque;
    print("El senamon: $_nombre ha quedado con un ataque de: $_ataque y con una salud de $_salud");
  }

  void atacar(Senamon senamonEnemigo){
    senamonEnemigo.setSalud(senamonEnemigo.getSalud() - _ataque);
    if (senamonEnemigo.getSalud() <= 0){
      senamonEnemigo.setSalud(0);
      print("El senamon ${senamonEnemigo.getNombre()} ha muerto");
    }
    print("El senamon enemigo ${senamonEnemigo.getNombre()} ha quedado con una vida de: ${senamonEnemigo.getSalud()}");
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