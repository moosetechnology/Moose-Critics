"
Model used by the MooseIDE Critic Browser.
"
Class {
	#name : #MiCriticBrowserModel,
	#superclass : #Object,
	#instVars : [
		'entities',
		'rules',
		'output'
	],
	#category : 'MooseIDE-CriticBrowser'
}

{ #category : #accessing }
MiCriticBrowserModel >> addRule: aRule [

	(aRule class = MiCBRule) ifTrue: [ rules add: aRule ]
]

{ #category : #accessing }
MiCriticBrowserModel >> entities [

	^ entities
]

{ #category : #accessing }
MiCriticBrowserModel >> getCompleteOutput [
	| result |
	result := MooseGroup new.
	output do: [ :each | result := result | each ].
	^ result
]

{ #category : #initialization }
MiCriticBrowserModel >> initialize [ 

	super initialize.
	entities := MooseGroup new.
	rules := OrderedCollection new.
	output := Dictionary new.
]

{ #category : #accessing }
MiCriticBrowserModel >> output [

	^ output
]

{ #category : #accessing }
MiCriticBrowserModel >> rules [

	^ rules
]

{ #category : #execution }
MiCriticBrowserModel >> runRules [
"run on the entities every query in the model, and stores in output the result of each query linked to a key (the query)"
	rules do: [ :each | output at: each put: (each runOn: entities) ].
	
]

{ #category : #accessing }
MiCriticBrowserModel >> setEntities: aMooseObject [
	aMooseObject isCollection
		ifTrue: [ entities := aMooseObject allUsing: FamixTNamedEntity ]
		ifFalse: [ entities := ({aMooseObject} asMooseGroup) allUsing: FamixTNamedEntity ].
]
