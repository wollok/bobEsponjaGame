import wollok.game.*
import visuales.*
import factories.*
import estrellas.*
import elementos.*
import score.*

object nivel{
	method inicio(){
	game.clear()
	game.title("Bob Esponja y las Kangreburger")
	game.width(28)
	game.height(12)
	game.ground("Celda.png")
	game.addVisual(inicioDelJuego)
	game.addVisual(bobAlCostado)
	game.addVisual(costadoPlankton)
	keyboard.s().onPressDo{self.configurate()}
}	
	
	method configurate() {
	//	CONFIGURACI�N DEL JUEGO
		game.clear()
		game.width(28)
		game.height(12)
		game.addVisual(fondoDelJuego)
		game.ground("Celda.png")
		
		//Visuales	
			game.addVisualCharacter(bobVisual)
		
			const ancho = game.width() - 1 - 5
			const largo = game.height() - 1 
		
			(1 .. ancho-1).forEach { n => estrellaFactory.draw(new EstrellaAbajo(),new Position(n, 0)) } // bordeAbajo
			(1 .. ancho-1).forEach { n => estrellaFactory.draw(new EstrellaArriba(), new Position(n, largo)) } // bordeArriba 
			estrellaFactory.draw(new EstrellaArriba(),new Position(largo,ancho-1))
			(0 .. largo).forEach { n => estrellaFactory.draw(new EstrellaIzquierda(), new Position(0, n)) } // bordeIzq 
			(0 .. largo).forEach { n => estrellaFactory.draw(new EstrellaDerecha(), new Position(ancho, n)) } // bordeDer
	        
			scorePan.iniciarScore()
			scoreTomate.iniciarScore()
			scoreLechuga.iniciarScore()
			scorePaty.iniciarScore()
			scoreCondimentos.iniciarScore()
			scoreFormula.iniciarScore()
			scoreKangreburger.iniciarScore()
			
		game.addVisual(espatula)
	
		var ingredientesSueltos = [tomate,pan,lechuga,paty,condimentos]
		ingredientesSueltos.forEach { it => game.addVisual(it) }
		game.addVisual(plankton)
	

		
		//Colisiones
		
		game.whenCollideDo(espatula, { w =>  if (bobVisual == w) espatula.serTomada(bobVisual) })
		game.whenCollideDo(plankton, { w =>  if (bobVisual == w) plankton.serTomada(bobVisual) })
		
		ingredientesSueltos.forEach { it => game.whenCollideDo(it, { g =>	
			if (bobVisual == g) 
				if (!(bobVisual.posicion() === it.posicion()))
					it.serTomada(bobVisual)
				
		  })
        }
        
        //Teclado	
			keyboard.w().onPressDo{ bobVisual.canta()}
			keyboard.m().onPressDo{ bobVisual.cuantasMonedas()}

			keyboard.e().onPressDo{ win.actualizarScoreTotal()}
			
			
			keyboard.right().onPressDo{console.println("derecha 1") win.actualizarScoreTotal() console.println("derecha 2")}
			keyboard.left().onPressDo{ win.actualizarScoreTotal() }
			keyboard.up().onPressDo{ win.actualizarScoreTotal() }
			keyboard.down().onPressDo{ win.actualizarScoreTotal()}
			
	}
	
	method hasGanado(){
		game.clear()
		game.width(28)
		game.height(12)
		game.addVisual(winVisual)
		game.addVisual(empleadoDelMes)

		keyboard.p().onPressDo{self.inicio()}
		keyboard.f().onPressDo{game.stop()}
	}
	
	method gameOver(){
		game.clear()
		game.title("Bob Esponja y las Kangreburgers")
		game.width(28)
		game.height(12)
        game.addVisual(gameOver)
		keyboard.p().onPressDo{self.inicio()}
		keyboard.f().onPressDo{game.stop()}
		
	}
}