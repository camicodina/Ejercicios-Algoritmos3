!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'a 7/8/2021 01:05:58'!
test01PortfolioHasZeroAsBalanceWhenCreated

	self aPortfolioThatHasAQuantityOfAccounts: 0 with100pesosEachHasBalance: (0 * peso)! !

!PortfolioTest methodsFor: 'tests' stamp: 'a 7/8/2021 01:05:36'!
test02BalanceOfPortfolioWhenItHasOneAccountIsTheSameAsTheBalanceOfTheAccount
	
	self aPortfolioThatHasAQuantityOfAccounts: 1 with100pesosEachHasBalance: (100 * peso).! !

!PortfolioTest methodsFor: 'tests' stamp: 'a 7/8/2021 01:06:36'!
test03BalanceOfPortfolioWhenItHasMoreThanOneAccountsIsTheSumOfTheIndividualBalances
	
	self aPortfolioThatHasAQuantityOfAccounts: 2 with100pesosEachHasBalance: (200 * peso)! !

!PortfolioTest methodsFor: 'tests' stamp: 'a 7/8/2021 01:17:50'!
test04PortfolioDoesNotRegisterAnyMovementWhenAccountsDidNotMakeAnyTransaction
	| aPortfolio |
	
	aPortfolio := self createPortfolioThatHasAQuantityOfAccountsWith100PesosDepositedEach: 0.
	
	self deny: aPortfolio didRegisterAccountMovement.! !

!PortfolioTest methodsFor: 'tests' stamp: 'a 7/8/2021 01:18:37'!
test05PortfolioRegistersMovementWhenAccountsDoTransactions
	| aPortfolio |
	
	aPortfolio := self createPortfolioThatHasAQuantityOfAccountsWith100PesosDepositedEach: 2.
	
	self assert: aPortfolio didRegisterAccountMovement.! !

!PortfolioTest methodsFor: 'tests' stamp: 'a 7/8/2021 02:35:20'!
test06PortfolioCanShowTransactionsMadeByAccount
	| aPortfolio anAccount |
	
	aPortfolio := Portfolio new.
	anAccount := self createAndDeposit100PesosInAnAccountInAPortfolio: aPortfolio.
	
	self assert: (aPortfolio transactions) = (anAccount transactions).! !

!PortfolioTest methodsFor: 'tests' stamp: 'a 7/8/2021 11:53:57'!
test07PortfolioCanShowAllTransactionsWhenThereIsMoreThanOneAccount

	| aPortfolio account1 account2 expectedTransactions |
	
	aPortfolio := Portfolio new.
	account1 := self createAndDeposit100PesosInAnAccountInAPortfolio: aPortfolio.
	account2 := self createAndDeposit100PesosInAnAccountInAPortfolio: aPortfolio.
	
	expectedTransactions := OrderedCollection new.
	expectedTransactions addAll: (account1 transactions).
	expectedTransactions addAll: (account2 transactions).
	
	self assert: (aPortfolio transactions) = expectedTransactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'a 7/8/2021 03:04:55'!
test08PortfolioCanContainOtherPorfolios
	| mainPortfolio anAccount |
	
	mainPortfolio := Portfolio new.
	anAccount := self createAccountContainedInInnerPortfolioOf: mainPortfolio.
	
	self assert: mainPortfolio balance equals: 100 * peso.
	self assert: mainPortfolio didRegisterAccountMovement.
	self assert: mainPortfolio transactions = anAccount transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'a 7/8/2021 03:09:45'!
test09PortfolioCanNotAddTheSameAccountTwoTimes
	| anPortfolio anAccount |
	
	anPortfolio := Portfolio new.
	anAccount := self createAndDeposit100PesosInAnAccountInAPortfolio: anPortfolio.
	
	self raisesExceptionWhenAdds: anAccount in: anPortfolio
! !

!PortfolioTest methodsFor: 'tests' stamp: 'a 7/8/2021 03:10:32'!
test10PortfolioCanNotAddAnAccountThatIsContainedInInnerPortfolio
	| mainPortfolio anAccount |
	
	mainPortfolio := Portfolio new.
	anAccount := self createAccountContainedInInnerPortfolioOf: mainPortfolio.
	
	self raisesExceptionWhenAdds: anAccount in: mainPortfolio.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'a 7/8/2021 03:10:57'!
