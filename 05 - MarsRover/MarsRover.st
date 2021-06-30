!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'testMoverDesdeNorte' stamp: 'a 6/29/2021 23:11:53'!
test01MarsRoverSeMueveUnPuntoHaciaAdelanteCuandoRecibeF

	self chequearMarsRoverSeEncuentraEn: (0@1) luegoDeMoverseHaciaAdelanteEmpezandoDesdePosicion: (0@0) yCardinal: 'N'! !

!MarsRoverTest methodsFor: 'testMoverDesdeNorte' stamp: 'a 6/29/2021 23:13:59'!
test02MarsRoverSeMueveUnPuntoHaciaAtrasCuandoRecibeB
	
	self chequearMarsRoverSeEncuentraEn: (0@-1) luegoDeMoverseHaciaAtrasEmpezandoDesdePosicion: (0@0) yCardinal: 'N' ! !

!MarsRoverTest methodsFor: 'testMoverDesdeNorte' stamp: 'a 6/29/2021 23:41:06'!
test03MarsRoverCambiaSuDireccionCuandoRecibeL
	
	self chequearMarsRoverSeEncuentraMirandoHacia: 'O' luegoDeGirarHaciaIzquierdaEmpezandoDesdeCardinal: 'N'! !

!MarsRoverTest methodsFor: 'testMoverDesdeNorte' stamp: 'a 6/29/2021 23:41:20'!
test04MarsRoverCambiaSuDireccionCuandoRecibeR
	
	self chequearMarsRoverSeEncuentraMirandoHacia: 'E' luegoDeGirarHaciaDerechaEmpezandoDesdeCardinal: 'N'! !


!MarsRoverTest methodsFor: 'testMoverDesdeEste' stamp: 'a 6/29/2021 23:17:23'!
test07MarsRoverSeMueveHaciaElEsteCuandoRecibeFEmpezandoDelEste
	
	self chequearMarsRoverSeEncuentraEn: (1@0) luegoDeMoverseHaciaAdelanteEmpezandoDesdePosicion: (0@0) yCardinal: 'E' ! !

!MarsRoverTest methodsFor: 'testMoverDesdeEste' stamp: 'a 6/29/2021 23:41:30'!
test08MarsRoverCambiaSuDireccionHaciaSurCuandoRecibeREmpezandoDelEste
	
	self chequearMarsRoverSeEncuentraMirandoHacia: 'S' luegoDeGirarHaciaDerechaEmpezandoDesdeCardinal: 'E'! !

!MarsRoverTest methodsFor: 'testMoverDesdeEste' stamp: 'a 6/29/2021 23:41:37'!
test09MarsRoverCambiaSuDireccionAlNorteCuandoRecibeLEmpezandoDelEste
	
	self chequearMarsRoverSeEncuentraMirandoHacia: 'N' luegoDeGirarHaciaIzquierdaEmpezandoDesdeCardinal: 'E'! !

!MarsRoverTest methodsFor: 'testMoverDesdeEste' stamp: 'a 6/29/2021 23:18:30'!
test10MarsRoverSeMueveHaciaOesteCuandoRecibeBEmpezandoDelEste
	
	self chequearMarsRoverSeEncuentraEn: (-1@0) luegoDeMoverseHaciaAtrasEmpezandoDesdePosicion: (0@0) yCardinal: 'E' ! !


!MarsRoverTest methodsFor: 'testConMultiplesComandos' stamp: 'a 6/29/2021 23:22:02'!
test19MarsRoverSeMueveDosPosicionesHaciaAdelanteCuandoRecibeFF
	
	self chequearMarsRoverSeEncuentraEn: (0@2) luegoDeRecibir: 'ff' empezandoDesdePosicion: (0@0) yCardinal: 'N'! !


!MarsRoverTest methodsFor: 'testMoverDesdeOeste' stamp: 'a 6/29/2021 23:41:48'!
test15MarsRoverCambiaSuDireccionHaciaSurCuandoRecibeLEmpezandoDelOeste
	
	self chequearMarsRoverSeEncuentraMirandoHacia: 'S' luegoDeGirarHaciaIzquierdaEmpezandoDesdeCardinal: 'O'! !

