!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 01:21:12'!
findInvalidPrefix: aPrefix withError: errorDescription
	| sentenceFinder stack |
	
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	self
		should: [ sentenceFinder find: aPrefix]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = errorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 01:46:48'!
findSentencePrefix: aPrefix numberOfMatches: aNumber
	| sentenceFinder stack collection |
	
	stack := OOStack new.
	stack push: 'Hey'.
	stack push: 'With you'.
	stack push: 'Window'.
	stack push: 'windows'.
	
	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	collection := sentenceFinder find: aPrefix.
	
	self assert: collection size = aNumber! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 01:19:33'!
test01PrefixShouldNotBeEmpty

	self findInvalidPrefix: '' withError: SentenceFinderByPrefix prefixEmptyErrorDescription
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 01:17:55'!
test02PrefixShouldNotContainSpaces

	self findInvalidPrefix: 'hola mundo' withError: SentenceFinderByPrefix prefixWithSpacesErrorDescription ! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 01:25:01'!
test03EmptyStackReturnsEmptyCollection
	| sentenceFinder stack collection |
	
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	collection := sentenceFinder find: 'Hey'.
	
	self assert: collection size = 0! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 01:47:51'!
test04SentenceFinderWithNoMatch
	
	self findSentencePrefix: 'Bye' numberOfMatches: 0! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 01:48:33'!
test05SentenceFinderWithOneMatch
	
	self findSentencePrefix: 'Hey' numberOfMatches: 1! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 01:48:56'!
test06SentenceFinderWithMoreThanOneMatch
	
	self findSentencePrefix: 'Wi' numberOfMatches: 2! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 01:50:37'!
test07SentenceFinderWithCaseSensitive
	
	self findSentencePrefix: 'wi' numberOfMatches: 1! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 01:56:24'!
test08SentenceFinderReturnsTheCollectionExpected
	
	| sentenceFinder stack collection expectedCollection |
	
	expectedCollection := OrderedCollection new.
	expectedCollection add: 'Winter is here'.
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	collection := sentenceFinder find: 'Wint'.
	
	self assert: collection = expectedCollection .! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 02:03:59'!
test09StackShouldNotBeAlteredAfterFindingSentence
	"Repetimos dos veces la operacion y verificamos que siempre de lo mismo"
	| sentenceFinder stack collection expectedCollection |
	
	expectedCollection := OrderedCollection new.
	expectedCollection add: 'cupcake'.
	expectedCollection add: 'cup'.
	
	stack := OOStack new.
	stack push: 'cup'.
	stack push: 'cupcake'.
	
	sentenceFinder := SentenceFinderByPrefix with: stack.
	
	collection := sentenceFinder find: 'cu'.
	self assert: collection = expectedCollection .
	
	collection := sentenceFinder find: 'cu'.
	self assert: collection = expectedCollection .! !


!classDefinition: #ElementAtTopOfStack category: 'Stack-Exercise'!
Object subclass: #ElementAtTopOfStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElementAtTopOfStack class' category: 'Stack-Exercise'!
ElementAtTopOfStack class
	instanceVariableNames: ''!

!ElementAtTopOfStack class methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 00:18:33'!
canHandle: aCollection

	self subclassResponsibility ! !


!classDefinition: #Empty category: 'Stack-Exercise'!
ElementAtTopOfStack subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Empty methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 00:27:13'!
content

	^ self error: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empty class' category: 'Stack-Exercise'!
Empty class
	instanceVariableNames: ''!

!Empty class methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 00:07:28'!
canHandle: aCollection

	^aCollection size = 0! !

!Empty class methodsFor: 'as yet unclassified' stamp: 'a 6/9/2021 23:56:31'!
with: aCollection

	^self new! !


!classDefinition: #NotEmpty category: 'Stack-Exercise'!
ElementAtTopOfStack subclass: #NotEmpty
	instanceVariableNames: 'elementAtTop'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmpty methodsFor: 'as yet unclassified' stamp: 'a 6/9/2021 23:59:11'!
content
	
	^elementAtTop ! !

!NotEmpty methodsFor: 'as yet unclassified' stamp: 'a 6/9/2021 23:55:43'!
initializeWith: aCollection

	| lastElementPosition |
	
	lastElementPosition := aCollection size.
	
	elementAtTop := aCollection at: lastElementPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmpty class' category: 'Stack-Exercise'!
NotEmpty class
	instanceVariableNames: ''!

