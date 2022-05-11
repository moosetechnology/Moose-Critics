"
I am MiCBViolation, representing a violation of a rule, pointing both on the violated rule and on the entity responsible for the violation.
As I am a MooseEntity, I can be propagated to other MooseIDE browsers, like the entities exporter, allowing the production of a file with every violation of a given rule.
"
Class {
	#name : #MiCBViolation,
	#superclass : #MooseEntity,
	#instVars : [
		'violatedRule',
		'violatingEntity'
	],
	#category : #'MooseIDE-CriticBrowser'
}

{ #category : #initialization }
MiCBViolation class >> rule: aMiCBRule violatedBy: anEntity [
	^ self new 
		violatedRule: aMiCBRule;
		violatingEntity: anEntity;
		yourself
]

{ #category : #accessing }
MiCBViolation >> violatedRule [

	^ violatedRule
]

{ #category : #accessing }
MiCBViolation >> violatedRule: anObject [

	violatedRule := anObject
]

{ #category : #accessing }
MiCBViolation >> violatingEntity [

	^ violatingEntity
]

{ #category : #accessing }
MiCBViolation >> violatingEntity: anObject [

	violatingEntity := anObject
]
