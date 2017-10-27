import visuales.*
import estrellas.*
import score.*
import elementos.*
object estrellaFactory {
	method draw(estrella, posicion) {
		posicion.drawElement(estrella)
		game.whenCollideDo(estrella, { g => estrella.empuja(g) })
	}
	
	method drawVerticalBlock(x, y) {
		self.draw(new EstrellaDerecha(), new Position(x, y))
		self.draw(new EstrellaDerecha(), new Position(x, y+1))
		self.draw(new EstrellaIzquierda(), new Position(x+1, y))
		self.draw(new EstrellaIzquierda(), new Position(x+1, y+1)
		)
	}
	
	method drawHorizontalBlock(x, y) {
		self.draw(new EstrellaArriba(), new Position(x, y))
		self.draw(new EstrellaArriba(), new Position(x+1, y))
		self.draw(new EstrellaAbajo(), new Position(x, y+1))
		self.draw(new EstrellaAbajo(), new Position(x+1, y+1))
	}
}

object scoreFactory{
	method draw(ingrediente, posicion) {
		posicion.drawElement(ingrediente)
	}
	method drawScore(score,x,y){
		self.draw(numberConverter.getNumberImage(score.div(10)),new Position(x+1,y))
		self.draw(numberConverter.getNumberImage(score % 10),new Position(x+2,y))
	}
	method drawNewScore(x,y){
		self.clearAllScore()
		self.draw(numberConverter.getNumberImage(plankton.formulaKangreBurger().div(10)),new Position(x+1,y-7))
		self.draw(numberConverter.getNumberImage(plankton.formulaKangreBurger() %10),new Position(x+2,y-7))
		self.draw(numberConverter.getNumberImage(kangreburger.cuantasHay().div(10)),new Position(x+1,y-5))
		self.draw(numberConverter.getNumberImage(kangreburger.cuantasHay() %10),new Position(x+2,y-5))
		self.draw(numberConverter.getNumberImage(condimentos.score().div(10)),new Position(x+1,y-4))
		self.draw(numberConverter.getNumberImage(condimentos.score() %10),new Position(x+2,y-4))
		self.draw(numberConverter.getNumberImage(paty.score().div(10)),new Position(x+1,y-3))
		self.draw(numberConverter.getNumberImage(paty.score() %10),new Position(x+2,y-3))
		self.draw(numberConverter.getNumberImage(lechuga.score().div(10)),new Position(x+1,y-2))
		self.draw(numberConverter.getNumberImage(lechuga.score() %10),new Position(x+2,y-2))
		self.draw(numberConverter.getNumberImage(pan.score().div(10)),new Position(x+1,y-1))
		self.draw(numberConverter.getNumberImage(pan.score() % 10),new Position(x+2,y-1))
		self.draw(numberConverter.getNumberImage(tomate.score().div(10)),new Position(x+1,y))
		self.draw(numberConverter.getNumberImage(tomate.score() %10),new Position(x+2,y))
		
	}

	method clearAllScore(){
		(3 .. 10).forEach { n => new Position(25, n).clear() }
		(3 .. 10).forEach { n => new Position(26, n).clear() }
	}
}


