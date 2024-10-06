import 'Senamon.dart';
import '../main.dart';

class Entrenador {
  String _nombre;
  String _email;
  String _fechaNacimiento;
  int _nivelExp;
  int _batallasGanadas;
  List<Senamon> senamonesCapturados = [];

  Entrenador(this._nombre, this._email, this._fechaNacimiento, this._nivelExp,
      this._batallasGanadas, this.senamonesCapturados) {}

  String getNombre() {
    return _nombre;
  }

  List<Senamon> getSenamones(){
    return senamonesCapturados;
  }

  int getNivelExp(){
    return _nivelExp;
  }

  void setNivelExp(int nuevoExp){
    _nivelExp += nuevoExp;
  }

  int getBatallasGanadas(){
    return _batallasGanadas;
  }

  void setBatallasGanadas(){
    _batallasGanadas++;
  }

  void mostrarInformacion() {
    print("Nombre: ${this._nombre}");
    print("Email: ${this._email}");
    print("Fecha de Nacimiento: ${this._fechaNacimiento}");
    print("Nivel de Experiencia: ${this._nivelExp}");
    print("Batallas Ganadas: ${this._batallasGanadas}");
    print("Senamones Elegidos");
    for (var i = 0; i < senamonesCapturados.length; i++) {
      print("- ${senamonesCapturados[i].getNombre()}");
    }
  }

  void entrenarSenamon() {
    if (_nivelExp >= 200) {
      print("Ingrese el senamon que desea entrenar");
      print("-" * 100);
      print("SENAMONES ELEGIDOS");
      for (var i = 0; i < senamonesCapturados.length; i++) {
        print("${i +1}. ${senamonesCapturados[i].getNombre()}");
      }
      int posicion = validarPosicion(senamonesCapturados);
      senamonesCapturados[posicion - 1].subirNivel();
      _nivelExp -= 20;
    } else {
      print("No se puede entrenar al senamon, necesitas almenos 200 puntos de experiencia.");
    }
  }

  void cambiarSenamon(List<Senamon> universo_senamon){
    print("SENAMONES ELEGIDOS");
    for (var i = 0; i < senamonesCapturados.length; i++) {
      print("${i + 1}. ${senamonesCapturados[i].getNombre()}");
    }
    int posicion;
    print("Ingrese el numero del senamon que desea cambiar");
    posicion = validarPosicion(senamonesCapturados);
    print("SENAMONES DISPONIBLES.");
    for (var i = 0; i < universo_senamon.length; i++) {
      print("${i + 1}. ${universo_senamon[i].getNombre()}");
    }
    print("Ingrese el numero del senamon que desea reemplazar por ${senamonesCapturados[posicion - 1].getNombre()}");
    int posicionReemplazo = validarPosicion(universo_senamon);
    universo_senamon.add(senamonesCapturados[posicion - 1]);
    senamonesCapturados.removeAt(posicion - 1);
    senamonesCapturados.add(universo_senamon[posicionReemplazo - 1]);
    universo_senamon.removeAt(posicionReemplazo - 1);
    print("Los senamones se han actualizado, estos son tus senamones:");
    for (var i = 0; i < senamonesCapturados.length; i++) {
      print("${i + 1}. ${senamonesCapturados[i].getNombre()}");
    }
  }
}
