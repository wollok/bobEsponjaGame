import wollok.game.*
import visuales.*
import factories.*
import elementos.*
import score.*

object nivel {
	const anchoTotal = 28
	const altoTotal = 12
	const anchoRecuadro = 22
	const altoRecuadro = 11 // Hack para poder borrar el juego
	
	method clearGame() {
		game.allVisuals().forEach({ visual => game.removeVisual(visual) })
	}
	
	method inicio() {
		self.clearGame()
		game.title("Bob Esponja y las Kangreburger")
		game.width(anchoTotal)
		game.height(altoTotal)
		game.boardGround("Celda.png")
		game.addVisual(inicioDelJuego)
		game.addVisual(bobAlCostado)
		game.addVisual(costadoPlankton)
		keyboard.s().onPressDo({ self.configurate() })
	}
	
	method configurate() {
		//	CONFIGURACION DEL JUEGO
		self.clearGame()
		game.width(anchoTotal)
		game.height(altoTotal)
		game.addVisual(fondoDelJuego)
		game.boardGround("Celda.png") 
		
		//Visuales	
		game.addVisual(bobEsponja)
		movimiento.configurarFlechas(bobEsponja)
		new MarcoSolido(
			verticeInicial = new Position(x = 0, y = 0),
			verticeFinal = new Position(x = anchoRecuadro, y = altoRecuadro),
			image = "estrella.png"
		).dibujar()
		game.addVisual(espatula)
		game.addVisual(plankton)
		[tomate, lechuga, pan, paty, condimentos].forEach(
			{ ingrediente =>
				game.addVisual(ingrediente)
				return self.ubicarAleatoriamente(ingrediente)
			}
		)
		score.dibujar()
		
		//Colisiones
		game.whenCollideDo(
			bobEsponja,
			{ elemento =>
				elemento.colisionadoPor(bobEsponja)
				win.actualizarScoreTotal()
			}
		) 
		
		//Teclado	
		keyboard.w().onPressDo({ bobEsponja.canta() })
		keyboard.m().onPressDo({ bobEsponja.cuantasMonedas() })
		keyboard.e().onPressDo({ win.actualizarScoreTotal() })
	}
	
	method ubicarAleatoriamente(visual) {
		const posicion = new Position(
			x = 1.randomUpTo(anchoRecuadro),
			y = 1.randomUpTo(altoRecuadro)
		)
		if (game.getObjectsIn(posicion).isEmpty()) visual.position(posicion)
		else self.ubicarAleatoriamente(visual)
	}
	
	method hasGanado() {
		self.clearGame()
		game.width(anchoTotal)
		game.height(altoTotal)
		game.addVisual(winVisual)
		game.addVisual(empleadoDelMes)
		keyboard.p().onPressDo({ self.inicio() })
		keyboard.f().onPressDo({ game.stop() })
	}
	
	method gameOver() {
		game.clear()
		game.title("Bob Esponja y las Kangreburgers")
		game.width(anchoTotal)
		game.height(altoTotal)
		game.addVisual(gameOver)
		keyboard.p().onPressDo({ self.inicio() })
		keyboard.f().onPressDo({ game.stop() })
	}
}