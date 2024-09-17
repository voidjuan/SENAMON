import 'Senamon.dart';

class Entrenador {
  String _nombre;
  String _email;
  String _fechaNacimiento;
  int _nivelExp;
  int _batallasGanadas;
  List<Senamon> senamonesCapturados = [];

  Entrenador(this._nombre, this._email, this._fechaNacimiento, this._nivelExp,
      this._batallasGanadas) {}

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

  String getNombre() {
    return _nombre;
  }

  void atraparSenamon(Senamon senamon) {
    if (senamonesCapturados.length < 5) {
      senamonesCapturados.add(senamon);
    } else {
      print('Ya tienes 5 senamones, si deseas, puedes reemplazarlos.');
    }
  }

  void reemplazarSenamon(int posicion, Senamon nuevoSenamon) {
    if (posicion >= 0 && posicion < senamonesCapturados.length) {
      senamonesCapturados[posicion] = nuevoSenamon;
    } else {
      print('La posicion que ha ingresado es invalida');
    }
  }

  void entrenarSenamon(List<Senamon> senamones) {
    if (_nivelExp >= 200) {
      print("Ingrese el senamon que desea entrenar");
      print("*" * 100);
      print("SENAMONES ELEGIDOS");
      for (var i = 0; i < senamonesCapturados.length; i++) {
        
      }
    }
  }
}
