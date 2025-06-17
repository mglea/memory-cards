Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #MemoryCards
}

{ #category : #accessing }
Board >> addCard: aCard [ 
	cards add: aCard
]

{ #category : #'as yet unclassified' }
Board >> card [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
Board >> cards [
	^ cards
]

{ #category : #accessing }
Board >> cards: anObject [

	cards := anObject
]

{ #category : #views }
Board >> gtCardsFor: aView [
	<gtView>
	cards ifNil: [ ^ aView empty ].
	^ aView columnedList
		title: 'Cards';
		items: [ cards ];
		column: 'Cards' text: [ :each | each gtDisplayString ];
		column: 'Covered' text: [ :each | each isCovered ]
]

{ #category : #'as yet unclassified' }
Board >> initialize [
	super initialize.
	cards := OrderedCollection new
]

{ #category : #'as yet unclassified' }
Board >> removeCards: aCollection [
	aCollection do: [ :eachCard | cards remove: eachCard ifAbsent: [  ] ]
]

{ #category : #accessing }
Board >> shuffleCards [
	^ self cards: self cards shuffle
]
