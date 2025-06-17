Class {
	#name : #BoardExamples,
	#superclass : #Object,
	#category : #MemoryCards
}

{ #category : #'as yet unclassified' }
BoardExamples >> boardWith16PictureCards [
	<gtExample>
	| board jpegs |
	board := Board new.
	jpegs := 'pharo-local/iceberg/mglea/memory-cards/res/pullout' asFileReference
			files select: [ :eachFile | eachFile extension = 'jpeg' ].
	(jpegs first: 8)
		do: [ :eachFile | 
			board addCard: (PictureCard new pictureFile: eachFile).
			board addCard: (PictureCard new pictureFile: eachFile) ].
	self assert: board cards size equals: 16.
	^ board
]

{ #category : #'as yet unclassified' }
BoardExamples >> boardWith1CardUncovered [
	<gtExample>
	| board |
	board:= self boardwith4TextCards.
	board cards second covered: false.
	board cards third covered: false.
	^ board
]

{ #category : #'as yet unclassified' }
BoardExamples >> boardwith4TextCards [
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
