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
	board := BoardExamples new boardwith4Cards. game board: board.
	playerA := Player new name: 'A'.
	playerB := Player new name: 'B'.
	game addPlayer: playerA.
	game addPlayer: playerB.
	self assert: game currentPlayer equals: playerA.
	self assert: game nextPlayer equals: playerB.
	^ game
]

{ #category : #'as yet unclassified' }
GameExamples >> gameWithPlayerAAndNextTurn [
	"Satz= Object, Message, evtl. Argument"

	<gtExample>
	| game |
	game := self emptyGame.
	game currentPlayer uncover:game board cards first .
	game currentPlayer uncover:game board cards third .
	game nextTurn.
	game board cards do: [:eachCard | self assert: eachCard isCovered ].
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
