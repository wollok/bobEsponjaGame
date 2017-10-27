import factories.*
import elementos.*
import nivel.*

object numberConverter{
	var imageNumber = [new Numero("cero.png"),new Numero("uno.png"),new Numero("dos.png"),new Numero("tres.png"),new Numero("cuatro.png"), new Numero("cinco.png"),new Numero("seis.png"), new Numero("siete.png"), new Numero("ocho.png"),new Numero("nueve.png")]

    method getNumberImage(number){
    	return imageNumber.get(number)
    }
}
class Numero{
	const imagen
	
	constructor(_imagen){
		imagen = _imagen
	}
} 


class TomateScore {
	const imagen = "tomate.png"
}
class PanScore {
	const imagen = "pan.png"
}
class LechugaScore{
	const imagen = "lechuga.png"
}
class PatyScore{
	const imagen = "paty.png"
}
class CondimentosScore{
	const imagen = "condimentos.png"
}
class FormulaScore{
	const imagen = "formulaKangre.png"
}

class KangreBurgerScore{
	const imagen = "kangreburger.png"
}

class ScoreBasic{
	var x
	var y
	var imagen
	constructor(_x,_y, _imagen){
		x = _x
		y = _y
		imagen = _imagen
	}
	method iniciarScore(){
		scoreFactory.draw(imagen, new Position(x,y))
		scoreFactory.drawScore(0, x, y)
	}
	method actualizarScore(score){
		scoreFactory.drawScore(score,x,y)
	}
}

object scoreTomate inherits ScoreBasic(24,10, new TomateScore()){
}
object scorePan inherits ScoreBasic(24,9, new PanScore()){

}
object scoreLechuga inherits ScoreBasic(24,8, new LechugaScore()){
	
}
object scorePaty inherits ScoreBasic(24,7, new PatyScore()){
	
}
object scoreCondimentos inherits ScoreBasic(24,6, new CondimentosScore()){
	
}
object scoreFormula inherits ScoreBasic(24,3, new FormulaScore()){
	
}
object scoreKangreburger inherits ScoreBasic(24,5,new KangreBurgerScore()){
	
}

object win{
	
	method actualizarScoreTotal(){
		if (plankton.formulaKangreBurger() >= 3)
			nivel.gameOver()
		else{ 
			if(kangreburger.cuantasHay() >= 2)
				nivel.hasGanado()
			else 
				scoreFactory.drawNewScore(24,10)
		}
	}
}















