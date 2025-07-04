Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'uncoveredCards',
		'capturedPairs'
	],
	#category : #MemoryCards
}

{ #category : #'as yet unclassified' }
Player >> capturedPairs [
	^capturedPairs
]

{ #category : #'as yet unclassified' }
Player >> forgetUncoveredCards [
	uncoveredCards removeAll
]

{ #category : #'as yet unclassified' }
Player >> gtDisplayOn: stream [
	stream nextPutAll: name
]

{ #category : #'as yet unclassified' }
Player >> hasSameUncoveredCards [
	^ uncoveredCards first content = uncoveredCards last content
]

{ #category : #'as yet unclassified' }
Player >> initialize [
	super initialize.
	uncoveredCards := OrderedCollection new.
	capturedPairs := OrderedCollection new
]

{ #category : #'as yet unclassified' }
Player >> name [
	^ name
]

{ #category : #accessing }
Player >> name: aString [ 
	name:= aString
]

{ #category : #'as yet unclassified' }
Player >> takeUncoveredCards [
	capturedPairs add: uncoveredCards copy.
	self forgetUncoveredCards
]

{ #category : #'as yet unclassified' }
Player >> uncover: aCard [
	aCard covered: false.
	uncoveredCards add: aCard.
]

{ #category : #'as yet unclassified' }
Player >> uncoveredCards [
	^ uncoveredCards
]
