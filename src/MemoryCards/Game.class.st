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
	| playersContainer boardElement gameContainer cardElement container |
	gameContainer := BrHorizontalPane new fitContent.
	container := BlElement new.
	container background: Color lightOrange.
	container size: 400 @ 400.
	container layout: BlFlowLayout new.
	board cards
		do: [ :eachCard | 
			cardElement := BrVerticalPane new
					background: Color white;
					alignCenter.
			cardElement when: BlClickEvent do: [ :e |self currentPlayer uncover: eachCard ].
			eachCard isCovered
				ifFalse: [ cardElement
						addChild: (BrLabel new
								aptitude: BrGlamorousLabelAptitude;
								text: eachCard string) ].
			cardElement margin: (BlInsets all: 25).
			cardElement size: 50 @ 50.
			container addChild: cardElement ].
	boardElement := container.
	boardElement
		margin: (BlInsets all: 20);
		aptitude: BrShadowAptitude new beLarge.
	playersContainer := BrVerticalPane new
			margin: (BlInsets all: 20);
			vMatchParent;
			hFitContent.
	self players
		do: [ :eachPlayer | 
			| playerContainer playerlabel |
			playerContainer := BrVerticalPane new
					vMatchParent;
					hFitContent.
			playerlabel := BrLabel new
					text: 'Player: ' , eachPlayer name;
					aptitude: (BrGlamorousLabelAptitude new
							fontSize: 20;
							highlight: (eachPlayer = self currentPlayer
									ifTrue: [ Color lightOrange ]
									ifFalse: [ Color transparent ])).
			playerContainer addChild: playerlabel.
			playerContainer
				addChild: (BrLabel new
						text: 'Pairs: ' , eachPlayer capturedPairs size asString;
						aptitude: BrGlamorousLabelAptitude new).
			playersContainer addChild: playerContainer ].
	gameContainer addChild: playersContainer.
	gameContainer addChild: boardElement.
	^ gameContainer
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
		text:[ :each | each = self currentPlayer ifTrue: [' ;)'] ifFalse: [ ':(']]
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
		ifFalse: [ self currentPlayer: self nextPlayer.
			board cards do: [ :eachCard | eachCard covered: true ] ]
]

{ #category : #'as yet unclassified' }
Game >> players [
	^ players
]
