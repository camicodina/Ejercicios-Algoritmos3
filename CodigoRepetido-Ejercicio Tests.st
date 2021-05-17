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

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/16/2021 22:15:03'!
action: action exception: exception quantity: quantity secondName: secondName
	[ action ]
		on: exception
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = quantity.
			(quantity = 0) ifTrue: [self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage] ifFalse: [self assert: (customerBook includesCustomerNamed: secondName)].
			]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/16/2021 21:32:12'!
countTime: action

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	
	action.
	
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^millisecondsAfterRunning-millisecondsBeforeRunning.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/16/2021 22:11:35'!
doesRemove: boolean quantity: quantity action: action

	| paulMcCartney |
	
	paulMcCartney := 'PaulMcCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	(boolean = true) ifTrue: [customerBook removeCustomerNamed: paulMcCartney].
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: quantity equals: customerBook numberOfSuspendedCustomers.
	self assert: quantity equals: customerBook numberOfCustomers.
	action.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/16/2021 21:34:51'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	customerBook := CustomerBook new.
	
	self timeExpected: (50 * millisecond) timeUsed: [self countTime: (customerBook addCustomerNamed: 'JohnLennon')] value! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/16/2021 21:36:43'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	
	customerBook := CustomerBook new.
	
	customerBook addCustomerNamed: 'PaulMcCartney'.
	
	self timeExpected: (100 * millisecond) timeUsed: [self countTime: (customerBook removeCustomerNamed: 'PaulMcCartney')] value
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/16/2021 21:09:02'!
test03CanNotAddACustomerWithEmptyName 
	
	customerBook := CustomerBook new.
	
	self action: [customerBook addCustomerNamed: '' self fail] exception: Error quantity: 0 secondName: 'JohnLennon'! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/16/2021 21:01:52'!
test04CanNotRemoveAnInvalidCustomer
			
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'JohnLennon'.
	
	self action: [customerBook removeCustomerNamed: 'Paul McCartney' self fail] exception: NotFound quantity: 1 secondName: 'JohnLennon'
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/16/2021 22:12:23'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	customerBook := CustomerBook new.
	
	self doesRemove: false quantity: 1 action: [self assert: (customerBook includesCustomerNamed: 'PaulMcCartney')].
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/16/2021 22:13:07'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	
	customerBook := CustomerBook new.

	self doesRemove: true quantity: 0 action: [self deny: (customerBook includesCustomerNamed: 'PaulMcCartney')].


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/16/2021 21:07:56'!
test07CanNotSuspendAnInvalidCustomer
			
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'JohnLennon'.
	
	self action: [customerBook suspendCustomerNamed: 'Ringo Starr' self fail] exception: CantSuspend quantity: 1 secondName: 'JohnLennon'
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'a 5/16/2021 21:12:01'!
test08CanNotSuspendAnAlreadySuspendedCustomer
			
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'JohnLennon'.
	customerBook suspendCustomerNamed: 'JohnLennon'.

	self action: [customerBook suspendCustomerNamed: 'JohnLennon' self fail] exception: CantSuspend quantity: 1 secondName: 'JohnLennon'
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

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
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
