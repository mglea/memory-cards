Class {
	#name : #TextCard,
	#superclass : #Card,
	#instVars : [
		'content'
	],
	#category : #MemoryCards
}

{ #category : #accessing }
TextCard >> addCardContentToElement: cardElement [
	cardElement
		addChild: (BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: self content)
]

{ #category : #'as yet unclassified' }
TextCard >> content [
	^ content
]

{ #category : #accessing }
TextCard >> content: aString [ 
    content:= aString
]

{ #category : #'as yet unclassified' }
TextCard >> gtDisplayOn: stream [
	stream nextPutAll: self content.
]

{ #category : #'as yet unclassified' }
TextCard >> string [
	^ content
]
