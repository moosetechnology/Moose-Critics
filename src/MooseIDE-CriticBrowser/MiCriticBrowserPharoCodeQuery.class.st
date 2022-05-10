Class {
	#name : #MiCriticBrowserPharoCodeQuery,
	#superclass : #MiCriticBrowserAbstractQuery,
	#category : #'MooseIDE-CriticBrowser'
}

{ #category : #accessing }
MiCriticBrowserPharoCodeQuery >> query: aString [
	query := self stringToFullBlockClosure: aString
]

{ #category : #running }
MiCriticBrowserPharoCodeQuery >> runOn: anEntity [
"runs the query on the input group of entities, and returns the entities validating the query"
	^ query value: anEntity 
]

{ #category : #converting }
MiCriticBrowserPharoCodeQuery >> stringToFullBlockClosure: aString [
"converts a string to an block (to run the query)"
	^ Smalltalk compiler evaluate: aString
]