!NotEmpty class methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 00:12:05'!
canHandle: aCollection

	^aCollection size ~= 0! !

!NotEmpty class methodsFor: 'as yet unclassified' stamp: 'a 6/9/2021 23:56:01'!
with: aCollection

	^self new initializeWith: aCollection ! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'a 6/6/2021 21:38:22'!
initializeStack
	elements  := OrderedCollection new.! !


!OOStack methodsFor: 'testing' stamp: 'a 6/7/2021 19:54:28'!
isEmpty

	^self size = 0 ! !


!OOStack methodsFor: 'accessing' stamp: 'a 6/6/2021 21:53:13'!
size
	
	^elements size! !

!OOStack methodsFor: 'accessing' stamp: 'a 6/10/2021 00:18:06'!
top
	| elementAtTop |
	
	elementAtTop := (ElementAtTopOfStack allSubclasses detect:[:aClass | aClass canHandle: elements]) with: elements.
	
	^ elementAtTop content! !


!OOStack methodsFor: 'actions' stamp: 'a 6/9/2021 23:20:07'!
pop
	| topElement |
	
	topElement := self top.
	
	elements removeLast.
	
	^topElement ! !

!OOStack methodsFor: 'actions' stamp: 'a 6/6/2021 21:53:40'!
push: anElement

	elements add: anElement ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'a 6/10/2021 00:15:45'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'initalize' stamp: 'a 6/6/2021 21:39:31'!
new
	^self basicNew initializeStack! !


!classDefinition: #Prefix category: 'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #EmptyPrefix category: 'Stack-Exercise'!
Prefix subclass: #EmptyPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyPrefix methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 02:21:11'!
findInStack: aStack

	^self error: SentenceFinderByPrefix prefixEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyPrefix class' category: 'Stack-Exercise'!
EmptyPrefix class
	instanceVariableNames: ''!

!EmptyPrefix class methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 02:11:34'!
canHandle: aPrefix
	^aPrefix = ''! !

!EmptyPrefix class methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 02:20:18'!
with: aPrefix

	^self new! !


!classDefinition: #SpacedPrefix category: 'Stack-Exercise'!
Prefix subclass: #SpacedPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SpacedPrefix methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 02:22:03'!
findInStack: aStack

	^self error: SentenceFinderByPrefix prefixWithSpacesErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SpacedPrefix class' category: 'Stack-Exercise'!
SpacedPrefix class
	instanceVariableNames: ''!

!SpacedPrefix class methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 02:25:58'!
canHandle: aPrefix
	^(aPrefix findString: ' ') ~= 0! !

!SpacedPrefix class methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 02:20:09'!
with: aPrefix

	^self new! !


!classDefinition: #ValidPrefix category: 'Stack-Exercise'!
Prefix subclass: #ValidPrefix
	instanceVariableNames: 'string'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValidPrefix methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 02:24:23'!
findInStack: aStack
	| auxStack auxString collection |
	
	auxStack := OOStack new.
	collection := OrderedCollection new.
	
	[aStack isEmpty] whileFalse: [
		auxString := aStack pop.
		auxStack push: auxString.
		((string commonPrefixWith: auxString) = (string size)) ifTrue: [collection add: auxString]].
	
	[auxStack isEmpty] whileFalse: [
		auxString := auxStack pop.
		aStack push: auxString].
	
	^collection! !

!ValidPrefix methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 02:19:12'!
initialize: aString

	string := aString ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidPrefix class' category: 'Stack-Exercise'!
ValidPrefix class
	instanceVariableNames: ''!

!ValidPrefix class methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 02:13:44'!
canHandle: aPrefix

	^((aPrefix findString: ' ') = 0) or: aPrefix ~= ''! !

!ValidPrefix class methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 02:19:47'!
with: aPrefix
	
	^self new initialize: aPrefix! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 02:26:34'!
find: aPrefix
	| prefix |
	
	prefix := (Prefix allSubclasses detect:[:aClass | aClass canHandle: aPrefix]) with: aPrefix.
	^prefix findInStack: stack.


	

	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'a 6/7/2021 20:09:31'!
initializeSentenceFinder: aStack

	stack := aStack ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 00:43:35'!
prefixEmptyErrorDescription

	^ 'Prefix cannot be empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'a 6/10/2021 00:44:07'!
prefixWithSpacesErrorDescription

	^ 'Prefix cannot contain blank spaces'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'a 6/7/2021 20:09:43'!
with: aStack

	^self new initializeSentenceFinder: aStack ! !
