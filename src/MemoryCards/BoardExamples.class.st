Class {
	#name : #BoardExamples,
	#superclass : #Object,
	#category : #MemoryCards
}

{ #category : #'as yet unclassified' }
BoardExamples >> boardWith1CardUncovered [
	<gtExample>
	| board |
	board:= self boardwith4Cards.
	board cards second covered: false.
	board cards third covered: false.
	^ board
]

{ #category : #'as yet unclassified' }
BoardExamples >> boardwith4Cards [
	<gtExample>
	| one1 one2 two1 two2 board |
	one1 := TextCard new content: 'one'.
	one2 := TextCard new content: 'one'.
	two1 := TextCard new content: 'two'.
	two2 := TextCard new content: 'two'.
	board := Board new.
	board addCard: one1.
	board addCard: one2.
	board addCard: two1.
	board addCard: two2.
	self assert: board cards size equals: 4.
	^ board
]
