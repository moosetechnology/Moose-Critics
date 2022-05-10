Class {
	#name : #MiCriticBrowserFQQuery,
	#superclass : #MiCriticBrowserAbstractQuery,
	#category : #'MooseIDE-CriticBrowser'
}

{ #category : #running }
MiCriticBrowserFQQuery >> runOn: aGroupOfEntities [
"runs the query on the input group of entities, and returns the entities validating the query"
	 ^ nil
]

{ #category : #running }
MiCriticBrowserFQQuery >> runOnCollection: aCollection [
	^ (query parent class = FQRootQuery or: [ query parent isNil ])
		ifTrue: [ query runOn: aCollection ]
		ifFalse: [ | parentQuery | parentQuery := self class on: query parent.
											query runOn: (parentQuery runOnCollection: aCollection) ]
]