test11PortfolioCanNotAddItself
	| aPortfolio |
	
	aPortfolio := Portfolio new.
	
	self raisesExceptionWhenAdds: aPortfolio in: aPortfolio.
! !


!PortfolioTest methodsFor: 'private' stamp: 'a 7/8/2021 01:16:19'!
aPortfolioThatHasAQuantityOfAccounts: aQuantity with100pesosEachHasBalance: anExpectedBalance

	| aPortfolio |
	
	aPortfolio := self createPortfolioThatHasAQuantityOfAccountsWith100PesosDepositedEach: aQuantity.
	
	self assert: aPortfolio balance equals: anExpectedBalance! !

!PortfolioTest methodsFor: 'private' stamp: 'a 7/8/2021 03:03:58'!
createAccountContainedInInnerPortfolioOf: mainPortfolio
	| innerPortfolio anAccount |
	
	innerPortfolio := Portfolio new.
	anAccount := self createAndDeposit100PesosInAnAccountInAPortfolio: innerPortfolio.
	
	mainPortfolio addAccountOrPortfolio: innerPortfolio.
	
	^anAccount! !

!PortfolioTest methodsFor: 'private' stamp: 'a 7/8/2021 00:56:14'!
createAndDeposit100PesosInAnAccountInAPortfolio: aPortfolio
	| anAccount |

	anAccount := ReceptiveAccount new.
	
	aPortfolio addAccountOrPortfolio: anAccount.
	Deposit register: 100 * peso on: anAccount.
	
	^anAccount ! !

!PortfolioTest methodsFor: 'private' stamp: 'a 7/8/2021 01:16:46'!
createPortfolioThatHasAQuantityOfAccountsWith100PesosDepositedEach: aQuantityOfAccounts
	| aPortfolio |
	
	aPortfolio := Portfolio new.

	aQuantityOfAccounts timesRepeat: [self createAndDeposit100PesosInAnAccountInAPortfolio: aPortfolio].
	
	^aPortfolio ! !

!PortfolioTest methodsFor: 'private' stamp: 'a 7/8/2021 03:08:50'!
raisesExceptionWhenAdds: anInvalidAccountOrPortfolio in: aPortfolio
	self 
		should: [aPortfolio addAccountOrPortfolio: anInvalidAccountOrPortfolio]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio canNotAddAnAccountOrPortfolioThatAlreadyExistsInPortfolioErrorDescription]! !


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

!TransferenceTest methodsFor: 'tests' stamp: 'a 7/8/2021 01:50:43'!
test01TransferingFromAnAccountDecreasesBalanceOnTransferenceValue
	| transference |
	
	transference := self createTransferenceBetweenTwoEmptyAccountsWithValue: (100 * peso).
	self assert: (-100 * peso) equals: (transference withdrawingPart) balance.! !

!TransferenceTest methodsFor: 'tests' stamp: 'a 7/8/2021 01:46:06'!
test02TransferingToAnAccountIncreasesBalanceOnTranferenceValue
	| transference |

	transference := self createTransferenceBetweenTwoEmptyAccountsWithValue: (100 * peso).	
	self assert: 100 * peso equals: (transference depositPart) balance.! !

!TransferenceTest methodsFor: 'tests' stamp: 'a 7/8/2021 01:51:54'!
test03TransferenceValueMustBePositive
	| transferedValue transference |
	
	transferedValue := 100 * peso.
	transference := self createTransferenceBetweenTwoEmptyAccountsWithValue: transferedValue.
	
	self assert: transferedValue equals: transference value! !

!TransferenceTest methodsFor: 'tests' stamp: 'a 7/8/2021 01:49:22'!
test04TransferingPartKnowsWhoIsTheCounterPart
	| transference |
	
	transference := self createTransferenceBetweenTwoEmptyAccountsWithValue: (100 * peso).
	
	self assert: ((transference withdrawingPart) counterpartFrom: transference) = (transference depositPart).
	self assert: ((transference depositPart) counterpartFrom: transference) = (transference withdrawingPart).! !

!TransferenceTest methodsFor: 'tests' stamp: 'a 7/8/2021 01:50:13'!
test05TransferenceValueCanNotBeZeroPesos
	
	self 
		should: [self createTransferenceBetweenTwoEmptyAccountsWithValue: (0 * peso)]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Transference invalidValueOfTransferenceErrorDescription]! !


