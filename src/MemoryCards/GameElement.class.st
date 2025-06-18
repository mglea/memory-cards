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
GameElement >> addBackgroundToCard: cardElement [
	1
		to: 20
		do: [ :x | 
			cardElement
				addChild: (BrLabel new
						aptitude: (BrGlamorousLabelAptitude new
								bold;
								foreground: Color lightOrange);
						text: 'PullOutPullOutPullOutPullOutPullOut';
						transformDo: [ :aBuilder | aBuilder rotateBy: -45 ]) ]
]

{ #category : #accessing }
GameElement >> addCardsTo: container [
	self game board cards
		do: [ :eachCard | 
			| cardElement |
			cardElement := BrVerticalPane new
					background: Color white;
					addAptitude: BrShadowAptitude;
					alignCenter.
			cardElement
				when: BlClickEvent
				do: [ :e | 
					eachCard isCovered
						ifTrue: [ self game currentPlayer uncover: eachCard.
							self game currentPlayer uncoveredCards size = 2
								ifTrue: [ cardElement
										enqueueTask: (BlDelayedTaskAction new
												delay: 1 seconds;
												action: [ self game nextTurn.
													self createGame ]) ].
							self createGame ] ].
			eachCard isCovered
				ifTrue: [ self addBackgroundToCard: cardElement ]
				ifFalse: [ eachCard addCardContentToElement: cardElement ].
			cardElement margin: (BlInsets all: 25).
			cardElement size: 50 @ 50.
			container addChild: cardElement ]
]

{ #category : #accessing }
GameElement >> addPlayersTo: playersContainer [
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
			playersContainer addChild: playerContainer ]
]

{ #category : #accessing }
GameElement >> createGame [
	| playersContainer boardContainer |
	gameContainer removeChildren.
	boardContainer := BlElement new
			background: Color white;
			size: 400 @ 400;
			layout: BlFlowLayout new;
			margin: (BlInsets all: 20);
			aptitude: BrShadowAptitude new beLarge.
	game board cards isEmpty
		ifTrue: [ | winner |
			winner := (game players copy
					sort: [ :x :y | x capturedPairs size > y capturedPairs size ]) first.
			boardContainer
				addChild: (BrVerticalPane new
						matchParent;
						alignCenter;
						addChild: (BrLabel new
								aptitude: (BrGlamorousLabelAptitude new fontSize: 20);
								text: 'Player ' , winner name , ' won!')) ]
		ifFalse: [ self addCardsTo: boardContainer ].
	playersContainer := BrVerticalPane new
			margin: (BlInsets all: 20);
			vMatchParent;
			hFitContent.
	self addPlayersTo: playersContainer.
	gameContainer addChild: playersContainer.
	gameContainer addChild: boardContainer
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
