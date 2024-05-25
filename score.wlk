import wollok.game.*
import visuales.*
import factories.*
import elementos.*

object score{
	const elementos = kangreburger.ingredientes() + [kangreburger,plankton]
	const posicionInicial = new Position(x=24,y=9)
	
	method dibujar(){
		var n = 0
		elementos.forEach{ elem=>self.dibujarItem(elem, posicionInicial.down(n))
			n+=1
		}
	}
	method dibujarItem(elemento,posicion){
		game.addVisual(new Visual(image = elemento.image(),position = posicion))
		game.addVisualIn(numberConverter.getNumberImage(elemento.score().div(10)),posicion.right(1))
		game.addVisualIn(numberConverter.getNumberImage(elemento.score() % 10),posicion.right(2))
		
	}

}

object numberConverter{
    method getNumberImage(number){
    	return new Visual(image= "nro" + number + ".png")
    }
}


