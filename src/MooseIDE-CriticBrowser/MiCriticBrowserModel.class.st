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
	#category : #'MooseIDE-CriticBrowser'
}

{ #category : #accessing }
MiCriticBrowserModel >> addRule: aRule [

	((aRule class inheritsFrom: FamixCBRule) or: [ aRule class = FamixCBRule ]) ifTrue: [ rules add: aRule ]
]

{ #category : #deleting }
MiCriticBrowserModel >> deleteRule: aFamixCBRule [

	(rules indexOf: aFamixCBRule) = 0 ifTrue: [ ^ self ].
	rules remove: aFamixCBRule.
	output removeKey: aFamixCBRule ifAbsent: [ ^ self ]
]

{ #category : #accessing }
MiCriticBrowserModel >> entities [

	^ entities
]

{ #category : #accessing }
MiCriticBrowserModel >> getCompleteOutput [
"returns violations of every rule"
	| result |
	result := FamixCBViolationGroup new.
	output do: [ :each | result := result , each ].
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
MiCriticBrowserModel >> outputOf: aFamixCBRule [
"returns violations for a given rule"
	(output includesKey: aFamixCBRule)
		ifTrue: [ ^ self output at: aFamixCBRule ]
]

{ #category : #accessing }
MiCriticBrowserModel >> outputOfCollection: aCollection [
"returns violations for a given set of rules"
	| result |
	result := FamixCBViolationGroup new.
	aCollection do: [ :rule | result := result , (self outputOf: rule) ].
	^ result 
]

{ #category : #removing }
MiCriticBrowserModel >> removeRuleResult: aRule [
	output removeKey: aRule ifAbsent: [  ].
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
	entities := aMooseObject isCollection
		ifTrue: [ aMooseObject allUsing: FamixTNamedEntity ]
		ifFalse: [ ({aMooseObject} asMooseGroup) allUsing: FamixTNamedEntity ].
]