!MarsRoverTest methodsFor: 'testMoverDesdeOeste' stamp: 'a 6/29/2021 23:19:26'!
test16MarsRoverSeMueveHaciaElOesteCuandoRecibeFEmpezandoDelOeste
	
	self chequearMarsRoverSeEncuentraEn: (-1@0) luegoDeMoverseHaciaAdelanteEmpezandoDesdePosicion: (0@0) yCardinal: 'O'! !

!MarsRoverTest methodsFor: 'testMoverDesdeOeste' stamp: 'a 6/29/2021 23:19:59'!
test17MarsRoverSeMueveHaciaElEsteCuandoRecibeBEmpezandoDelOeste
	
	self chequearMarsRoverSeEncuentraEn: (1@0) luegoDeMoverseHaciaAtrasEmpezandoDesdePosicion: (0@0) yCardinal: 'O' ! !

!MarsRoverTest methodsFor: 'testMoverDesdeOeste' stamp: 'a 6/29/2021 23:41:56'!
test18MarsRoverCambiaSuDireccionHaciaNorteCuandoRecibeREmpezandoDelOeste
	
	self chequearMarsRoverSeEncuentraMirandoHacia: 'N' luegoDeGirarHaciaDerechaEmpezandoDesdeCardinal: 'O'! !


!MarsRoverTest methodsFor: 'testMoverDesdeSur' stamp: 'a 6/29/2021 23:20:42'!
test11MarsRoverSeMueveHaciaElSurCuandoRecibeFEmpezadondoDelSur
	
	self chequearMarsRoverSeEncuentraEn: (0@-1) luegoDeMoverseHaciaAdelanteEmpezandoDesdePosicion: (0@0) yCardinal: 'S'! !

!MarsRoverTest methodsFor: 'testMoverDesdeSur' stamp: 'a 6/29/2021 23:21:14'!
test12MarsRoverSeMueveHaciaElNorteCuandoRecibeBEmpezandoDelSur
	
	self chequearMarsRoverSeEncuentraEn: (0@1) luegoDeMoverseHaciaAtrasEmpezandoDesdePosicion: (0@0) yCardinal: 'S'! !

!MarsRoverTest methodsFor: 'testMoverDesdeSur' stamp: 'a 6/29/2021 23:43:01'!
test13MarsRoverCambiaSuDireccionHaciaElOesteCuandoRecibeREmpezandoDelSur
	
	self chequearMarsRoverSeEncuentraMirandoHacia: 'O' luegoDeGirarHaciaDerechaEmpezandoDesdeCardinal: 'S'! !

!MarsRoverTest methodsFor: 'testMoverDesdeSur' stamp: 'a 6/29/2021 23:43:34'!
test14MarsRoverCambiaSuDireccionHaciaElEsteCuandoRecibeLEmpezandoDelSur
	
	self chequearMarsRoverSeEncuentraMirandoHacia: 'E' luegoDeGirarHaciaIzquierdaEmpezandoDesdeCardinal: 'S'! !


!MarsRoverTest methodsFor: 'testMoverDesdePuntosDistintos' stamp: 'a 6/29/2021 23:15:24'!
test05MarsRoverSeMueveCorrectamenteHaciaAdelanteEmpezandoPorPosicionDistintoAl00
	
	self chequearMarsRoverSeEncuentraEn: (1@1) luegoDeMoverseHaciaAdelanteEmpezandoDesdePosicion: (1@0) yCardinal: 'N'! !

!MarsRoverTest methodsFor: 'testMoverDesdePuntosDistintos' stamp: 'a 6/29/2021 23:16:07'!
test06MarsRoverSeMueveCorrectamenteHaciaAtrasEmpezandoPorPosicionDistintoAl00
	
	self chequearMarsRoverSeEncuentraEn: (1@-1) luegoDeMoverseHaciaAtrasEmpezandoDesdePosicion: (1@0) yCardinal: 'N'! !


