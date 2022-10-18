
class Persona{
	var property peso
	var property jarrasCompradas= []
	var property nivelDeAguante
	var property escuchaMusicaTradicional


	
	method estaEbria(){
		return (jarrasCompradas.sum({j=>j.marca().cantAlcoholxLitro()})*peso)>nivelDeAguante
	}
	method sonTodasDeUnLitroOMas(){
		jarrasCompradas.all({j=>j.litros()>=1})
	}
	
	
	method marcasCompradas() = 
		jarrasCompradas.map({j => j.marca()}).asSet()
		
	method marcasEnComun(unaPersona) = 
		(self.marcasCompradas().intersection(unaPersona.marcasCompradas())).size()
	
	method marcasDiferentes(unaPersona) = 
		(self.marcasCompradas().union(unaPersona.marcasCompradas())).difference(self.marcasCompradas()).size()
	
	
	method esCompatibleCon(unaPersona) =
		self.marcasEnComun(unaPersona) > self.marcasDiferentes(unaPersona)
		
	
	method enQueCarpasLeSirvieronCerv(){
return jarrasCompradas.map({j => j.carpa()}).asSet()
	}
	
	method ultimaJarraComprada() {return jarrasCompradas.last()}
	
	 method estaEntrandoEnVicio(){
  	   return jarrasCompradas.all({j => j.litros()<= self.ultimaJarraComprada().litros()})
  	    }
	
}

class Belga inherits Persona{
	const property nacionalidad= "Belga"
	method esDeSuAgrado(unaCerveza){
		return unaCerveza.contenidoDeLupulo()>4
	}
	method esPatriota(){
		jarrasCompradas.all({j=>j.marca().paisDeOrigen()==nacionalidad})
	}
}

class Checo inherits Persona{
	const property nacionalidad="Checo"
	method esDeSuAgrado(unaCerveza){
		return unaCerveza.gradAlcoholica()>8
	}
	method esPatriota(){
		jarrasCompradas.all({j=>j.marca().paisDeOrigen()==nacionalidad})
	}
}
class Aleman inherits Persona{
	const property nacionalidad="Aleman"
	method esDeSuAgrado(unaCerveza)=true
	method esPatriota(){
		jarrasCompradas.all({j=>j.marca().paisDeOrigen()==nacionalidad})
	}
}



