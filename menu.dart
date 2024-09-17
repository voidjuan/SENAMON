import 'Entrenador.dart';
import 'dart:io';

import 'main.dart';

class Menu {
  int numeroEntrenador;
  Menu(this.numeroEntrenador);

  void elegirEntrenador(List<Entrenador> entrenadores) {
    print("Ingrese el numero del entrenador que esta jugando, ingrese 1 o 2");
    numeroEntrenador = validarPosicion(entrenadores);
  }
  void mostrarInfoEntrenador(List<Entrenador> entrenadores) {
    entrenadores[entrenadores].mostrarInformacion()
  }

}