Class {
	#name : #Card,
	#superclass : #Object,
	#instVars : [
		'isCovered',
		'isCaptured'
	],
	#category : #MemoryCards
}

{ #category : #'as yet unclassified' }
Card >> beCaptured [
	isCaptured := true
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
	isCovered := true.
	isCaptured := false
]

{ #category : #'as yet unclassified' }
Card >> isCaptured [
	^ isCaptured
]

{ #category : #'as yet unclassified' }
Card >> isCovered [
	^isCovered 
]
