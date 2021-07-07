!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 21:29:09'!
test01PortfolioHasZeroAsBalanceWhenCreated

	| aPortfolio |
	
	aPortfolio := Portfolio new.
	
	self assert: aPortfolio balance equals: 0 * peso! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 21:31:13'!
test02BalanceOfPortfolioWhenItHasOneAccountIsTheSameAsTheBalanceOfTheAccount

	| aPortfolio account1 |
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	
	aPortfolio addAccountOrPortfolio: account1.
	Deposit register: 100 * peso on: account1.
	
	self assert: aPortfolio balance equals: 100 * peso! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 21:33:01'!
test03BalanceOfPortfolioWhenItHasMoreThanOneAccountsIsTheSumOfTheIndividualBalances

	| aPortfolio account1 account2 |
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	aPortfolio addAccountOrPortfolio: account1.
	Deposit register: 100 * peso on: account1.
	aPortfolio addAccountOrPortfolio: account2.
	Deposit register: 200 * peso on: account2.
	
	self assert: aPortfolio balance equals: 300 * peso! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 21:34:29'!
test04PortfolioDoesNotRegisterAnyMovementWhenAccountsDidNotMakeAnyTransaction

	| aPortfolio account1 account2 |
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	aPortfolio addAccountOrPortfolio: account1.
	aPortfolio addAccountOrPortfolio: account2.
	
	self deny: aPortfolio didRegisterAccountMovement.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 21:35:29'!
test05PortfolioRegistersMovementWhenAccountsDoTransactions

	| aPortfolio account1 account2 |
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	aPortfolio addAccountOrPortfolio: account1.
	aPortfolio addAccountOrPortfolio: account2.
	Deposit register: 100 * peso on: account2.
	
	self assert: aPortfolio didRegisterAccountMovement.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 22:24:10'!
test06PortfolioCanShowTransactionsMadeByAccount

	| aPortfolio account1 |
	
	aPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	
	aPortfolio addAccountOrPortfolio: account1.
	Deposit register: 100 * peso on: account1.
	
	self assert: (aPortfolio transactions) = (account1 transactions).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 22:31:14'!
test08PortfolioCanContainOtherPorfolios

	| mainPortfolio account1 innerPortfolio |
	
	mainPortfolio := Portfolio new.
	innerPortfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	
	innerPortfolio addAccountOrPortfolio: account1.
	Deposit register: 100 * peso on: account1.
	
	mainPortfolio addAccountOrPortfolio: innerPortfolio.
	
	self assert: mainPortfolio balance equals: 100 * peso.
	self assert: mainPortfolio didRegisterAccountMovement.
	self assert: mainPortfolio transactions = account1 transactions.
	
	"mainPortfolio addAccountOrPortfolio: account1.
	Deposit register: 100 * peso on: account1.
	
	self assert: (mainPortfolio showTransactionsFrom: account1) = account1 transactions."! !


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


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'a 7/7/2021 00:36:03'!
test01TransferingFromAnAccountDecreasesBalanceOnTransferenceValue
	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	account2 := ReceptiveAccount new.
	
	Transference register: 100 * peso from: account1 to: account2.
	
	self assert: 0 * peso equals: account1 balance.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'a 7/7/2021 00:36:19'!
test02TransferingToAnAccountIncreasesBalanceOnTranferenceValue
	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	account2 := ReceptiveAccount new.
	
	Transference register: 100 * peso from: account1 to: account2.
	
	self assert: 100 * peso equals: account2 balance.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'a 7/7/2021 00:55:40'!
test03TransferenceValueMustBePositive
	| account1 account2 transferedValue |
	
	transferedValue := 100 * peso.
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	account2 := ReceptiveAccount new.
	
	self assert: transferedValue equals: (Transference register: transferedValue from: account1 to: account2) value! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'a 7/7/2021 01:20:48'!
test04TransferingPartKnowsWhoIsTheCounterPart
	| account1 account2 transference transferPart |
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	account2 := ReceptiveAccount new.
	
	transference := Transference register: 100 * peso from: account1 to: account2.
	transferPart := transference transferPart.
	
	self assert: (account1 counterpartFrom: transferPart) = account2.! !


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

