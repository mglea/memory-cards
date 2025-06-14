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

{ #category : #accessing }
Board >> asElement [
	| cardElement container |
	container := BlElement new.
	container background: Color lightOrange.
	container size: 400 @ 400.
	container layout: BlFlowLayout new.
	cards
		do: [ :eachCard | 
			cardElement := BrVerticalPane new
					background: Color white;
					alignCenter.
			cardElement when: BlClickEvent do: [ :e| eachCard flip ].
			eachCard isCovered
				ifFalse: [ cardElement
						addChild: (BrLabel new
								aptitude: BrGlamorousLabelAptitude;
								text: eachCard string) ].
			cardElement margin: (BlInsets all: 25).
			cardElement size: 50 @ 50.
			container addChild: cardElement ].
	^ container
]

{ #category : #'as yet unclassified' }
Board >> card [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
Board >> cards [
	^ cards
]

{ #category : #views }
Board >> gtBoardElementFor: aView [
	<gtView>
	^ aView explicit
		title: 'Board';
		stencil: [ self asElement ]
]

{ #category : #views }
Board >> gtCardsFor: aView [
	<gtView>
	cards ifNil: [ ^ aView empty ].
	^ aView columnedList
		title: 'Cards';
		items: [ cards ];
		column: 'Cards' text: [ :each | each string ];
		column: 'Covered' text: [ :each | each isCovered ]
]

{ #category : #'as yet unclassified' }
Board >> initialize [
	super initialize.
	cards := OrderedCollection new
]
