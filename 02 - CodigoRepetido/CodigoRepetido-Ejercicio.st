!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/19/2021 22:41:41'!
assertAction: action exception: exception quantity: quantity secondName: secondName
	"Auxiliar function for implementing tests 3, 4, 7 and 8. Asserts an action and considers an exception to deliver an error message."
	
	[ action ]
		on: exception
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = quantity.
			(quantity = 0) ifTrue: [self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage] ifFalse: [self assert: (customerBook includesCustomerNamed: secondName)].
			]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/19/2021 22:51:00'!
countTime: action
	"Auxiliar function to calculate the time it takes to add/remove a customer, called in tests 1 and 2."

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	
	action.
	
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^millisecondsAfterRunning-millisecondsBeforeRunning.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/19/2021 22:50:34'!
doesRemove: boolean quantity: quantity assertion: assertion
	"Auxiliar function that asks if we should remove a customer and asserts if the suspended customer is still on the CustomerBook. Called in tests 5 and 6."

	| paulMcCartney |
	
	paulMcCartney := 'PaulMcCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	(boolean = true) ifTrue: [customerBook removeCustomerNamed: paulMcCartney].
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: quantity equals: customerBook numberOfSuspendedCustomers.
	self assert: quantity equals: customerBook numberOfCustomers.
	assertion.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/16/2021 21:34:51'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	customerBook := CustomerBook new.
	
	self timeExpected: (50 * millisecond) timeUsed: [self countTime: (customerBook addCustomerNamed: 'JohnLennon')] value! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/19/2021 22:20:00'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	
	| paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'PaulMcCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self timeExpected: (100 * millisecond) timeUsed: [self countTime: (customerBook removeCustomerNamed: paulMcCartney)] value
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/19/2021 22:36:05'!
test03CanNotAddACustomerWithEmptyName 
	
	customerBook := CustomerBook new.
	
	self assertAction: [customerBook addCustomerNamed: '' self fail] exception: Error quantity: 0 secondName: 'JohnLennon'! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/19/2021 22:35:57'!
test04CanNotRemoveAnInvalidCustomer

	| johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'JohnLennon'.
	
	customerBook addCustomerNamed: johnLennon.
	
	self assertAction: [customerBook removeCustomerNamed: 'Paul McCartney' self fail] exception: NotFound quantity: 1 secondName: johnLennon.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/19/2021 22:47:02'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	customerBook := CustomerBook new.
	
	self doesRemove: false quantity: 1 assertion: [self assert: (customerBook includesCustomerNamed: 'PaulMcCartney')].
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/19/2021 22:47:11'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	
	customerBook := CustomerBook new.

	self doesRemove: true quantity: 0 assertion: [self deny: (customerBook includesCustomerNamed: 'PaulMcCartney')].


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/19/2021 22:36:12'!
test07CanNotSuspendAnInvalidCustomer

	| johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'JohnLennon'.
	
	customerBook addCustomerNamed: johnLennon.
	
	self assertAction: [customerBook suspendCustomerNamed: 'Ringo Starr' self fail] exception: CantSuspend quantity: 1 secondName: johnLennon.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/19/2021 22:36:18'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	| johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'JohnLennon'.
	
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.

	self assertAction: [customerBook suspendCustomerNamed: 'JohnLennon' self fail] exception: CantSuspend quantity: 1 secondName: johnLennon.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/16/2021 21:34:05'!
timeExpected: timeExpected timeUsed: timeUsed
	
	self assert: timeUsed < timeExpected! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'a 5/19/2021 23:15:22'!
isIncluded: boolean signal: signal name: aName
	"Auxiliar function used to remove or suspend a customer from the CustomerBook."

	(boolean = true) ifFalse: [^signal].
	
	self removeName: aName from: active.! !

!CustomerBook methodsFor: 'customer management' stamp: 'a 5/19/2021 23:09:24'!
removeCustomerNamed: aName 

	self isIncluded: [self includesCustomerNamed: aName] signal: [NotFound signal] name: aName.

	self removeName: aName from: suspended.

	^ aName.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'a 5/19/2021 23:14:19'!
removeName: aName from: collection
	"Auxiliar function to remove a name form an collection, called in #isIncluded: signal: name."
	
	1 to: collection size do:
	[:index |
		aName = (collection at: index)
			ifTrue: [
				collection removeAt: index.
				^ aName 
			]
	]! !

!CustomerBook methodsFor: 'customer management' stamp: 'a 5/19/2021 23:13:39'!
suspendCustomerNamed: aName 
	
	self isIncluded: (active includes: aName) signal: [CantSuspend signal] name: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
