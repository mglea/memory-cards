Class {
	#name : #Card,
	#superclass : #Object,
	#instVars : [
		'isCovered'
	],
	#category : #MemoryCards
}

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
