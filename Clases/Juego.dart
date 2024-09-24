import 'dart:math';
import 'Entrenador.dart';
import 'Senamon.dart';
import 'Menu.dart';

class Juego {
  List<Entrenador> _entrenadores;
  List<Entrenador> _copiaEntrenadores;
  int _pocisionEntrenador;
  int _pocisionEnemigo;
  bool _continuar;

  Juego(this._entrenadores, this._copiaEntrenadores, this._pocisionEntrenador, this._pocisionEnemigo, this._continuar);

  void setEntrenadoresCopia(){
    for (var i = 0; i < _entrenadores.length; i++) {
      Entrenador copiaEntrenador = Entrenador(_entrenadores[i].getNombre(), "", "", 0, 0, []);
      _copiaEntrenadores.add(copiaEntrenador);
    }
  }

  void setCopiaSenamones(){
    for (var i = 0; i < _copiaEntrenadores.length; i++) {
      for (var j = 0; j < _entrenadores[i].senamonesCapturados.length; j++) {
        Senamon senamonCopia = Senamon(_entrenadores[i].senamonesCapturados[j].getNombre(), 0, _entrenadores[i].senamonesCapturados[j].getTipoSenamon(), _entrenadores[i].senamonesCapturados[j].getSalud(), _entrenadores[i].senamonesCapturados[j].getAtaque(), "");
        _copiaEntrenadores[i].senamonesCapturados.add(senamonCopia);
      }
    }
  }
  
  void lanzarMoneda(){
    List<String> CaraSello = ["Cara", "Sello"];
    Random random = Random();
    print("El entrenador ${_copiaEntrenadores[0].getNombre()} ha sido asignado con cara y el entrenador ${_copiaEntrenadores[1].getNombre()} ha sido asignado con sello");
    int elegido = random.nextInt(2);
    print("Ha salido ${CaraSello[elegido]}");
    print("Ha ganado el primer turno ${_copiaEntrenadores[elegido].getNombre()}");
    _pocisionEntrenador = elegido;
    if (_pocisionEntrenador == 0) {
      _pocisionEnemigo = 1;
    }else{
      _pocisionEnemigo = 0;
    }
  }

  void atacar(){
    print("*"*100);
    print("Entrenador: ${_copiaEntrenadores[_pocisionEntrenador].getNombre()}");
    print("Ingrese el Senamon con el que desea atacar");
    for (var i = 0; i < _copiaEntrenadores[_pocisionEntrenador].senamonesCapturados.length; i++) {
      print("${i + 1}. ${_copiaEntrenadores[_pocisionEntrenador].senamonesCapturados[i].getNombre()}. Vida: ${_copiaEntrenadores[_pocisionEntrenador].senamonesCapturados[i].getSalud()}");
    }
    int pocisionSenamon = validarVida(_copiaEntrenadores[_pocisionEntrenador].senamonesCapturados);
    print("Ingrese el Senamon del enemigo al que desea atacar");
    for (var i = 0; i < _copiaEntrenadores[_pocisionEnemigo].senamonesCapturados.length; i++) {
      print("${i + 1}. ${_copiaEntrenadores[_pocisionEnemigo].senamonesCapturados[i].getNombre()}. Vida: ${_copiaEntrenadores[_pocisionEnemigo].senamonesCapturados[i].getSalud()}");
    }
    int pocisionSenamonEnemigo = validarVida(_copiaEntrenadores[_pocisionEnemigo].senamonesCapturados);
    _copiaEntrenadores[_pocisionEntrenador].senamonesCapturados[pocisionSenamon].atacar(_copiaEntrenadores[_pocisionEnemigo].senamonesCapturados[pocisionSenamonEnemigo]);
  }

  int validarVida(List<Senamon> senamonesCapturados){
    int posicionSenamon = validarPosicion(senamonesCapturados) - 1;
    do {
      if (senamonesCapturados[posicionSenamon].getSalud() == 0) {
        print("El senamon ${senamonesCapturados[posicionSenamon].getNombre()} está muerto, ingrese otro senamon");
        posicionSenamon = validarPosicion(senamonesCapturados) - 1;
      }
    } while (senamonesCapturados[posicionSenamon].getSalud() == 0);
    return posicionSenamon;
  }

  void terminarRonda(){
    int contador = 0;
    for (var i = 0; i < _copiaEntrenadores[_pocisionEnemigo].senamonesCapturados.length; i++) {
      if (_copiaEntrenadores[_pocisionEnemigo].senamonesCapturados[i].getSalud() == 0) {
        contador++;
      }
    }
    if (contador >= 3) {
      _continuar = false;
    }else{
      if (_pocisionEntrenador == 0) {
        _pocisionEnemigo = 0;
        _pocisionEntrenador = 1;
      }else{
        _pocisionEnemigo = 1;
        _pocisionEntrenador = 0;
      }
    }
  }

  bool getContinuar(){
    return _continuar;
  }

  int getPosicionEntrenador(){
    return _pocisionEntrenador;
  }

}