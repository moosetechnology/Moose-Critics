"
A MiCBViolationGroupTest is a test class for testing the behavior of MiCBViolationGroup
"
Class {
	#name : #MiCBViolationGroupTest,
	#superclass : #TestCase,
	#instVars : [
		'violation1',
		'violation2',
		'group'
	],
	#category : #'MooseIDE-CriticBrowser-Tests'
}

{ #category : #initialization }
MiCBViolationGroupTest >> setUp [ 
	violation1 := MiCBViolation rule: 'test' violatedBy: FamixJavaMethod new.
	violation2 := MiCBViolation rule: 'test2' violatedBy: FamixJavaAttribute new.
	group := { violation1. violation2 } asMooseGroup specialize.
]

{ #category : #test }
MiCBViolationGroupTest >> testAllViolatingEntitiesType [
	self assertCollection: group allViolatingEntitiesType includesAll: { FamixJavaMethod. FamixJavaAttribute }
]

{ #category : #test }
MiCBViolationGroupTest >> testAllWithViolatingEntitiesType [
	self assert: (group allWithViolatingEntitiesType: FamixJavaMethod) size equals: 1.
	self assertCollection: (group allWithViolatingEntitiesType: FamixJavaMethod) includesAll: { violation1 }.
	self assert: (group allWithViolatingEntitiesType: FamixJavaAttribute) size equals: 1.
	self assertCollection: (group allWithViolatingEntitiesType: FamixJavaAttribute) includesAll: { violation2 }.
]
