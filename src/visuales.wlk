import wollok.game.*
import bobEsponja.*
import elementos.*

object bobVisual{
	const imagen = "BobChiquito.png"
	var posicion = new Position(0,0)
	var elemento
	
	method canta() {
		game.say(self, "Vivo en una piña debajo del mar")
	}
	method cuantasMonedas(){
		game.say(self, "Tengo " + bobEsponja.monedas() + " monedas!!")
	}
	method agarrar(agarrable) {
		if (elemento != null)
			elemento.soltar() 
		elemento = agarrable
		agarrable.setPosicion(posicion)
	}
	
	method agarrarIngrediente(ingrediente){
		bobEsponja.sumaMonedas(ingrediente.monedas())
	}
	method restarMonedas(cantidad){
		bobEsponja.restaMonedas(cantidad)
	}
	
	method usarElemento() { elemento.usate(self) }
	method posicion() = posicion
	method elemento() = elemento
}

//Fondos del juego de las distintas pantallas

object fondoDelJuego {
	const imagen = "Fondo_del_Mar.PNG"
	var posicion = new Position(0,0)
	method posicion() = posicion
}
object inicioDelJuego {
	const imagen = "CrustaceoCascarudo.png"
	var posicion = new Position(1,1)
	method posicion() = posicion
}
object bobAlCostado {
	const imagen = "PruebaInstrucciones.png"
	var posicion = new Position(19,1)
	method posicion() = posicion
}
object winVisual {
	const imagen = "winwin.png"
	var posicion = new Position(0,0)
	method posision() = posicion
}
object empleadoDelMes {
	const imagen = "empleadoDelMes.png"
	var posicion = new Position(20,0)
	method posision() = posicion
}

object costadoPlankton{
	const imagen = "planktonALCostado.png"
	var posicion = new Position(22,1)
	method posision() = posicion
}

object gameOver{
	const imagen = "sadBob.gif"
	var posicion = new Position(1,1)
	method posicion() = posicion
}



