import 'dart:io';
import 'Clases/Senamon.dart';
import 'Clases/Entrenador.dart';
import 'Clases/Menu.dart';

void main(List<String> args) {
    List<Senamon> universo_senamon = [
  Senamon('Flameon'     , 1, "fuego",     200, 50, "Senamon de fuego"),
  Senamon('Aquaon'      , 1, "agua",      200, 70, "Senamon de agua"),
  Senamon("Charmander"  , 1, "fuego",     200, 70, "senamon de fuego"),
  Senamon("Pikachu"     , 1, "electrico", 200, 75, "senamon electrico"),
  Senamon("Bulbassaur"  , 1, "hierva",    200, 65, "senamon de hierva"),
  Senamon("Tornadus"    , 1, "volador",   200, 55, "senamon de vuelo"),
  Senamon("Slugma"      , 1, "fuego",     200, 60, "senamon de fuego"),
  Senamon("Regieleki"   , 1, "electrico", 200, 90, "senamon electrico"),
  Senamon("Virizion"    , 1, "hierva",    200, 95, "senamon de hierva"),
  Senamon("Panpour"     , 1, "agua",      200, 55, "senamon de agua"),
  Senamon("Rookidee"    , 1, "volador",   200, 70, "Senamon de Vuelo"),
  Senamon("Entei"       , 1, "fuego",     200, 70, "Senamon de fuego"),
  Senamon("Luxray"      , 1, "electrico", 200, 70, "Senamon de Electricidad"),
  Senamon("Serperior"   , 1, "hierva",    200, 70, "Senamon de Hierva"),
  Senamon("Greninja"    , 1, "agua",      200, 70, "Senamon de Agua"),
  Senamon("Corviknight" , 1, "volador",   200, 70, "Senamon de Vuelo"),
  Senamon("Braixen"     , 1, "fuego",     200, 70, "Senamon de fuego"),
  Senamon("Toxel"       , 1, "electrico", 200, 70, "Senamon de Electricidad"),
  Senamon("Tangela"     , 1, "hierva",    200, 70, "Senamon de Hierva"),
  Senamon("Wailmer"     , 1, "agua",      200, 70, "Senamon de Agua"),
  Senamon("Staraptor"   , 1, "volador",   200, 70, "Senamon de Vuelo")
    ];

    List<Entrenador> entrenadores = [];

    //Creacion de entrenadores predeterminados
    Entrenador entrenador1 = Entrenador("Dash", "dash12@email.com", "2005-06-03", 200, 0, []);
    Entrenador entrenador2 = Entrenador("Ashley", "ashley-02@email.com", "2002-10-30", 200, 0, []);

    print("MUNDO SENAMON");
    print("-"*100);
    print("Quiere usar los entrenadores preedeterminados o quiere crear los entrenadores?");
    print("Si[s], No[n]");
    String tiposEntrenador = stdin.readLineSync()!;
    tiposEntrenador = tiposEntrenador.toLowerCase();
    do {
      if (tiposEntrenador != "s" && tiposEntrenador != "n") {
        print("Ingrese una opcion correcta (s o n)");
        tiposEntrenador = stdin.readLineSync()!;
      }
    } while (tiposEntrenador != "s" && tiposEntrenador != "n");
    if (tiposEntrenador == "s") {
      entrenadores.add(entrenador1);
      entrenadores.add(entrenador2);
    } else {
      for(var i = 0; i < 2; i++) {
        print("-"*100);
        print("ENTRENADOR ${i + 1}");
        print("-"*100);
        print("Ingrese el nombre del entrenador");
        String nombre = stdin.readLineSync()!;
        print("Ingrese el email del entrenador");
        String email = stdin.readLineSync()!;
        print("Ingrese la fecha de nacimiento del entrenador");
        String fecha = stdin.readLineSync()!;
        Entrenador entrenador = Entrenador(nombre, email, fecha, 200, 0, []);
        entrenadores.add(entrenador);
      }
    }

    //Eleccion de los Senamones
    print("-"*100);
    print("Ahora se eligiran los senamones de cada entrenador");
    for (var i = 0; i < entrenadores.length; i++) {
      print("Entrenador: ${entrenadores[i].getNombre()}");
      for (var j = 0; j < 5; j++) {
        print("Elija el numero del senamon numero ${j+1}");
        for (var k = 0; k < universo_senamon.length; k++) {
          print("${k+1}. ${universo_senamon[k].getNombre()}");
        }
        print("Ingrese el numero de senamon que desea elegir.");
        int posicionSenamon = validarPosicion(universo_senamon);
        entrenadores[i].senamonesCapturados.add(universo_senamon[posicionSenamon - 1]);
        universo_senamon.removeAt(posicionSenamon - 1);
      }
    }

    print("Los entrenadores quedaron registrados exitosamente al universo senamon, con los siguientes datos:");
    for (var i = 0; i < entrenadores.length; i++) {
      entrenadores[i].mostrarInformacion();
      print("-"*100);
    }

    //MENU SENAMON
    /*
    1. Ver informacion de un entrenador
    2. Entrenar senamon
    3. Crear nuevo senamon
    4. Cambiar senamones elegidos
    5. Ver informacion de un senamon
    6. Batalla
    7. Salir
    */
    int opcion;
  //Se inicializa la clase menú para usar sus metodos
  Menu menu = Menu(0);
    do{
      print("-"*100);
      print("MENU SENAMON");
      menu.elegirEntrenador(entrenadores);
      print("""
        1. Ver informacion de un entrenador
        2. Entrenar senamon
        3. Crear nuevo senamon
        4. Cambiar senamones elegidos
        5. Ver informacion de un senamon
        6. Batalla
        7. Salir
      """);
    opcion = int.parse(stdin.readLineSync()!);
    switch (opcion) {
      case 1:
      menu.mostrarInfoEntrenador(entrenadores);
        break;
      
      case 2:
      menu.entrenarSenamon(entrenadores);
        break;

      case 3:
      menu.crearSenamon(entrenadores, universo_senamon);
        break;

      case 4:
        menu.cambiarSenamon(entrenadores, universo_senamon);
        break;

      case 5:
        menu.mostrarInformacionSenamones(entrenadores, universo_senamon);
        break;

      case 6:
        menu.juego(entrenadores);
        break;

      case 7:
      print("Espero que hayas disfrutado del MUNDO SENAMON, Hasta pronto!");
        break;
    }
    } while(opcion != 7);
}

int validarPosicion(List<dynamic> lista) {
  int posicion = int.parse(stdin.readLineSync()!);
  do {
    if (posicion < 1 || posicion > lista.length) {
      print("Ingrese una opcion valida que este dentro de la lista");
      posicion = int.parse(stdin.readLineSync()!);
    } 
  } while (posicion < 1 || posicion > lista.length);
  return posicion;
  }
