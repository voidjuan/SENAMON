import 'dart:io';

import 'Senamon.dart';
import 'Entrenador.dart';
import 'menu.dart';

void main(List<String> args) {
    List<Senamon> universo_senamon = [
      Senamon("Charmander", 1, "Fuego", 100, 25, "Senamon de fuego"),
      Senamon("Pikachu", 1, "Electrico", 75, 50, "Senamon de Electricidad"),
      Senamon("Bulbassaur", 1, "Hierva", 200, 35, "Senamon de Hierva"),
      Senamon("Squirtle", 1, "Agua", 150, 30, "Senamon de Agua"),
      Senamon("Charmander", 1, "Fuego", 100, 25, "Senamon de fuego"),
      Senamon("Pikachu", 1, "Electrico", 75, 50, "Senamon de Electricidad"),
      Senamon("Bulbassaur", 1, "Hierva", 200, 35, "Senamon de Hierva"),
      Senamon("Squirtle", 1, "Agua", 150, 30, "Senamon de Agua"),
      Senamon("Charmander", 1, "Fuego", 100, 25, "Senamon de fuego"),
      Senamon("Pikachu", 1, "Electrico", 75, 50, "Senamon de Electricidad"),
      Senamon("Bulbassaur", 1, "Hierva", 200, 35, "Senamon de Hierva"),
      Senamon("Squirtle", 1, "Agua", 150, 30, "Senamon de Agua"),
      Senamon("Charmander", 1, "Fuego", 100, 25, "Senamon de fuego"),
      Senamon("Pikachu", 1, "Electrico", 75, 50, "Senamon de Electricidad"),
      Senamon("Bulbassaur", 1, "Hierva", 200, 35, "Senamon de Hierva"),
      Senamon("Squirtle", 1, "Agua", 150, 30, "Senamon de Agua"),
      Senamon("Charmander", 1, "Fuego", 100, 25, "Senamon de fuego"),
      Senamon("Pikachu", 1, "Electrico", 75, 50, "Senamon de Electricidad"),
      Senamon("Bulbassaur", 1, "Hierva", 200, 35, "Senamon de Hierva"),
      Senamon("Squirtle", 1, "Agua", 150, 30, "Senamon de Agua")
    ];

    List<Entrenador> entrenadores = [];

    //Creacion de entrenadores predeterminados
    Entrenador entrenador1 = Entrenador("Dash", "dash12@email.com", "2005-06-03", 200, 0);
    Entrenador entrenador2 = Entrenador("Ashley", "ashley-02@email.com", "2002-10-30", 200, 0);

    print("MUNDO SENAMON");
    print("*"*100);
    print("Quiere usar los entrenadores preedeterminados o quiere crear los entrenadores?");
    print("Si[s], No[n]");
    String tipoEntrenador = stdin.readLineSync()!;
    tipoEntrenador = tipoEntrenador.toLowerCase();
    do {
      if (tipoEntrenador != "s" && tipoEntrenador != "n") {
        print("Ingrese una opcion correcta (s o n)");
        tipoEntrenador = stdin.readLineSync()!;
      }
    } while (tipoEntrenador != "s" && tipoEntrenador != "n");
    if (tipoEntrenador == "s") {
      entrenadores.add(entrenador1);
      entrenadores.add(entrenador2);
    } else {
      for(var i = 0; i < 2; i++) {
        print("*"*100);
        print("ENTRENADOR ${i + 1}");
        print("*"*100);
        print("Ingrese el nombre del entrenador");
        String nombre = stdin.readLineSync()!;
        print("Ingrese el email del entrenador");
        String email = stdin.readLineSync()!;
        print("Ingrese la fecha de nacimiento del entrenador");
        String fecha = stdin.readLineSync()!;
        Entrenador entrenador = Entrenador(nombre, email, fecha, 200, 0);
        entrenadores.add(entrenador);
      }
    }

    //Eleccion de los Senamones
    print("*"*100);
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
      print("*"*100);
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
      menu.en
        break;

      case 3:
        break;

      case 4:
        break;

      case 5:
        break;

      case 6:
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