!MarsRoverTest methodsFor: 'testComandosErroneos' stamp: 'a 6/29/2021 23:22:24'!
test20MarsRoverNoDebeEjecutarDespuesDeComandoInvalido
	| unMarsRover |
	
	unMarsRover := MarsRover enPosicion: (0@0) conCardinal: 'N'.
	unMarsRover recibirComando: 'fpf'.
	
	self assert: (unMarsRover estaEnPosicion: (0@1)).! !


!MarsRoverTest methodsFor: 'private' stamp: 'a 6/29/2021 23:12:39'!
chequearMarsRoverSeEncuentraEn: posicionFinalEsperada luegoDeMoverseHaciaAdelanteEmpezandoDesdePosicion: posicionInicial yCardinal: unCardinal
	
	self chequearMarsRoverSeEncuentraEn: posicionFinalEsperada luegoDeRecibir: 'f' empezandoDesdePosicion: posicionInicial yCardinal: unCardinal! !

!MarsRoverTest methodsFor: 'private' stamp: 'a 6/29/2021 23:12:52'!
chequearMarsRoverSeEncuentraEn: posicionFinalEsperada luegoDeMoverseHaciaAtrasEmpezandoDesdePosicion: posicionInicial yCardinal: unCardinal
	
	self chequearMarsRoverSeEncuentraEn: posicionFinalEsperada luegoDeRecibir: 'b' empezandoDesdePosicion: posicionInicial yCardinal: unCardinal! !

!MarsRoverTest methodsFor: 'private' stamp: 'a 6/29/2021 23:48:13'!
chequearMarsRoverSeEncuentraEn: posicionFinalEsperada luegoDeRecibir: unaSerieDeComandos empezandoDesdePosicion: posicionInicial yCardinal: unCardinal
	| unMarsRover |
	
	unMarsRover := self crearMarsRoverEnPosicion: posicionInicial yCardinal: unCardinal recibiendoComandos: unaSerieDeComandos.
	
	self assert: (unMarsRover estaEnPosicion: posicionFinalEsperada).! !

!MarsRoverTest methodsFor: 'private' stamp: 'a 6/29/2021 23:40:50'!
chequearMarsRoverSeEncuentraMirandoHacia: unPuntoCardinalEsperado luegoDeGirarHaciaDerechaEmpezandoDesdeCardinal: unCardinal
	
	self chequearMarsRoverSeEncuentraMirandoHacia: unPuntoCardinalEsperado luegoDeRecibir: 'r' empezandoDesdeCardinal: unCardinal! !

!MarsRoverTest methodsFor: 'private' stamp: 'a 6/29/2021 23:40:32'!
chequearMarsRoverSeEncuentraMirandoHacia: unPuntoCardinalEsperado luegoDeGirarHaciaIzquierdaEmpezandoDesdeCardinal: unCardinal
	
	self chequearMarsRoverSeEncuentraMirandoHacia: unPuntoCardinalEsperado luegoDeRecibir: 'l' empezandoDesdeCardinal: unCardinal! !

!MarsRoverTest methodsFor: 'private' stamp: 'a 6/29/2021 23:49:42'!
chequearMarsRoverSeEncuentraMirandoHacia: unPuntoCardinalEsperado luegoDeRecibir: unaSerieDeComandos empezandoDesdeCardinal: unCardinal
	| unMarsRover |
	
	unMarsRover := self crearMarsRoverEnPosicion: (0@0) yCardinal: unCardinal recibiendoComandos: unaSerieDeComandos.
	
	self assert: (unMarsRover estaMirandoHacia: unPuntoCardinalEsperado)! !

!MarsRoverTest methodsFor: 'private' stamp: 'a 6/29/2021 23:51:27'!
crearMarsRoverEnPosicion: unaPosicionInicial yCardinal: unCardinal recibiendoComandos: unaSerieDeComandos
	| unMarsRover |
	
	unMarsRover := MarsRover enPosicion: unaPosicionInicial conCardinal: unCardinal.
	unMarsRover recibirComando: unaSerieDeComandos.
	
	^unMarsRover ! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion cardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'acciones' stamp: 'a 6/29/2021 23:54:32'!