!TransferenceTest methodsFor: 'private' stamp: 'a 7/8/2021 01:44:53'!
createTransferenceBetweenTwoEmptyAccountsWithValue: aValue
	| account1 account2 transference |
	
	account1 := ReceptiveAccount new..
	account2 := ReceptiveAccount new.
	
	transference := Transference register: (aValue) from: account1 to: account2.
	
	^transference! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'effect on balance' stamp: 'a 7/8/2021 00:08:33'!
effectOnBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'effect on balance' stamp: 'a 7/8/2021 00:09:27'!
negativeEffectOnBalance: aBalance

	^self value negated + aBalance 

	! !

!AccountTransaction methodsFor: 'effect on balance' stamp: 'a 7/8/2021 00:09:11'!
positiveEffectOnBalance: aBalance

	^self value + aBalance 

	! !


!AccountTransaction methodsFor: 'testing' stamp: 'a 7/8/2021 00:34:55'!
belongsTo: aTransference

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


!classDefinition: #SingleTransaction category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #SingleTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!SingleTransaction methodsFor: 'initialization' stamp: 'a 7/7/2021 23:09:20'!
initializeFor: aValue

	value := aValue ! !


!SingleTransaction methodsFor: 'value' stamp: 'a 7/8/2021 02:10:29'!
value

	^value! !


!SingleTransaction methodsFor: 'effect on balance' stamp: 'a 7/8/2021 01:59:27'!
effectOnBalance: aBalance

	self subclassResponsibility ! !


!SingleTransaction methodsFor: 'testing' stamp: 'a 7/8/2021 00:35:11'!
belongsTo: aTransference

	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SingleTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
SingleTransaction class
	instanceVariableNames: ''!

!SingleTransaction class methodsFor: 'instance creation' stamp: 'a 7/8/2021 00:46:15'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
SingleTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'effect on balance' stamp: 'a 7/8/2021 00:09:39'!
effectOnBalance: aBalance

	^self positiveEffectOnBalance: aBalance! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
SingleTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'effect on balance' stamp: 'a 7/8/2021 00:10:03'!
effectOnBalance: aBalance

	^self negativeEffectOnBalance: aBalance
! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transfer
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'a 7/8/2021 02:00:40'!
initializeFrom: aTransference

	transference := aTransference.! !


!Transfer methodsFor: 'testing' stamp: 'a 7/8/2021 00:35:47'!
belongsTo: aTransference

	^self transference = aTransference! !


!Transfer methodsFor: 'accesing' stamp: 'a 7/8/2021 02:01:20'!
counterpart

	self subclassResponsibility ! !

!Transfer methodsFor: 'accesing' stamp: 'a 7/7/2021 02:16:41'!
transference

	^transference ! !


!Transfer methodsFor: 'value' stamp: 'a 7/8/2021 00:05:28'!
value

	^transference value! !


!Transfer methodsFor: 'effect on balance' stamp: 'a 7/8/2021 01:59:44'!
effectOnBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'a 7/8/2021 01:57:55'!
from: aTransference

	^self new initializeFrom: aTransference! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'accesing' stamp: 'a 7/8/2021 00:30:00'!
counterpart

	^transference withdrawingPart! !


!TransferDeposit methodsFor: 'effect on balance' stamp: 'a 7/8/2021 00:10:31'!
effectOnBalance: aBalance

	^self positiveEffectOnBalance: aBalance! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'effect on balance' stamp: 'a 7/8/2021 00:11:37'!
effectOnBalance: aBalance

	^self negativeEffectOnBalance: aBalance! !


!TransferWithdraw methodsFor: 'accesing' stamp: 'a 7/8/2021 00:30:23'!
counterpart

	^transference depositPart! !


!classDefinition: #AccountsAndPortfolios category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountsAndPortfolios
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountsAndPortfolios methodsFor: 'main protocol' stamp: 'a 7/8/2021 12:31:13'!
balance

	self subclassResponsibility ! !

!AccountsAndPortfolios methodsFor: 'main protocol' stamp: 'a 7/8/2021 12:32:53'!
didRegisterAccountMovement
	
	^self transactions size ~= 0.! !

!AccountsAndPortfolios methodsFor: 'main protocol' stamp: 'a 7/8/2021 12:38:45'!
transactions

	self subclassResponsibility! !


