Class {
	#name : #FamixCBRule,
	#superclass : #FamixCBEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#instVars : [
		'#summary => FMProperty',
		'#violations => FMMany type: #FamixCBViolation opposite: #violatedRule'
	],
	#category : #'Famix-CriticBrowser-Entities-Entities'
}

{ #category : #meta }
FamixCBRule class >> annotation [

	<FMClass: #Rule super: #FamixCBEntity>
	<package: #'Famix-CriticBrowser-Entities'>
	<generated>
	^self
]

{ #category : #adding }
FamixCBRule >> addViolation: anObject [
	<generated>
	^ self violations add: anObject
]

{ #category : #accessing }
FamixCBRule >> summary [

	<FMProperty: #summary type: #String>
	<generated>
	<FMComment: 'A rule can have an explanatory summary'>
	^ summary
]

{ #category : #accessing }
FamixCBRule >> summary: anObject [
	<generated>
	summary := anObject
]

{ #category : #accessing }
FamixCBRule >> violations [
	"Relation named: #violations type: #FamixCBViolation opposite: #violatedRule"

	<generated>
	<FMComment: 'Every violation of this rule.'>
	<derived>
	^ violations
]

{ #category : #accessing }
FamixCBRule >> violations: anObject [

	<generated>
	violations value: anObject
]