recibirComando: unaSerieDeComandos
	
	unaSerieDeComandos do: [ :unComando | self realizarMovimientoAPartirDelComando: unComando]! !


!MarsRover methodsFor: 'inicializacion' stamp: 'a 6/27/2021 21:54:15'!
inicializarEnPosicion: unPunto conCardinal: unCardinal
	| unPuntoCardinal |
	
	unPuntoCardinal := PuntoCardinal con: unCardinal.
	posicion := unPunto.
	cardinal := unPuntoCardinal! !


!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 21:57:13'!
direccionFrontalDesdeEste

	^(1@0)! !

!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 21:56:44'!
direccionFrontalDesdeNorte

	^(0@1)! !

!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 21:57:21'!
direccionFrontalDesdeOeste

	^(-1@0)! !

!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 21:57:01'!
direccionFrontalDesdeSur

	^(0@-1)! !

!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 22:49:03'!
girarHaciaDerechaDesdeEste

	^Sur new! !

!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 22:48:15'!
girarHaciaDerechaDesdeNorte

	^Este new! !

!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 22:51:21'!
girarHaciaDerechaDesdeOeste

	^Norte new! !

!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 22:48:43'!
girarHaciaDerechaDesdeSur

	^Oeste new! !

!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 22:53:26'!
girarHaciaIzquierdaDesdeEste

	^Norte new! !

!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 22:53:43'!
girarHaciaIzquierdaDesdeNorte

	^Oeste new! !

!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 22:53:55'!
girarHaciaIzquierdaDesdeOeste

	^Sur new! !

!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 22:54:07'!
girarHaciaIzquierdaDesdeSur

	^Este new! !

!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 22:22:10'!
mover: unPuntoHaciaUnaDireccion

	posicion := posicion + unPuntoHaciaUnaDireccion! !

!MarsRover methodsFor: 'private' stamp: 'a 6/29/2021 23:54:20'!
realizarMovimientoAPartirDelComando: unComando
	| direccionAMover |

	(unComando = $f) ifTrue: [
		direccionAMover := cardinal determinarDireccionFrontalDe: self.
		self mover: direccionAMover].
	(unComando = $b) ifTrue: [
		direccionAMover := (cardinal determinarDireccionFrontalDe: self) * -1.
		self mover: direccionAMover].
	(unComando = $l) ifTrue: [
		cardinal := cardinal determinarCambioDeCardinalAIzquierdaDe: self].
	(unComando = $r) ifTrue: [
		cardinal := cardinal determinarCambioDeCardinalADerechaDe: self].
	(unComando = $f or: unComando = $b or: unComando = $l or: unComando = $r) ifFalse: [].! !


!MarsRover methodsFor: 'testing' stamp: 'a 6/29/2021 22:21:08'!
estaEnPosicion: unPunto

	^ unPunto = posicion! !

!MarsRover methodsFor: 'testing' stamp: 'a 6/29/2021 22:58:09'!
estaMirandoHacia: unPuntoCardinal

	^unPuntoCardinal = cardinal letraRepesentante! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'a 6/27/2021 19:53:44'!
enPosicion: unPunto conCardinal: unCardinal

	^self new inicializarEnPosicion: unPunto conCardinal: unCardinal ! !


!classDefinition: #PuntoCardinal category: 'MarsRover'!
Object subclass: #PuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:56:47'!
determinarCambioDeCardinalADerechaDe: unMarsRover

	self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:56:38'!
determinarCambioDeCardinalAIzquierdaDe: unMarsRover

	self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 21:58:16'!
determinarDireccionFrontalDe: unMarsRover

	self subclassResponsibility ! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:33:29'!
letraRepesentante

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuntoCardinal class' category: 'MarsRover'!
PuntoCardinal class
	instanceVariableNames: ''!

