Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'board',
		'players',
		'currentPlayer',
		'nextPlayer'
	],
	#category : #MemoryCards
}

{ #category : #accessing }
Game >> addPlayer: aPlayer [ 
	players add: aPlayer.
]

{ #category : #accessing }
Game >> asElement [
	^ GameElement new
		game: self;
		createGame
]

{ #category : #accessing }
Game >> board [
	^board
]

{ #category : #accessing }
Game >> board: aString [
	board := aString
]

{ #category : #'as yet unclassified' }
Game >> currentPlayer [
	^ currentPlayer isNil
		ifTrue: [ currentPlayer := players first ]
		ifFalse: [ currentPlayer ]
]

{ #category : #'as yet unclassified' }
Game >> currentPlayer: aPlayer [ 
	currentPlayer := aPlayer
]

{ #category : #views }
Game >> gtGameFor: aView [
	<gtView>
	^ aView explicit
		title: 'Game';
		stencil: [ self asElement ]
]

{ #category : #views }
Game >> gtPlayersFor: aView [
	<gtView>
	players ifNil: [ ^ aView empty ].
	^ aView columnedList
		title: 'Players';
		items: [ players ];
		column: 'Players' text: [ :each | each gtDisplayString ];
		column: 'Current'
			text: [ :each | each = self currentPlayer ifTrue: [ ' ;)' ] ifFalse: [ ':(' ] ];
		column: 'uncoveredCards' text: [ :each | each uncoveredCards size ];
		column: 'capturedPairs' text: [ :each | each capturedPairs size ];
		column: 'Card on the Board' text: [ :each | self board cards size ]
]

{ #category : #'as yet unclassified' }
Game >> initialize [
	super initialize.
	players := OrderedCollection new
]

{ #category : #'as yet unclassified' }
Game >> isFinished [
	^ board cards isEmpty
]

{ #category : #'as yet unclassified' }
Game >> nextPlayer [
^currentPlayer=players last
ifTrue:[players first]
ifFalse: [players after: currentPlayer]

	"| currentPlayerIndex |
	currentPlayerIndex := players indexOf: currentPlayer.
	^ currentPlayerIndex = players size
		ifTrue: [ players first ]
		ifFalse: [ players at: currentPlayerIndex + 1 ]"
]

{ #category : #'as yet unclassified' }
Game >> nextTurn [
	self currentPlayer hasSameUncoveredCards
		ifTrue: [ board removeCards: self currentPlayer uncoveredCards.
			currentPlayer takeUncoveredCards ]
		ifFalse: [ self currentPlayer forgetUncoveredCards.
			self currentPlayer: self nextPlayer.
			board cards do: [ :eachCard | eachCard covered: true ] ]
]

{ #category : #'as yet unclassified' }
Game >> players [
	^ players
]
