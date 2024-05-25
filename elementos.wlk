import factories.*
import visuales.*
import nivel.*
import wollok.game.*

class Ingrediente inherits Visual {
	var property score = 0
	var property monedas
	
	method colisionadoPor(personaje) {
		if (personaje.tieneEspatula()) {
			personaje.agarrarIngrediente(self)
			score += 1
			personaje.cuantasMonedas()
		} else {
			game.say(personaje, "¡Me falta la espátula!")
		}
		nivel.ubicarAleatoriamente(self)
	}
	
	method restarScore(_score) {
		score -= _score
	}
}

const tomate = new Ingrediente(image = "tomate.png", monedas = 100)

const pan = new Ingrediente(image = "pan.png", monedas = 50)

const lechuga = new Ingrediente(image = "lechuga.png", monedas = 4)

const paty = new Ingrediente(image = "paty.png", monedas = 9)

const condimentos = new Ingrediente(image = "condimentos.png", monedas = 2)

object plankton inherits Visual (
	position = new Position(x = 10, y = 3),
	image = "plankton.png"
) {
	var formulaKangreBurger = 0
	
	method colisionadoPor(personaje) {
		if (kangreburger.score() > 0) {
			kangreburger.restarScore(1)
			formulaKangreBurger += 1
			game.say(self, "He atrapado la fórmula! Muajaja")
		} else {
			game.say(self, "No tenés hamburguesas hechas, esta vez safaste!")
		}
		nivel.ubicarAleatoriamente(self)
	}
	
	method score() = formulaKangreBurger
}

object kangreburger inherits Visual (image = "kangreburger.png") {
	var property ingredientes = [tomate, pan, lechuga, paty, condimentos]
	
	method score() = ingredientes.min({ ing => ing.score() }).score()
	
	method restarScore(cant) {
		ingredientes.forEach({ ing => ing.restarScore(cant) })
	}
}

object espatula inherits Visual (
	image = "espatula.png",
	position = new Position(x = 3, y = 2)
) {
	method colisionadoPor(personaje) {
		personaje.tieneEspatula(true)
		game.say(personaje, "Tengo la espátula")
		game.removeVisual(self)
	}
}