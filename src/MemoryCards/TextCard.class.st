Class {
	#name : #TextCard,
	#superclass : #Card,
	#instVars : [
		'content'
	],
	#category : #MemoryCards
}

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
