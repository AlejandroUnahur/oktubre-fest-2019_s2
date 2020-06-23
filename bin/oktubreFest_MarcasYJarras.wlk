class MarcaDeCerveza 
{
	var property contenidoLupulo= 0
	var property paisDeOrigen = ""
	var property graduacion  = 0
}

class CervezaRubia inherits MarcaDeCerveza 
{
	
}

class CervezaNegra inherits MarcaDeCerveza 
{
	var property graduacionReglamentaria = 0
	
	override method graduacion() 
	{
	  return if (graduacionReglamentaria < contenidoLupulo * 2) {graduacionReglamentaria} else {contenidoLupulo} 
	}
}

class CervezaRoja inherits CervezaNegra 
{
	override method graduacion() 
	{
		return super() * 1.25
	}
}


class Jarra 
{
	var property capacidadLitros = 0
	var property marca 
	var property enQueCarpaSeSirvio = null
	
	method contenidoDeAlcohol() 
	{
		return self.capacidadLitros() * marca.graduacion()
	}
	
}
