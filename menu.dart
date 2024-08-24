import 'dart:io';
import 'Entrenador.dart';
import 'Senamon.dart';
int opcion=0;
void main(List<String> args) {
  List<Senamon> Senamon_Global = [];
  List<Entrenador> jugadores = [];
  Entrenador Jugador1 = Entrenador("Dash", "dash12@email.com", DateTime.utc(2005-06-03), 2000, 0);
  jugadores.add(Jugador1);
  Entrenador Jugador2 = Entrenador("Ashley", "ashley-02@email.com", DateTime.utc(2002-10-30), 2000, 0);
  jugadores.add(Jugador2);
  print("BIENVENIDO A SENAMON");
  print("********************");
  do{
  print("¿Que deseas Hacer?");
  print("1. Saber sobre los entrenadores Senamon");
  print("2. Saber sobre los Senamones");
  print("3. Salir del programa");
  opcion = int.parse(stdin.readLineSync()!);
  } while (opcion != 3);
}