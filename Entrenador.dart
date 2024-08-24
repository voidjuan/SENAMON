import 'Senamon.dart';

class Entrenador {
  String nombre;
  String email;
  DateTime fechaNacimiento;
  int nivelExp;
  int batallasGanadas;
  List<Senamon> senamonesCapturados = [];

  Entrenador(this.nombre, this.email, this.fechaNacimiento, this.nivelExp, this.batallasGanadas){}

  
}