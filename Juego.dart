import 'dart:math';
import 'Entrenador.dart';
import 'Senamon.dart';

class Juego {
  List<Entrenador> entrenadores = [];
  List<Senamon> senamones_Global = [];

  void agregarEntrenador(Entrenador entrenador) {
    if(entrenadores.length < 2){
      entrenadores.add(entrenador);
    } else {
      print('Ya hay 2 entrenadores en este juego');
    }
  }

  void agregarSenamonesGlobal(Senamon senamon) {
    senamones_Global.add(senamon);
  }

  void capturarSenamon(Entrenador entrenador, Senamon senamon) {
    if(entrenador.senamonesCapturados.length < 5){
      entrenador.atraparSenamon(senamon);
      senamones_Global.remove(senamon);
      print('El entrenador ${entrenador.nombre} acaba de capturar a el senamon ${senamon.nombre}');
    } else {
      print('El entrenador ${entrenador.nombre} ya tiene 5 senamones, y no puede capturar mas!');
    }
  }

  void lanzarMoneda() {
    var random = Random();
    int resultado = random.nextInt(2);
    print('El entrenador ${resultado + 1} comenzará la batalla');
  }

  void iniciarBatalla(Entrenador entrenador1, Entrenador entrenador2) {
    while (true) {
      for (int i = 0; i < entrenador1.senamonesCapturados.length; i++) {
        if (entrenador1.senamonesCapturados[i].puntos_salud > 0 && entrenador2.senamonesCapturados[i].puntos_salud > 0) {
          entrenador2.senamonesCapturados[i].recibirAtaque(entrenador1.senamonesCapturados[i].nivelAtaque);
          entrenador1.senamonesCapturados[i].recibirAtaque(entrenador2.senamonesCapturados[i].nivelAtaque);
        }
      }
      if (entrenador1.senamonesCapturados.every((s) => s.puntos_salud <= 0) ||
          entrenador2.senamonesCapturados.every((s) => s.puntos_salud <= 0)) {
        break;
      }
    }
  }

  void mostrarGanador(Entrenador entrenador1, Entrenador entrenador2) {
    int senamonesDerrotados1 = entrenador1.senamonesCapturados.where((s) => s.puntos_salud <= 0).length;
    int senamonesDerrotados2 = entrenador2.senamonesCapturados.where((s) => s.puntos_salud <= 0).length;

    if (senamonesDerrotados1 > senamonesDerrotados2) {
      entrenador1.batallasGanadas++;
      print("${entrenador1.nombre} ha ganado la batalla.");
    } else if (senamonesDerrotados2 > senamonesDerrotados1) {
      entrenador2.batallasGanadas++;
      print("${entrenador2.nombre} ha ganado la batalla.");
    } else {
      print("La batalla terminó en empate.");
    }
  }
}