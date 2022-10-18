class Jarra{
	const property litros
	const property marca
	var property cantAlcoholxLitro =0
	var property carpa=""

}

class Marca{
	var property contenidoDeLupulo
	const property paisDeOrigen
	const property nombreMarca
    var property cantAlcoholxLitro
	var property graduacionReglam=5
	
}

class CervezaRubia inherits Marca{
	
	method graduacionAlcoholica(){
		return 100*cantAlcoholxLitro
	}	
}

class CervezaNegra inherits Marca{
	
	method graduacionAlcoholica(){
		return graduacionReglam.min(contenidoDeLupulo)
	}
}

class CervezaRoja inherits CervezaNegra{
	override method graduacionAlcoholica(){
		return super()*1.25
	}
}

