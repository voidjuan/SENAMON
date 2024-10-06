import 'Entrenador.dart';
import 'dart:io';
import 'Senamon.dart';
import 'Juego.dart';

class Menu {
  int numeroEntrenador;
  Menu(this.numeroEntrenador);

  void elegirEntrenador(List<Entrenador> entrenadores) {
    print("Ingrese el numero del entrenador que esta jugando, ingrese 1 o 2");
    numeroEntrenador = validarPosicion(entrenadores) - 1;
  }

  void mostrarInfoEntrenador(List<Entrenador> entrenadores) {
    entrenadores[numeroEntrenador].mostrarInformacion();
  }

  void entrenarSenamon(List<Entrenador> entrenadores){
    entrenadores[numeroEntrenador].entrenarSenamon();
  }

  void crearSenamon(List<Entrenador> entrenadores, List<Senamon> universo_senamon){
    print("-" * 100);
    print("CREACION DE SENAMON");
    print("Ingrese el nombre del nuevo senamon");
    String nombre = stdin.readLineSync()!;
    print("-" * 100);
    List<String> tiposSenamon = ["Fuego", "Agua", "Hierva", "Volador", "Eléctrico"];
    for (var i = 0; i < tiposSenamon.length; i++) {
      print("${i + 1}. ${tiposSenamon[i]}");
    }
    print("Ingrese el numero de tipo que desea para este senamon");
    int tipoPosicion = validarPosicion(tiposSenamon);
    print("-" * 100);
    int puntosGenerales = 250;
    print("Los puntos que tienes en este momento son: $puntosGenerales");
    print("Ingresa el numero de puntos que deseas agregar a la salud del senamon $nombre");
    int salud = validarRango(puntosGenerales, 1);
    puntosGenerales -= salud;
    print("-" * 100);
    print("Puntos disponibles: $puntosGenerales");
    print("Bien, ahora ingresa los puntos que deseas agregar al ataque del senamon $nombre");
    int ataque = validarRango(puntosGenerales, 1);
    puntosGenerales -= ataque;
    print("-" * 100);
    print("Ahora ingresa una descripcion del senamon");
    String descripcion = stdin.readLineSync()!;
    Senamon senamonCreado = Senamon(nombre, 1, tiposSenamon[tipoPosicion - 1], salud, ataque, descripcion);
    universo_senamon.add(senamonCreado);
    print("-" * 100);
    print("El senamon ha sido creado con exito, Esta es su informacion:");
    senamonCreado.mostrarInformacion();
  }

  void cambiarSenamon(List<Entrenador> entrenadores, List<Senamon> universo_senamones){
    int opcion;
    do {
    print("-" * 100);
    print("1. Cambiar senamon");
    print("2. Salir al menu principal");
    opcion = int.parse(stdin.readLineSync()!);
    switch(opcion){
      case 1:
        print("-" * 100);
        entrenadores[numeroEntrenador].cambiarSenamon(universo_senamones);
        break;
      case 2:
        print("Saliendo al menu principal...");
        break;
      default:
        print("Error, Por favor ingrese una opcion valida");
        break;
      }
    } while (opcion != 2);
  }

  void mostrarInformacionSenamones(List<Entrenador> entrenadores, List<Senamon> universo_senamon){
    int opcion;
    do {
      print("-" * 100);
      print("1. Ver informacion de un senamon capturado");
      print("2. Ver informacion de un senamon sin capturar");
      print("3. Salir al menu principal...");
      opcion = int.parse(stdin.readLineSync()!);
      switch (opcion){
        case 1:
          print("-" * 100);
          print("SENAMONES CAPTURADOS");
          for (var i = 0; i < entrenadores[numeroEntrenador].senamonesCapturados.length; i++){
            print("${i + 1}. ${entrenadores[numeroEntrenador].senamonesCapturados[i].getNombre()}");
          }
          print("Ingrese el numero del senamon del cual desea ver la informacion");
          int posicionSenamon = validarPosicion(entrenadores[numeroEntrenador].senamonesCapturados);
          print("-" * 100);
          entrenadores[numeroEntrenador].senamonesCapturados[posicionSenamon - 1].mostrarInformacion();
          break;
        case 2:
          print("-" * 100);
          print("SENAMONES NO CAPTURADOS");
          for (var i = 0; i < universo_senamon.length; i++){
            print("${i + 1}. ${universo_senamon[i].getNombre()}");
          }
          print("Ingrese el numero del senamon del cual desea ver la informacion");
          int posicionSenamon = validarPosicion(universo_senamon);
          print("-" * 100);
          universo_senamon[posicionSenamon - 1].mostrarInformacion();
          break;
        case 3:
          print("Saliendo al menu principal...");
          break;
        default:
          print("Error, por favor ingrese una opcion valida");
          break;
      }
    } while (opcion != 3);
  }

  void juego(List<Entrenador> entrenadores){
    Juego juego = Juego(entrenadores, [], 0, 1, true);
    print("-" * 100);
    print("JUEGO SENAMON");
    juego.setEntrenadoresCopia();
    juego.setCopiaSenamones();
    juego.lanzarMoneda();
    do {
      juego.atacar();
      juego.terminarRonda();
    } while (juego.getContinuar());
    print("El entrenador ${entrenadores[juego.getPosicionEntrenador()].getNombre()} ha ganado esta partida");
    entrenadores[juego.getPosicionEntrenador()].setBatallasGanadas();
    print("BATALLAS GANADAS: ${entrenadores[juego.getPosicionEntrenador()].getBatallasGanadas()}");
    entrenadores[juego.getPosicionEntrenador()].setNivelExp(100);
    print("El jugador ha obtenido 100 puntos de experiencia");
  }
}

  int validarPosicion(List<dynamic> lista){
    int posicionUsu = int.parse(stdin.readLineSync()!);
    do {
      if (posicionUsu < 1 || posicionUsu > lista.length) {
        print("Ingrese una opcion valida que este dentro de la lista");
        posicionUsu = int.parse(stdin.readLineSync()!);
      }
    } while (posicionUsu < 1 || posicionUsu > lista.length);
    return posicionUsu;
  }
