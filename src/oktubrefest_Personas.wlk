import oktubreFest_MarcasYJarras.*
import oktubreFest_Carpas.*

class Persona 
{
	var property peso = 0 
	const property jarrasCompradas = []
	var property leGustaMusicaTradicional = false
	var property nivelDeAguante = 0
	var property pais  = ""
	
	method comprar(jarra) 
	{
		jarrasCompradas.add(jarra)
	}
	
	method estaEbrio() 
	{
		return self.cantidadDeAlcoholIngerido() * self.peso() > self.nivelDeAguante()
	}
	
	method cantidadDeAlcoholIngerido() 
	{
		return jarrasCompradas.sum({jarras => jarras.capacidadLitros()})
	}
	
	method esEmpedernida() 
	{
		return jarrasCompradas.all({jarras => jarras.capacidadLitros() > 1})
	}
	
	method esPatriota() 
	{
		return jarrasCompradas.all({jarras => jarras.marca().paisDeOrigen() == self.pais()})
	}
	
	method enQueCarpasLeSirvieronCerveza() 
	{
		return jarrasCompradas.map({jarras => jarras.enQueCarpaSeSirvio()}).asSet()
	}
	
}

class Belga inherits Persona 
{
	method leGusta(marcaDeCerveza) 
	{
		return marcaDeCerveza.contenidoLupulo() > 0.04
	}
	
	method quiereEntrarA(carpa) 
	{
		return self.leGusta(carpa.marcaDeCervezaQueVende()) and carpa.tieneUnaBandaDeMusica()
	}
	
	method puedeEntrarA(carpa) 
	{
		return self.quiereEntrarA(carpa) and carpa.dejaIngresarA(self)
	}
}

class Checo inherits Persona 
{
	method leGusta(marcaDeCerveza) 
	{
		return marcaDeCerveza.graduacion() > 0.08
	}
	
	method quiereEntrarA(carpa) 
	{
		return self.leGusta(carpa.marcaDeCervezaQueVende()) and carpa.tieneUnaBandaDeMusica()
	}
	
	method puedeEntrarA(carpa) 
	{
		return self.quiereEntrarA(carpa) and carpa.dejaIngresarA(self)
	}
}

class Aleman inherits Persona 
{
	method leGusta(marcaDeCerveza) 
	{
		return marcaDeCerveza.graduacion() >= 0 and marcaDeCerveza.contenidoLupulo() >= 0
	}
	
	method quiereEntrarA(carpa) 
	{
		return self.leGusta(carpa.marcaDeCervezaQueVende()) and 
		carpa.tieneUnaBandaDeMusica() and not carpa.estaVacia()
	}
	
	method puedeEntrarA(carpa) 
	{
		return self.quiereEntrarA(carpa) and carpa.dejaIngresarA(self)
	}
}
