import 'dart:io';
import 'Entrenador.dart';
import 'Juego.dart';
import 'Senamon.dart';
int opcion=0;
void main(List<String> args) {
  // Entrenadores SENAMON
  Entrenador Jugador1 = Entrenador("Dash", "dash12@email.com", DateTime(2005,06,03), 2000, 0);
  Entrenador Jugador2 = Entrenador("Ashley", "ashley-02@email.com", DateTime(2002,10,30), 2000, 0);
  /*****************************************/
  Senamon pikachu = Senamon("pikachu", 5, "Electrico", 6.0, 100, 24, "adulto", 40, "Senamon electrico");
  Juego juego = Juego();
  juego.agregarEntrenador(Jugador1);
  juego.agregarEntrenador(Jugador2);
  print("BIENVENIDO A SENAMON");
  print("********************");
  do{
  print("¿Que deseas Hacer?");
  print("1. Saber sobre los entrenadores Senamon");
  print("2. Saber sobre los Senamones");
  print("3. Hacer una batalla");
  print("3. Salir del programa");
  opcion = int.parse(stdin.readLineSync()!);
  print("********************");

  switch(opcion) {
    case 1:
    print("Estos son los Entrenadores Actuales");
    Jugador1.mostrarInformacion();
    print("******************");
    Jugador2.mostrarInformacion();
    print("******************");
  }
  } while (opcion != 3);
}