!Portfolio methodsFor: 'as yet unclassified' stamp: 'a 7/5/2021 21:34:07'!
addAccountOrPortfolio: anAccountOrPortfolio

	accountsAndPortfolios add: anAccountOrPortfolio ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 21:48:23'!
balance

	^accountsAndPortfolios sum: [ :anAccountOrAPortfolio | anAccountOrAPortfolio balance ] ifEmpty: 0 * peso! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 22:32:39'!
didRegisterAccountMovement
	
	^self transactions size ~= 0.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 22:35:43'!
transactions
	| transactions |
	
	transactions := OrderedCollection new.
	accountsAndPortfolios do: [:anAccountOrAPortfolio | transactions addAll: (anAccountOrAPortfolio transactions)].
	
	^transactions.
	
	
	
	! !


!Portfolio methodsFor: 'initialization' stamp: 'a 7/5/2021 21:33:21'!
initialize

	accountsAndPortfolios := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 21:21:41'!
accountDoesNotBelongToPortfolioErrorDescription

	^'This account does not belong to the portfolio.'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'a 7/6/2021 22:33:37'!
balance

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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'a 7/7/2021 01:23:53'!
counterpartFrom: aTransferPart

	transactions do: [ :aTransaction | (aTransaction = aTransferPart) ifTrue: [^aTransaction counterpart]].
	^self error: 'help'! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value transferWithdraw transferDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'as yet unclassified' stamp: 'a 7/7/2021 02:04:37'!
initializeWith: aValue from: account1 to: account2
	| aTransferWithdraw aTransferDeposit |
	
	aTransferWithdraw := TransferWithdraw from: self withCounterPart: account2 withValue: aValue .
	aTransferDeposit := TransferDeposit from: self withCounterPart: account1 withValue: aValue.

	account1 register: aTransferWithdraw.
	account2 register: aTransferDeposit.
	
	transferWithdraw := aTransferWithdraw.
	transferDeposit := aTransferDeposit.
	value := aValue ! !

!Transference methodsFor: 'as yet unclassified' stamp: 'a 7/7/2021 01:50:34'!
receivePart

	^transferDeposit! !

!Transference methodsFor: 'as yet unclassified' stamp: 'a 7/7/2021 01:50:24'!
transferPart

	^transferWithdraw ! !

!Transference methodsFor: 'as yet unclassified' stamp: 'a 7/7/2021 00:53:57'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'as yet unclassified' stamp: 'a 7/7/2021 01:13:51'!
register: aValue from: account1 to: account2
	| transaction |
	
	transaction := self new initializeWith: aValue from: account1 to: account2.
	"account1 register: transaction.
	account2 register: transaction."
	^transaction.
		
! !


!classDefinition: #TransferingParts category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferingParts
	instanceVariableNames: 'value transference counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferingParts methodsFor: 'as yet unclassified' stamp: 'a 7/7/2021 01:20:07'!
counterpart

	^counterpart ! !

!TransferingParts methodsFor: 'as yet unclassified' stamp: 'a 7/7/2021 02:05:46'!
initializeFrom: aTransference withCounterPart: anAccount withValue: aValue

	value := aValue.
	counterpart := anAccount.
	transference := aTransference.! !

!TransferingParts methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 23:51:55'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferingParts class' category: 'ServiciosFinancieros-Ejercicio'!
TransferingParts class
	instanceVariableNames: ''!

!TransferingParts class methodsFor: 'as yet unclassified' stamp: 'a 7/7/2021 02:03:22'!
from: aTransference withCounterPart: anAccount withValue: aValue

	^self new initializeFrom: aTransference withCounterPart: anAccount withValue: aValue.! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
TransferingParts subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 23:46:21'!
effectOnBalance: aBalance

	^self value + aBalance! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
TransferingParts subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'a 7/6/2021 23:50:55'!
effectOnBalance: aBalance

	^self value negated + aBalance! !
