import ingredientes.*
import score.*
import factories.*
import visuales.*
import bobEsponja.*
import nivel.*

class Elemento {
	const imagen
	const _posicionInicial
	var posicion 
	var score = 0
	var ingrediente
    
	constructor(posicionInicial, _imagen, _ingrediente) {
		imagen = _imagen
		_posicionInicial = posicionInicial
		posicion = posicionInicial
		ingrediente = _ingrediente
	}
	    
	method soltar() { 
		posicion = _posicionInicial
	}
	method setPosicion(p) { 
		posicion = p
	}
	method serTomada(personaje) {
			 if (personaje.elemento() != null){
			 	personaje.agarrarIngrediente(ingrediente)
			 	self.setPosicion(new Position (1.randomUpTo(22),1.randomUpTo(10)))	 
			 	plankton.setPosicion(new Position (1.randomUpTo(22),1.randomUpTo(10)))
			 	score += 1
				
	 		 }
	         else{
	         	game.say(personaje, "Me falta la espatula!")
	         }
	}
	method posicion() = posicion
	method score() = score
	method restarScore(_score){
		score -= _score
	}
}



object tomate inherits Elemento(new Position(4,5),"Tomate.png", new Tomate()){
	method actualizarScore(){
		scoreTomate.actualizarScore(score)
	}
}

object pan inherits Elemento(new Position(10,5),"pan.png", new Pan()){

	method actualizarScore(){
		scorePan.actualizarScore(score)
	}
	
}

object lechuga inherits Elemento(new Position(4,3),"lechuga.png", new Lechuga()){

	method actualizarScore(){
		scoreLechuga.actualizarScore(score)
	}
	
}

object paty inherits Elemento(new Position(9,3),"paty.png", new Paty()){

	method actualizarScore(){
		scorePaty.actualizarScore(score)
	}
	
}

object condimentos inherits Elemento(new Position(7,10),"condimentos.png", new Condimentos()){

	method actualizarScore(){
		scoreCondimentos.actualizarScore(score)
	}
	
}

object plankton inherits Elemento(new Position(10,3), "plankton.png", new Plankton()){
	var formulaKangreBurger = 0
	method formulaKangreBurger() { return formulaKangreBurger}
	override method serTomada(personaje) {
				if (paty.score() > 0){
			 		paty.restarScore(1)
			 		formulaKangreBurger += 1
			 	    game.say(self, "He atrapado la f�rmula! Muajaja")							 	
			 	}
			 	else
					game.say(self, "Esta vez safaste!")		
				self.setPosicion(new Position (1.randomUpTo(22),1.randomUpTo(10)))			
	 		}
	         
	}

object kangreburger {
	var score = 0
	var ingredientes = [tomate,pan,lechuga,paty,condimentos]
	method cuantasHay(){
		return (ingredientes.sortedBy({x, t => (x.score()) <= (t.score())})).head().score()
	}
}
object espatula {
	const imagen = "espatula.png"
	const _posicionInicial = new Position(3,2)
	var posicion = _posicionInicial
	
    method soltar() { 
		posicion = _posicionInicial
	}
	method setPosicion(p) { 
		posicion = p
	}
	
	method posicion() = posicion
	method serTomada(personaje) {
			 personaje.agarrar(self)
	}
}