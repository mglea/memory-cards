Class {
	#name : #Card,
	#superclass : #Object,
	#instVars : [
		'isCovered',
		'content'
	],
	#category : #MemoryCards
}

{ #category : #'as yet unclassified' }
Card >> content [
	^ content
]

{ #category : #accessing }
Card >> content: aString [ 
    content:= aString
]

{ #category : #accessing }
Card >> covered: aBoolean [
	isCovered:= aBoolean
]

{ #category : #'as yet unclassified' }
Card >> flip [
	isCovered := isCovered not
]

{ #category : #'as yet unclassified' }
Card >> initialize [
	super initialize.
	isCovered := true
]

{ #category : #'as yet unclassified' }
Card >> isCovered [
	^isCovered 
]

{ #category : #'as yet unclassified' }
Card >> string [
	^ content
]