!AccountsAndPortfolios methodsFor: 'comparing' stamp: 'a 7/8/2021 12:30:45'!
containsOrIsEqual: anAccountOrPortfolio

	self subclassResponsibility ! !


!AccountsAndPortfolios methodsFor: 'initialization' stamp: 'a 7/8/2021 12:48:00'!
initialize

	self subclassResponsibility! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
AccountsAndPortfolios subclass: #Portfolio
	instanceVariableNames: 'accountsAndPortfoliosContained'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'a 7/8/2021 12:54:40'!
balance

	^accountsAndPortfoliosContained sum: [ :anAccountOrAPortfolio | anAccountOrAPortfolio balance ] ifEmpty: 0 * peso! !

!Portfolio methodsFor: 'main protocol' stamp: 'a 7/8/2021 12:55:01'!
transactions
	| transactions |
	
	transactions := OrderedCollection new.
	accountsAndPortfoliosContained do: [:anAccountOrAPortfolio | transactions addAll: (anAccountOrAPortfolio transactions)].
	
	^transactions.
	
	
	
	! !


!Portfolio methodsFor: 'adding' stamp: 'a 7/8/2021 12:54:34'!
addAccountOrPortfolio: anAccountOrPortfolio

	(self containsOrIsEqual: anAccountOrPortfolio) ifTrue: [self error: self class canNotAddAnAccountOrPortfolioThatAlreadyExistsInPortfolioErrorDescription].
	
	accountsAndPortfoliosContained add: anAccountOrPortfolio ! !


!Portfolio methodsFor: 'initialization' stamp: 'a 7/8/2021 12:54:53'!
initialize

	accountsAndPortfoliosContained := OrderedCollection new.! !


!Portfolio methodsFor: 'comparing' stamp: 'a 7/8/2021 12:54:46'!
containsOrIsEqual: newAccountOrPortfolio

	(self = newAccountOrPortfolio) ifTrue: [^true].
	
	accountsAndPortfoliosContained do: [
		:anAccountOrPortfolio |
		(anAccountOrPortfolio containsOrIsEqual: newAccountOrPortfolio) ifTrue: [^true].].
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error description' stamp: 'a 7/8/2021 03:00:00'!
canNotAddAnAccountOrPortfolioThatAlreadyExistsInPortfolioErrorDescription

	^'You can not add an account or a portfolio that is already in the portfolio'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
AccountsAndPortfolios subclass: #ReceptiveAccount
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


!ReceptiveAccount methodsFor: 'comparing' stamp: 'a 7/8/2021 12:27:58'!
containsOrIsEqual: anAccountOrPortfolio

	^self = anAccountOrPortfolio! !


!ReceptiveAccount methodsFor: 'transference counterpart' stamp: 'a 7/8/2021 00:37:01'!
counterpartFrom: aTransference

	transactions do: [ :aTransaction | (aTransaction belongsTo: aTransference) ifTrue: [^aTransaction counterpart]].! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value withdrawAccount depositAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'value' stamp: 'a 7/7/2021 00:53:57'!
value

	^value! !


!Transference methodsFor: 'initialization' stamp: 'a 7/8/2021 00:27:14'!
initializeWith: aValue from: aWithdrawingAccount to: aDepositAccount

	value := aValue.
	withdrawAccount := aWithdrawingAccount.
	depositAccount := aDepositAccount.! !


!Transference methodsFor: 'transference parts' stamp: 'a 7/8/2021 00:29:46'!
depositPart

	^depositAccount! !

!Transference methodsFor: 'transference parts' stamp: 'a 7/8/2021 00:29:34'!
withdrawingPart

	^withdrawAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'a 7/8/2021 02:01:56'!
register: aValue from: account1 to: account2
	| transaction aTransferWithdraw aTransferDeposit |
	
	(aValue = (0 * peso)) ifTrue: [^self error: self invalidValueOfTransferenceErrorDescription].
	
	transaction := self new initializeWith: aValue from: account1 to: account2.
	
	aTransferWithdraw := TransferWithdraw from: transaction.
	aTransferDeposit := TransferDeposit from: transaction.

	account1 register: aTransferWithdraw.
	account2 register: aTransferDeposit.
	
	^transaction.! !


!Transference class methodsFor: 'error description' stamp: 'a 7/7/2021 23:37:59'!
invalidValueOfTransferenceErrorDescription

	'The transfered amount can not be zero.'! !
