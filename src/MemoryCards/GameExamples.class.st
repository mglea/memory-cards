Class {
	#name : #GameExamples,
	#superclass : #Object,
	#category : #MemoryCards
}

{ #category : #'as yet unclassified' }
GameExamples >> emptyGame [
	<gtExample>
	| game playerB playerA board |
	game := Game new.
	board := BoardExamples new boardwith4TextCards.
	game board: board.
	playerA := Player new name: 'A'.
	playerB := Player new name: 'B'.
	game addPlayer: playerA.
	game addPlayer: playerB.
	self assert: game currentPlayer equals: playerA.
	self assert: game nextPlayer equals: playerB.
	^ game
]

{ #category : #'as yet unclassified' }
GameExamples >> emptyGameWith16PictureCards [
	<gtExample>
	| game playerB playerA board |
	game := Game new.
	board := BoardExamples new boardWith16PictureCards.
	game board: board.
	playerA := Player new name: 'A'.
	playerB := Player new name: 'B'.
	game addPlayer: playerA.
	game addPlayer: playerB.
	self assert: game currentPlayer equals: playerA.
	self assert: game nextPlayer equals: playerB.
	^ game
]

{ #category : #'as yet unclassified' }
GameExamples >> gameWithPlayerAFinishing [
	"Satz= Object, Message, evtl. Argument"

	<gtExample>
	| game |
	game := self gameWithPlayerAMatchingAndNextTurn.
	game currentPlayer uncover:game board cards first .
	game currentPlayer uncover:game board cards second .
	game nextTurn.
	self assert: game board cards size equals: 0 .
	self assert: game currentPlayer capturedPairs size equals: 2.
	self assert: game currentPlayer uncoveredCards size equals: 0.
	self assert: game isFinished.
	^ game
]

{ #category : #'as yet unclassified' }
GameExamples >> gameWithPlayerAMatchingAndNextTurn [
	"Satz= Object, Message, evtl. Argument"

	<gtExample>
	| game |
	game := self emptyGame.
	game currentPlayer uncover:game board cards first .
	game currentPlayer uncover:game board cards second .
	self assert: game board cards size equals: 4 .
	self assert: game currentPlayer capturedPairs size equals: 0.
	self assert: game currentPlayer uncoveredCards size equals: 2.
	game nextTurn.
	self assert: game board cards size equals: 2 .
	self assert: game currentPlayer capturedPairs size equals: 1.
	self assert: game currentPlayer uncoveredCards size equals: 0.
	self assert: game isFinished not.
	^ game
]

{ #category : #'as yet unclassified' }
GameExamples >> gameWithPlayerANotMatchingAndNextTurn [
	"Satz= Object, Message, evtl. Argument"

	<gtExample>
	| game initialPlayer |
	game := self emptyGame.
	initialPlayer := game currentPlayer.
	game currentPlayer uncover:game board cards first .
	game currentPlayer uncover:game board cards third .
	game nextTurn.
	game board cards do: [:eachCard | self assert: eachCard isCovered ].
	self assert: initialPlayer uncoveredCards size = 0.
	^ game
]

{ #category : #'as yet unclassified' }
GameExamples >> gameWithPlayerBAsCurrent [
	<gtExample>
	| game |
	game := self emptyGame.
	game currentPlayer: game players last.
	self assert: game nextPlayer equals: game players first.
	^ game
]
