!classDefinition: #MarsRoverObserverTest category: 'MarsRover-Solucion2'!
TestCase subclass: #MarsRoverObserverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion2'!

!MarsRoverObserverTest methodsFor: 'log tests' stamp: 'a 7/22/2021 16:30:29'!
test01PositionLogIsAnEmptyCollectionWhenMarsRoverDoesNotMove
	| log |
	
	log := self createPositionLogForMarsRoverWhichReceivesCommands: ''.
	
	self assert: log showEntries = OrderedCollection new.! !

!MarsRoverObserverTest methodsFor: 'log tests' stamp: 'a 7/22/2021 16:30:33'!
test02PositionLogReturnsNewPositionWhenMarsRoverDoesAMovement
	| log expectedCollection |
	
	log := self createPositionLogForMarsRoverWhichReceivesCommands: 'f'.
	
	expectedCollection := OrderedCollection new.
	expectedCollection add: (0@1).
	
	self assert: log showEntries = expectedCollection.! !

!MarsRoverObserverTest methodsFor: 'log tests' stamp: 'a 7/22/2021 16:30:38'!
test03PositionLogReturnsTheHistoryOfPositionsWhenMarsRoverMakesMultipleMovements
	| log expectedCollection |
	
	log := self createPositionLogForMarsRoverWhichReceivesCommands: 'ff'.
	
	expectedCollection := OrderedCollection new.
	expectedCollection add: (0@1).
	expectedCollection add: (0@2).
	
	self assert: log showEntries = expectedCollection.! !

!MarsRoverObserverTest methodsFor: 'log tests' stamp: 'a 7/22/2021 16:29:29'!
test04HeadingLogIsAnEmptyCollectionWhenMarsRoverDoesNotRotate
	| log |
	
	log := self createHeadingLogForMarsRoverWhichReceivesCommands: ''.
	
	self assert: log showEntries = OrderedCollection new.! !

!MarsRoverObserverTest methodsFor: 'log tests' stamp: 'a 7/22/2021 16:29:34'!
test05HeadingLogReturnsNewCardinalWhenMarsRoverRotates
	| log expectedCollection |
	
	log := self createHeadingLogForMarsRoverWhichReceivesCommands: 'r'.
	
	expectedCollection := OrderedCollection new.
	expectedCollection add: ('East').
	
	self assert: log showEntries = expectedCollection.! !

!MarsRoverObserverTest methodsFor: 'log tests' stamp: 'a 7/22/2021 16:29:39'!
test06HeadingLogReturnsTheHistoryOfHeadingsWhenMarsRoverMakesMultipleRotations
	| log expectedCollection |
	
	log := self createHeadingLogForMarsRoverWhichReceivesCommands: 'rr'.
	
	expectedCollection := OrderedCollection new.
	expectedCollection add: ('East').
	expectedCollection add: ('South').
	
	self assert: log showEntries = expectedCollection.! !

!MarsRoverObserverTest methodsFor: 'log tests' stamp: 'a 7/22/2021 10:51:07'!
test07PositionAndHeadingLogAddsNewCardinalAndNewPositionWhenMarsRoverRotatesAndMoves
	| marsRover log expectedCollection |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	log := MarsRoverLog new.
	marsRover addPositionObserver: log.
	marsRover addHeadObserver: log.
	
	marsRover processCommands: 'rf'.
	
	expectedCollection := OrderedCollection new.
	expectedCollection add: 'East'.
	expectedCollection add: (1@0).
	
	self assert: log showEntries = expectedCollection.! !


!MarsRoverObserverTest methodsFor: 'window tests' stamp: 'a 7/22/2021 10:53:18'!
test08PositionWindowUpdatesItsPositionWhenMarsRoverDoesAMovement
	| marsRover window |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	window := MarsRoverWindowStatus new.
	marsRover addPositionObserver: window.
	
	marsRover processCommands: 'f'.
	
	self assert: (window showMarsRoverCurrentPosition = (0@1)).! !

