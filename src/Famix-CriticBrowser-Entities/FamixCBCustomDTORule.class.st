Class {
	#name : #FamixCBCustomDTORule,
	#superclass : #FamixCBRule,
	#instVars : [
		'services',
		'endpoints',
		'dtos'
	],
	#category : #'Famix-CriticBrowser-Entities'
}

{ #category : #ston }
FamixCBCustomDTORule class >> stonAllInstVarNames [
	^ super stonAllInstVarNames \ #(#mooseID #mooseModel #cache #entityAttributes #violations services endpoints dtos)
]

{ #category : #accessing }
FamixCBCustomDTORule >> dtos [

	^ dtos
]

{ #category : #accessing }
FamixCBCustomDTORule >> endpoints [

	^ endpoints
]

{ #category : #'as yet unclassified' }
FamixCBCustomDTORule >> notDTOTypes [
	^ { 'Integer'. 'Float'. 'Double'. 'Short'. 'Long'. 'Char'. 'Boolean'. 'Byte'. 'String'. 'Date' }
]

{ #category : #running }
FamixCBCustomDTORule >> runOn: aCollection [
	self setContextFrom: aCollection.
	^ ((self query runOnCollection: self dtos) collect: 
		[ :each | (FamixCBViolation rule: self violatedBy: each) ]) asMooseGroup specialize.
]

{ #category : #accessing }
FamixCBCustomDTORule >> services [

	^ services
]

{ #category : #initialization }
FamixCBCustomDTORule >> setContextFrom: aCollection [
	
	self setServicesFrom: aCollection.
	self setEndpoints.
	self setDTOs
]

{ #category : #accessing }
FamixCBCustomDTORule >> setDTOs [
	| sizePrev |
	dtos := MooseGroup new.
	dtos := dtos | endpoints collect: [ :e | e declaredType ] thenSelect: [ :c | c isClass and: [ (self notDTOTypes includes: c name) not ] ].
	dtos := dtos | (((endpoints flatCollect: [ :e | e parameters ]) select: [ :d | d declaredType isClass and: [ (self notDTOTypes includes: d declaredType name) not ] ]) collect: [ :p | p declaredType ]).
	
	[ 
	sizePrev := dtos size.
	dtos := dtos | (((dtos flatCollect: [ :d | d attributes ]) select: [ :a | a declaredType isClass and: [ (self notDTOTypes includes: a declaredType name) not ] ]) collect: [ :a | a declaredType ])
	] doWhileTrue: [ sizePrev < dtos size ].

	
]

{ #category : #accessing }
FamixCBCustomDTORule >> setEndpoints [

	endpoints := (services flatCollect: [ :s | s methods ]) select: [ :m | m declaredExceptions anySatisfy: [ :e | e exceptionClass name = 'RemoteException' ] ]
]

{ #category : #accessing }
FamixCBCustomDTORule >> setServicesFrom: aCollection [

	 services := aCollection select: [ :e | e isClass and: [ e isInterface and: [ e inheritsFromClassNamed: 'Remote' ] ] ]
]
