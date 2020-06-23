import oktubreFest_MarcasYJarras.*
import oktubrefest_Personas.*

class Carpas 
{
	var property limiteDeGenteAdmitida = 0
	var property tieneUnaBandaDeMusica
	var property marcaDeCervezaQueVende
	const property personasEnCarpa = []
	
	method hayMusica() 
	{
		tieneUnaBandaDeMusica = true 
	}
	
	method estaVacia() 
	{
		return personasEnCarpa.isEmpty()
	} 
	
	method dejaIngresarA(persona) 
	{
		return not persona.estaEbria() and personasEnCarpa.size() + 1 < self.limiteDeGenteAdmitida()
	}
	
	method hacerEntrarA(persona) 
	{
		if (persona.puedeEntrarA(self)) 
		{
			personasEnCarpa.add(persona)
		}
		else 
		{
			throw "No podes entrar"
		}
	}
	
	method estaEnCarpa(persona) 
	{
		return personasEnCarpa.contains(persona)
	}
	
	method servirJarraA(persona,capacidad) 
	{
		if (self.estaEnCarpa(persona)) 
		{
			const jarraDeCerveza = new Jarra(marca = marcaDeCervezaQueVende, capacidadLitros = capacidad)
			persona.comprar(jarraDeCerveza)
		}
		else 
		{
			throw "Esta persona no esta en la carpa"
		}
	}
	
	method cuantosEbriosEmpedernidosHay() 
	{
		return personasEnCarpa.count({personaEnCarpa => personaEnCarpa.esEmpedernida()})	
	}
	
}
