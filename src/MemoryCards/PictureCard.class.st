Class {
	#name : #PictureCard,
	#superclass : #Card,
	#instVars : [
		'pictureFile'
	],
	#category : #MemoryCards
}

{ #category : #accessing }
PictureCard >> addCardContentToElement: cardElement [
	cardElement
		addChild: (BrAsyncFileWidget new file: pictureFile) matchParent
]

{ #category : #'as yet unclassified' }
PictureCard >> content [
	^ pictureFile fullName
]

{ #category : #'as yet unclassified' }
PictureCard >> gtDisplayOn: stream [
	stream nextPutAll: pictureFile basename
]

{ #category : #initialization }
PictureCard >> initialize [
	super initialize
]

{ #category : #accessing }
PictureCard >> pictureFile: aFilereference [
	pictureFile:= aFilereference
]
