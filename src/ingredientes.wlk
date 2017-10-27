import bobEsponja.*

class Ingredientes {
	var monedas
	var nombre
	
	constructor(_nombre, _monedas) {
		nombre = _nombre
		monedas = _monedas
	}

	method monedasGanadas() = monedas
	
	method monedas() = monedas
	method nombre() = nombre
}

class Espatula inherits Ingredientes { 
	constructor() = super("espatula", 25)
}
class Tomate inherits Ingredientes {
	constructor() = super("tomate", 100)
}
class Pan inherits Ingredientes{
	constructor() = super("pan", 50)
}
class Lechuga inherits Ingredientes{
	constructor() = super("lechuga", 4)
}
class Paty inherits Ingredientes{
	constructor() = super("paty", 9)
}
class Condimentos inherits Ingredientes{
	constructor() = super("condimentos", 2)
}
class Plankton inherits Ingredientes{
	constructor() = super("plankton", 5)
}

