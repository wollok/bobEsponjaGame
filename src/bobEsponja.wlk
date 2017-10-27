import elementos.*
import ingredientes.*

object bobEsponja{
	
	var monedas = 0
	var ingredientes = []
	method sumaMonedas(cantidad) { monedas += cantidad }

	method restaMonedas(cantidad) {
		if (cantidad > monedas)
			throw new Exception("No tengo suficiente monedas para eso")
		monedas -= cantidad
	}
	
	method agarrarIngrediente(ingrediente){
		self.sumaMonedas(ingrediente.monedas())
		ingredientes.add(ingrediente)
	}
	method monedas() = monedas
}