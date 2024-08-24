import 'Senamon.dart';

class Entrenador {
  String nombre;
  String email;
  DateTime fechaNacimiento;
  int nivelExp;
  int batallasGanadas;
  List<Senamon> senamonesCapturados = [];

  Entrenador(this.nombre, this.email, this.fechaNacimiento, this.nivelExp, this.batallasGanadas){}

  void mostrarInformacion(){
    print("Nombre: ${this.nombre}");
    print("Email: ${this.email}");
    print("Fecha de Nacimiento: ${this.fechaNacimiento}");
    print("Nivel de Experiencia: ${this.nivelExp}");
    print("Batallas Ganadas: ${this.batallasGanadas}");
  }

  void atraparSenamon(Senamon senamon) {
    if(senamonesCapturados.length < 5){
      senamonesCapturados.add(senamon);
    } else {
      print('Ya tienes 5 senamones, si deseas, puedes reemplazarlos.');
    }
  }

  void reemplazarSenamon(int posicion, Senamon nuevoSenamon) {
    if(posicion >= 0 && posicion < senamonesCapturados.length) {
      senamonesCapturados[posicion] = nuevoSenamon;
    } else {
      print('La posicion que ha ingresado es invalida');
    }
  }

  void entrenarSenamon(Senamon senamon, {int puntosAtaque = 0, int puntosSalud = 0}) {
    int puntosRequeridos  = (puntosAtaque + puntosSalud) * 10;
    if(nivelExp >= puntosRequeridos) {
      senamon.nivelAtaque = senamon.nivelAtaque + puntosAtaque;
      senamon.puntos_salud = senamon.puntos_salud + puntosSalud;
      nivelExp = nivelExp - puntosRequeridos;
    } else {
      print('No tienes el nivel de experiencia necesario.');
    }
  }
}