!MarsRoverObserverTest methodsFor: 'window tests' stamp: 'a 7/22/2021 10:58:05'!
test09HeadingWindowUpdatesItsCardinalWhenMarsRoverRotates
	| marsRover window |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	window := MarsRoverWindowStatus new.
	marsRover addHeadObserver: window.
	
	marsRover processCommands: 'r'.
	
	self assert: (window showMarsRoverCurrentHeading = #East).! !

!MarsRoverObserverTest methodsFor: 'window tests' stamp: 'a 7/22/2021 11:00:16'!
test10PositionAndHeadingWindowUpdatesItsPositionAndCardinalWhenMarsRoverMovesAndRotates
	| marsRover window |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	window := MarsRoverWindowStatus new.
	marsRover addHeadObserver: window.
	marsRover addPositionObserver: window.
	
	marsRover processCommands: 'rf'.
	
	self assert: (window showMarsRoverCurrentHeading = #East).
	self assert: (window showMarsRoverCurrentPosition = (1@0)).! !


!MarsRoverObserverTest methodsFor: 'private' stamp: 'a 7/22/2021 16:29:06'!
createHeadingLogForMarsRoverWhichReceivesCommands: aStringOfCommands
	| marsRover log |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	log := MarsRoverLog new.
	marsRover addHeadObserver: log.
	
	marsRover processCommands: aStringOfCommands.
	
	^log! !

!MarsRoverObserverTest methodsFor: 'private' stamp: 'a 7/22/2021 16:30:10'!
createPositionLogForMarsRoverWhichReceivesCommands: aStringOfCommands
	| marsRover log |
	
	marsRover := MarsRover startingAt: (0@0) heading: #North.
	log := MarsRoverLog new.
	marsRover addPositionObserver: log.
	
	marsRover processCommands: aStringOfCommands.
	
	^log! !


!classDefinition: #TestMarsRover category: 'MarsRover-Solucion2'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion2'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion2'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head observerProxy'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion2'!

!MarsRover methodsFor: 'initialization' stamp: 'a 7/22/2021 16:20:21'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	observerProxy := MarsRoverObserverProxy new.
	! !


!MarsRover methodsFor: 'process commands' stamp: 'a 7/19/2021 21:40:40'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
! !


!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 19:48:47'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'a 7/22/2021 02:10:10'!
changePosition: aPositionChange

	position := position + aPositionChange.
	self positionChanged.! !

!MarsRover methodsFor: 'dd - moving' stamp: 'a 7/22/2021 02:07:21'!
moveDown

	self changePosition: (0@-1).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'a 7/19/2021 21:36:52'!
moveLeft

	self changePosition: (-1@0)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'a 7/19/2021 21:36:58'!
moveRight

	self changePosition: (1@0)! !

!MarsRover methodsFor: 'dd - moving' stamp: 'a 7/19/2021 21:37:04'!
moveUp

	self changePosition: (0@1)! !


!MarsRover methodsFor: 'dd - heading' stamp: 'a 7/22/2021 02:11:04'!
headEast

	head := MarsRoverHeadFacingEast of: self.
	self headingChanged.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'a 7/22/2021 02:11:37'!
headNorth

	head := MarsRoverHeadFacingNorth of: self.
	self headingChanged.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'a 7/22/2021 02:11:45'!
headSouth

	head := MarsRoverHeadFacingSouth of: self.
	self headingChanged.! !

!MarsRover methodsFor: 'dd - heading' stamp: 'a 7/22/2021 02:11:50'!
headWest

	head := MarsRoverHeadFacingWest of: self.
	self headingChanged.! !


!MarsRover methodsFor: 'observer methods' stamp: 'a 7/22/2021 16:15:23'!
addHeadObserver: aHeadObserver

	aHeadObserver headingPermissionSwitch: true.
	observerProxy addObserver: aHeadObserver.! !

!MarsRover methodsFor: 'observer methods' stamp: 'a 7/22/2021 16:15:31'!
addPositionObserver: aPositionObserver

	aPositionObserver positionPermissionSwitch: true.
	observerProxy addObserver: aPositionObserver.! !

!MarsRover methodsFor: 'observer methods' stamp: 'a 7/22/2021 16:15:40'!
headingChanged

	observerProxy updateWithAMarsRoverHeading: head.! !

!MarsRover methodsFor: 'observer methods' stamp: 'a 7/22/2021 16:15:50'!
positionChanged

	observerProxy updateWithAMarsRoverPosition: position.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Solucion2'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-Solucion2'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion2'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-Solucion2'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-Solucion2'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion2'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'a 7/22/2021 12:26:41'!
textFieldFor: anObserver

	^anObserver headingTextFieldForEast! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-Solucion2'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-Solucion2'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion2'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'a 7/22/2021 12:27:04'!
textFieldFor: anObserver

	^anObserver headingTextFieldForNorth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-Solucion2'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-Solucion2'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion2'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'a 7/22/2021 12:27:13'!
textFieldFor: anObserver

	^anObserver headingTextFieldForSouth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-Solucion2'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-Solucion2'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion2'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'a 7/22/2021 12:27:26'!
textFieldFor: anObserver

	^anObserver headingTextFieldForWest! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-Solucion2'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverObserver category: 'MarsRover-Solucion2'!
Object subclass: #MarsRoverObserver
	instanceVariableNames: 'headingAccess positionAccess'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion2'!

!MarsRoverObserver methodsFor: 'updating' stamp: 'a 7/22/2021 12:17:12'!
updateWithAMarsRoverHeading: aHeading

	self subclassResponsibility ! !

!MarsRoverObserver methodsFor: 'updating' stamp: 'a 7/22/2021 11:05:02'!
updateWithAMarsRoverPosition: aPosition

	self subclassResponsibility ! !


!MarsRoverObserver methodsFor: 'heading textfield' stamp: 'a 7/22/2021 12:32:53'!
headingTextFieldForEast

	self subclassResponsibility ! !

!MarsRoverObserver methodsFor: 'heading textfield' stamp: 'a 7/22/2021 12:32:59'!
headingTextFieldForNorth

	self subclassResponsibility ! !

!MarsRoverObserver methodsFor: 'heading textfield' stamp: 'a 7/22/2021 12:33:06'!
headingTextFieldForSouth

	self subclassResponsibility ! !

!MarsRoverObserver methodsFor: 'heading textfield' stamp: 'a 7/22/2021 12:33:10'!
headingTextFieldForWest

	self subclassResponsibility ! !


!MarsRoverObserver methodsFor: 'permissions' stamp: 'a 7/22/2021 16:10:44'!
hasHeadingPermission

	^headingAccess! !

!MarsRoverObserver methodsFor: 'permissions' stamp: 'a 7/22/2021 16:11:04'!
hasPositionPermission

	^positionAccess! !

!MarsRoverObserver methodsFor: 'permissions' stamp: 'a 7/22/2021 16:11:20'!
headingPermissionSwitch: aBoolean

	headingAccess := aBoolean! !

!MarsRoverObserver methodsFor: 'permissions' stamp: 'a 7/22/2021 16:11:34'!
positionPermissionSwitch: aBoolean

	positionAccess := aBoolean! !


!classDefinition: #MarsRoverLog category: 'MarsRover-Solucion2'!
MarsRoverObserver subclass: #MarsRoverLog
	instanceVariableNames: 'entries'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion2'!

!MarsRoverLog methodsFor: 'initialization' stamp: 'a 7/22/2021 15:06:18'!
initialize

	entries := OrderedCollection new.
	positionAccess := false.
	headingAccess := false.! !


!MarsRoverLog methodsFor: 'printing' stamp: 'a 7/22/2021 12:53:15'!
showEntries

	^entries! !


!MarsRoverLog methodsFor: 'updating' stamp: 'a 7/22/2021 12:28:28'!
updateWithAMarsRoverHeading: aHeading

	entries add: (aHeading textFieldFor: self).! !

!MarsRoverLog methodsFor: 'updating' stamp: 'a 7/22/2021 02:35:21'!
updateWithAMarsRoverPosition: aPosition

	entries add: aPosition.! !


!MarsRoverLog methodsFor: 'heading textfield' stamp: 'a 7/22/2021 12:21:51'!
headingTextFieldForEast

	^'East'! !

!MarsRoverLog methodsFor: 'heading textfield' stamp: 'a 7/22/2021 12:22:07'!
headingTextFieldForNorth

	^'North'! !

!MarsRoverLog methodsFor: 'heading textfield' stamp: 'a 7/22/2021 12:21:57'!
headingTextFieldForSouth

	^'South'! !

!MarsRoverLog methodsFor: 'heading textfield' stamp: 'a 7/22/2021 12:22:19'!
headingTextFieldForWest

	^'West'! !


!classDefinition: #MarsRoverWindowStatus category: 'MarsRover-Solucion2'!
MarsRoverObserver subclass: #MarsRoverWindowStatus
	instanceVariableNames: 'actualPosition actualHead'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion2'!

!MarsRoverWindowStatus methodsFor: 'updating' stamp: 'a 7/22/2021 12:30:34'!
updateWithAMarsRoverHeading: aHeading

	actualHead := (aHeading textFieldFor: self)! !

!MarsRoverWindowStatus methodsFor: 'updating' stamp: 'a 7/22/2021 10:55:52'!
updateWithAMarsRoverPosition: aPosition

	actualPosition := aPosition.! !


!MarsRoverWindowStatus methodsFor: 'printing' stamp: 'a 7/22/2021 10:53:51'!
showMarsRoverCurrentHeading
	
	^actualHead! !

!MarsRoverWindowStatus methodsFor: 'printing' stamp: 'a 7/22/2021 10:53:10'!
showMarsRoverCurrentPosition
	
	^actualPosition! !


!MarsRoverWindowStatus methodsFor: 'heading textfield' stamp: 'a 7/22/2021 12:29:41'!
headingTextFieldForEast

	^'East'! !

!MarsRoverWindowStatus methodsFor: 'heading textfield' stamp: 'a 7/22/2021 12:29:49'!
headingTextFieldForNorth

	^'North'! !

!MarsRoverWindowStatus methodsFor: 'heading textfield' stamp: 'a 7/22/2021 12:30:02'!
headingTextFieldForSouth

	^'South'! !

!MarsRoverWindowStatus methodsFor: 'heading textfield' stamp: 'a 7/22/2021 12:30:12'!
headingTextFieldForWest

	^'West'! !


!MarsRoverWindowStatus methodsFor: 'initialization' stamp: 'a 7/22/2021 15:06:33'!
initialize

	positionAccess := false.
	headingAccess := false.! !


!classDefinition: #MarsRoverObserverProxy category: 'MarsRover-Solucion2'!
Object subclass: #MarsRoverObserverProxy
	instanceVariableNames: 'headHistory observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion2'!

!MarsRoverObserverProxy methodsFor: 'updating' stamp: 'a 7/22/2021 16:10:02'!
updateWithAMarsRoverHeading: aHeading

	observers do: [:anObserver | (anObserver hasHeadingPermission) ifTrue: [anObserver updateWithAMarsRoverHeading: aHeading]]! !

!MarsRoverObserverProxy methodsFor: 'updating' stamp: 'a 7/22/2021 15:15:55'!
updateWithAMarsRoverPosition: aPosition

	observers do: [:anObserver | (anObserver hasPositionPermission) ifTrue: [anObserver updateWithAMarsRoverPosition: aPosition]]! !


!MarsRoverObserverProxy methodsFor: 'initialization' stamp: 'a 7/22/2021 15:26:13'!
initialize

	observers := OrderedCollection new.! !


!MarsRoverObserverProxy methodsFor: 'adding' stamp: 'a 7/22/2021 15:30:21'!
addObserver: anObserver

	(observers includes: anObserver) ifFalse: [observers add: anObserver]! !