!PuntoCardinal class methodsFor: 'as yet unclassified' stamp: 'a 6/27/2021 21:52:21'!
canHandle: unCardinal

	self subclassResponsibility ! !

!PuntoCardinal class methodsFor: 'as yet unclassified' stamp: 'a 6/27/2021 21:51:54'!
con: unCardinal

	^(PuntoCardinal allSubclasses detect:[:aClass | aClass canHandle: unCardinal]) new.! !


!classDefinition: #Este category: 'MarsRover'!
PuntoCardinal subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:49:57'!
determinarCambioDeCardinalADerechaDe: unMarsRover

	^unMarsRover girarHaciaDerechaDesdeEste! !

!Este methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:55:52'!
determinarCambioDeCardinalAIzquierdaDe: unMarsRover

	^unMarsRover girarHaciaIzquierdaDesdeEste! !

!Este methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 21:59:46'!
determinarDireccionFrontalDe: unMarsRover

	^unMarsRover direccionFrontalDesdeEste! !

!Este methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:34:01'!
letraRepesentante

	^'E'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Este class' category: 'MarsRover'!
Este class
	instanceVariableNames: ''!

!Este class methodsFor: 'as yet unclassified' stamp: 'a 6/27/2021 21:53:07'!
canHandle: unCardinal

	^unCardinal = 'E'! !


!classDefinition: #Norte category: 'MarsRover'!
PuntoCardinal subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:50:15'!
determinarCambioDeCardinalADerechaDe: unMarsRover

	^unMarsRover girarHaciaDerechaDesdeNorte! !

!Norte methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:56:07'!
determinarCambioDeCardinalAIzquierdaDe: unMarsRover

	^unMarsRover girarHaciaIzquierdaDesdeNorte! !

!Norte methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:00:27'!
determinarDireccionFrontalDe: unMarsRover

	^unMarsRover direccionFrontalDesdeNorte ! !

!Norte methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:34:11'!
letraRepesentante

	^'N'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Norte class' category: 'MarsRover'!
Norte class
	instanceVariableNames: ''!

!Norte class methodsFor: 'as yet unclassified' stamp: 'a 6/27/2021 21:53:20'!
canHandle: unCardinal

	^unCardinal = 'N'! !


!classDefinition: #Oeste category: 'MarsRover'!
PuntoCardinal subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:51:32'!
determinarCambioDeCardinalADerechaDe: unMarsRover

	^unMarsRover girarHaciaDerechaDesdeOeste! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:56:15'!
determinarCambioDeCardinalAIzquierdaDe: unMarsRover

	^unMarsRover girarHaciaIzquierdaDesdeOeste! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:00:54'!
determinarDireccionFrontalDe: unMarsRover

	^unMarsRover direccionFrontalDesdeOeste ! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:34:16'!
letraRepesentante

	^'O'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oeste class' category: 'MarsRover'!
Oeste class
	instanceVariableNames: ''!

!Oeste class methodsFor: 'as yet unclassified' stamp: 'a 6/27/2021 21:53:30'!
canHandle: unCardinal

	^unCardinal = 'O'! !


!classDefinition: #Sur category: 'MarsRover'!
PuntoCardinal subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:50:57'!
determinarCambioDeCardinalADerechaDe: unMarsRover

	^unMarsRover girarHaciaDerechaDesdeSur! !

!Sur methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:56:23'!
determinarCambioDeCardinalAIzquierdaDe: unMarsRover

	^unMarsRover girarHaciaIzquierdaDesdeSur! !

!Sur methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:01:08'!
determinarDireccionFrontalDe: unMarsRover

	^unMarsRover direccionFrontalDesdeSur! !

!Sur methodsFor: 'as yet unclassified' stamp: 'a 6/29/2021 22:34:22'!
letraRepesentante

	^'S'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sur class' category: 'MarsRover'!
Sur class
	instanceVariableNames: ''!

!Sur class methodsFor: 'as yet unclassified' stamp: 'a 6/27/2021 21:53:38'!
canHandle: unCardinal

	^unCardinal = 'S'! !
