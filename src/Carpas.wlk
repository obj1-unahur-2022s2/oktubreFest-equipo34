import Personas.*
import Marcas.*


class Carpa{
	const property limiteDeGente
	var property hayMusicaTradicional
	const property marcaDeCerveza
	var property personasDentro=[]
	
	method quiereEntrar(unaPersona){
		return unaPersona.esDeSuAgrado(marcaDeCerveza) and
		self.estaAGustoConLaMusica(unaPersona) and personasDentro.size()/2==0
	}
	method estaAGustoConLaMusica(unaPersona){
		return (hayMusicaTradicional and unaPersona.escuchaMusicaTradicional()) or
		not hayMusicaTradicional and not unaPersona.escuchaMusicaTradicional()
	}
	method dejarPasar(unaPersona){
		return personasDentro.size()+1>=limiteDeGente and not unaPersona.estaEbria()
	}		
	method puedeEntrar(unaPersona){
		return self.quiereEntrar(unaPersona)and self.dejarPasar(unaPersona)
	}
	method ingresarALaCarpa(unaPersona){
		if (self.puedeEntrar(unaPersona)){
			personasDentro.add(unaPersona)
		}
		else{
			self.error("no puede ingresar a la carpa!")
		}
	}
	method servirJarra(unaPersona,unaCapacidad){
		const jarra1 = new Jarra(litros=unaCapacidad, marca=marcaDeCerveza)
		unaPersona.add(jarra1)
	}
	method cantEbriosEmpedernidos(){
		personasDentro.count({p=>p.estaEbria() and p.sonTodasDeUnLitroOMas()})
	}
	method esHomogenea(unaNacionalidad){
		return personasDentro.all({p=>p.nacionalidad()==unaNacionalidad})
	}
	method noSeLeSirvioCerveza(unaPersona){
		return unaPersona.jarrasCompradas().any({j=>j.marca()==marcaDeCerveza})
	}
}
