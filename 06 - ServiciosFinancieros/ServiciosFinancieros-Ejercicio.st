!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 21:06:43'!
test01

	| aPortfolio |
	
	aPortfolio := Portfolio new.
	
	self assert: aPortfolio balance equals: 0 * peso! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 21:34:33'!
test02

	| aPortfolio account1 account2 |
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	aPortfolio addAccountOrPortfolio: account1.
	aPortfolio addAccountOrPortfolio: account2.
	
	self assert: aPortfolio balance equals: 0 * peso! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 21:36:01'!
test03

	| aPortfolio account1 account2 portfolio2 |
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolio2 := Portfolio new.
	
	aPortfolio addAccountOrPortfolio: account1.
	Deposit register: 100 * peso on: account1.
	aPortfolio addAccountOrPortfolio: account2.
	Deposit register: 200 * peso on: account2.
	aPortfolio addAccountOrPortfolio: portfolio2.
	
	self assert: aPortfolio balance equals: 300 * peso! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 22:04:40'!
test04

	| aPortfolio account1 account2 |
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	aPortfolio addAccountOrPortfolio: account1.
	aPortfolio addAccountOrPortfolio: account2.
	
	self deny: aPortfolio didRegisterAccountMovement.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 21:40:54'!
test05

	| aPortfolio account1 |
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	
	aPortfolio addAccountOrPortfolio: account1.
	Deposit register: 100 * peso on: account1.
	
	self assert: aPortfolio didRegisterAccountMovement.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 22:03:26'!
test06

	| aPortfolio account1 account2 |
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	aPortfolio addAccountOrPortfolio: account1.
	aPortfolio addAccountOrPortfolio: account2.
	Deposit register: 100 * peso on: account2.
	
	self assert: aPortfolio didRegisterAccountMovement.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 20:57:01'!
effectOnBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 20:57:28'!
effectOnBalance: aBalance

	^self value + aBalance! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 19:27:36'!
valueForBalance! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'a 7/5/2021 20:59:18'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 20:59:26'!
effectOnBalance: aBalance

	^aBalance + self value negated
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accountsAndPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 21:15:15'!
addAccount: anAccount

	accounts add: anAccount ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 21:34:07'!
addAccountOrPortfolio: anAccountOrPortfolio

	accountsAndPortfolios add: anAccountOrPortfolio ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 21:33:46'!
balance

	^accountsAndPortfolios sum: [ :anAccountOrAPortfolio | anAccountOrAPortfolio balance ] ifEmpty: 0 * peso! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 22:04:07'!
didRegisterAccountMovement

	accountsAndPortfolios do: [:anAccountOrAPortfolio | (anAccountOrAPortfolio transactions size = 0) ifFalse: [^true]].
	
	^false! !


!Portfolio methodsFor: 'initialization' stamp: 'a 7/5/2021 21:33:21'!
initialize

	accountsAndPortfolios := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'a 7/5/2021 20:56:41'!
balance

	"^transactions sum: [ :aTransaction | aTransaction value ] ifEmpty: [ 0 ]"
	^transactions inject: 0 * peso into: [ :currentBalance :aTransaction | aTransaction effectOnBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !
