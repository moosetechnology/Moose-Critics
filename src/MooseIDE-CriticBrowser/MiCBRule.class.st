Class {
	#name : #MiCBRule,
	#superclass : #Object,
	#instVars : [
		'name',
		'summary',
		'query'
	],
	#category : #'MooseIDE-CriticBrowser'
}

{ #category : #'instance creation' }
MiCBRule class >> named: aString on: aQuery [
	^ self new
		name: aString;
		query: aQuery;
		yourself
]

{ #category : #'instance creation' }
MiCBRule class >> named: aString on: aQuery summary: aSummary [
	^ self new
		name: aString;
		query: aQuery;
		summary: aSummary;
		yourself
]

{ #category : #accessing }
MiCBRule >> name [

	^ name
]

{ #category : #accessing }
MiCBRule >> name: anObject [

	name := anObject
]

{ #category : #accessing }
MiCBRule >> query [

	^ query
]

{ #category : #accessing }
MiCBRule >> query: aQuery [

	(aQuery class inheritsFrom: MiCriticBrowserAbstractQuery) 
		ifTrue: [ query := aQuery ]
		ifFalse: [ self error: NotAValidQuery signal ]
]

{ #category : #running }
MiCBRule >> runOn: aCollection [
	^ ((self query runOnCollection: aCollection) collect: 
		[ :each | (MiCBViolation rule: self violatedBy: each) ]) asMooseGroup specialize.
]

{ #category : #accessing }
MiCBRule >> summary [

	^ summary
]

{ #category : #accessing }
MiCBRule >> summary: anObject [

	summary := anObject
]
