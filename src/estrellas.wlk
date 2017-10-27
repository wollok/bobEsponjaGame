class Estrella {
	const imagen = "estrella.png"
}

class EstrellaArriba inherits Estrella {
	method empuja(bob) {
		bob.posicion().moveDown(1)
	}
}

class EstrellaAbajo inherits Estrella {
	method empuja(bob) {
		bob.posicion().moveUp(1)
	}
}

class EstrellaIzquierda inherits Estrella {
	method empuja(bob) {
		bob.posicion().moveRight(1)
	}
}

class EstrellaDerecha inherits Estrella {
	method empuja(bob) {
		bob.posicion().moveLeft(1)
	}
}