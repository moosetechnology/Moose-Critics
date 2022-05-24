Class {
	#name : #FamixCBCustomDTORule,
	#superclass : #FamixCBRule,
	#category : #'Famix-CriticBrowser-Entities'
}

{ #category : #ston }
FamixCBCustomDTORule class >> stonAllInstVarNames [
	^ super stonAllInstVarNames \ #(#mooseID #mooseModel #cache #entityAttributes #violations)
]

{ #category : #initialization }
FamixCBCustomDTORule >> getContextFrom: aCollection [
	
	^ self getDTOFrom: (self getEndpointsFrom: (self getServicesFrom: aCollection))
]

{ #category : #accessing }
FamixCBCustomDTORule >> getDTOFrom: aCollectionOfEndpoints [
	| selectOnlyClasses sizePrev dtos |
	selectOnlyClasses := [ :a | a declaredType isClass and: [ (self notDTOTypes includes: a declaredType name) not ] ].
	
	dtos := MooseGroup new.
	dtos := dtos | aCollectionOfEndpoints collect: [ :e | e declaredType ] thenSelect: [ :c | c isClass and: [ (self notDTOTypes includes: c name) not ] ].
	dtos := dtos | (((aCollectionOfEndpoints flatCollect: [ :e | e parameters ]) select: selectOnlyClasses) collect: [ :p | p declaredType ]).
	
	[ 
	sizePrev := dtos size.
	dtos := dtos | (((dtos flatCollect: [ :d | d attributes ]) select: selectOnlyClasses) collect: [ :a | a declaredType ])
	] doWhileTrue: [ sizePrev < dtos size ].
	^ dtos

	
]

{ #category : #accessing }
FamixCBCustomDTORule >> getEndpointsFrom: aCollectionOfServices [

	^ (aCollectionOfServices flatCollect: [ :s | s methods ]) select: [ :m | m declaredExceptions anySatisfy: [ :e | e exceptionClass name = 'RemoteException' ] ]
]

{ #category : #accessing }
FamixCBCustomDTORule >> getServicesFrom: aCollection [

	 ^ aCollection select: [ :e | e isClass and: [ e isInterface and: [ e inheritsFromClassNamed: 'Remote' ] ] ]
]

{ #category : #'as yet unclassified' }
FamixCBCustomDTORule >> notDTOTypes [
	^ { 'Integer'. 'Float'. 'Double'. 'Short'. 'Long'. 'Char'. 'Boolean'. 'Byte'. 'String'. 'Date' }
]

{ #category : #running }
FamixCBCustomDTORule >> runOn: aCollection [
	^ ((self query runOnCollection: (self getContextFrom: aCollection)) collect: 
		[ :each | (FamixCBViolation rule: self violatedBy: each) ]) asMooseGroup specialize.
]
