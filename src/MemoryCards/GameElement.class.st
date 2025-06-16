Class {
	#name : #GameElement,
	#superclass : #BlElement,
	#instVars : [
		'game',
		'gameContainer'
	],
	#category : #MemoryCards
}

{ #category : #accessing }
GameElement >> createGame [
	| cardElement playersContainer boardElement container |
	gameContainer removeChildren.
	container := BlElement new.
	container background: Color lightOrange.
	container size: 400 @ 400.
	container layout: BlFlowLayout new.
	self game board cards
		do: [ :eachCard | 
			cardElement := BrVerticalPane new
					background: Color white;
					alignCenter.
			cardElement
				when: BlClickEvent
				do: [ :e | 
					eachCard isCovered
						ifTrue: [ self game currentPlayer uncover: eachCard.
							self game currentPlayer uncoveredCards size = 2
								ifTrue: [
									self game nextTurn ].
							self createGame ] ].
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
	self game players
		do: [ :eachPlayer | 
			| playerContainer playerlabel |
			playerContainer := BrVerticalPane new
					vMatchParent;
					hFitContent.
			playerlabel := BrLabel new
					text: 'Player: ' , eachPlayer name;
					aptitude: (BrGlamorousLabelAptitude new
							fontSize: 20;
							highlight: (eachPlayer = self game currentPlayer
									ifTrue: [ Color lightOrange ]
									ifFalse: [ Color transparent ])).
			playerContainer addChild: playerlabel.
			playerContainer
				addChild: (BrLabel new
						text: 'Pairs: ' , eachPlayer capturedPairs size asString;
						aptitude: BrGlamorousLabelAptitude new).
			playersContainer addChild: playerContainer ].
	gameContainer addChild: playersContainer.
	gameContainer addChild: boardElement
]

{ #category : #accessing }
GameElement >> game [
	^ game
]

{ #category : #accessing }
GameElement >> game: anObject [
	^ game := anObject
]

{ #category : #accessing }
GameElement >> initialize [
	super initialize.
	self constraintsDo: [:c | c horizontal fitContent. c vertical fitContent].
	self layout: BlLinearLayout new.
	gameContainer := BrHorizontalPane new fitContent.
	self addChild: gameContainer
]
