class Hogar{
  const nivelDeMugre 
  const confort 
  method esBueno() =  nivelDeMugre <= confort/2

}
class Huerta{
  const capacidadProd 
   method esBueno() = capacidadProd > nivelDeHuerta.valor()
}

object nivelDeHuerta {
  var property valor = 0 
  method cambiarValor(nuevoValor) {valor = nuevoValor}
}
class Mascota {
  const nivelSalud 
  method esBueno() = nivelSalud > 250
}

class Barrio {
  const elementos = []
  method agregarElemento(elemento){elemento.add(elemento)} 
  method esCopado () {
    return elementos.sum({e => e.esBueno()}) > elementos.sum({e => not e.esBueno()})
  }
}
class Plaga {
  var poblacion  
  method transmiteEnfermedad() = poblacion >=10
  method atacar(elemento){
    elemento.recibirAtaque(self)
    poblacion = poblacion * 1.1
  }

}
class Cucarachas inherits Plaga{
  const pesoPromedio 
  method daño() = poblacion/2
  override method transmiteEnfermedad() = super() && self.cumpleCondicion() 
  override method atacar(elemento) {
    super(elemento) && pesoPromedio + 2
  }
  method cumpleCondicion() = pesoPromedio >= 10

}
class Pulgas inherits Plaga{
  method daño() = poblacion*2
}
class Garrapatas inherits Pulgas{

}
class Mosquitos inherits Plaga{
  method daño() = poblacion 
  override method transmiteEnfermedad() = super() && self.cumpleCondicion() 
  method cumpleCondicion() = poblacion % 3 == 0
}