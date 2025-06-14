Class {
	#name : #BaselineOfMemoryCards,
	#superclass : #BaselineOf,
	#category : #BaselineOfMemoryCards
}

{ #category : #loading }
BaselineOfMemoryCards class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'memory-cards' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfMemoryCards >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'MemoryCards'
		]
]
