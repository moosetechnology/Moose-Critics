"
A MiCriticBrowserModelTest is a test class for testing the behavior of MiCriticBrowserModel
"
Class {
	#name : #MiCriticBrowserModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'rule',
		'stubRule',
		'deadRule',
		'stubEntity',
		'deadEntity'
	],
	#category : #'MooseIDE-CriticBrowser-Tests'
}

{ #category : #initialization }
MiCriticBrowserModelTest >> setUp [
	model := MiCriticBrowserModel new.
	stubRule := FamixCBRule named: 'test1' on: (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isStub ]'). 
	deadRule := FamixCBRule named: 'test2' on: (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isDead ]').
	stubEntity := FamixStMethod named: 'test1'.
	deadEntity := FamixStMethod named: 'test2'.
	stubEntity isStub: true
]

{ #category : #tests }
MiCriticBrowserModelTest >> testAddRule [
	model addRule: 'test'.
	self assert: model rules size equals: 0.
	model addRule: stubRule.
	self assert: model rules size equals: 1 
]

{ #category : #test }
MiCriticBrowserModelTest >> testDeleteRule [
	model addRule: stubRule.
	model runRules.
	model deleteRule: stubRule.
	self assert: model rules size equals: 0.
	self assert: (model output includesKey: stubRule) equals: false
]

{ #category : #test }
MiCriticBrowserModelTest >> testGetCompleteOutput [
	model setEntities: { stubEntity. deadEntity } asMooseGroup.
	model addRule: stubRule; addRule: deadRule.
	model runRules.
	self assert: model getCompleteOutput class equals: FamixCBViolationGroup.
	self assertCollection: model getCompleteOutput allEntities includesAll: { stubEntity. deadEntity }  
	
]

{ #category : #test }
MiCriticBrowserModelTest >> testOutputOf [
	model setEntities: { stubEntity. deadEntity } asMooseGroup.
	model addRule: stubRule.
	model runRules.
	self assert: (model outputOf: stubRule) class equals: FamixCBViolationGroup.
	self assertCollection: model getCompleteOutput allEntities includesAll: { stubEntity }
]

{ #category : #test }
MiCriticBrowserModelTest >> testOutputOfCollection [
	model setEntities: { stubEntity. deadEntity } asMooseGroup.
	model addRule: stubRule; addRule: deadRule.
	model runRules.
	self assert: (model outputOfCollection: { stubRule. deadRule }) class equals: FamixCBViolationGroup.
	self assertCollection: (model outputOfCollection: { stubRule. deadRule }) allEntities includesAll: { stubEntity. deadEntity }
]

{ #category : #test }
MiCriticBrowserModelTest >> testRemoveRuleResult [
	model addRule: stubRule.
	self assert: (model output includesKey: stubRule) equals: false.
	model setEntities: { } asMooseGroup.
	model runRules.
	self assert: (model output includesKey: stubRule) equals: true.
	model removeRuleResult: stubRule.
	self assert: (model output includesKey: stubRule) equals: false.
	
]

{ #category : #tests }
MiCriticBrowserModelTest >> testRunRules [	
	model setEntities: { stubEntity. deadEntity } asMooseGroup; addRule: stubRule; addRule: deadRule.
	model runRules.
	self assert: model output size equals: 2.
	self assertCollection: ((model outputOf: stubRule) allEntities) includesAll: {stubEntity}.
	self assertCollection: ((model outputOf: deadRule) allEntities) includesAll: { stubEntity. deadEntity }.
	
]

{ #category : #test }
MiCriticBrowserModelTest >> testSetEntities [
	| entityA entityB group |
	entityA := FamixStMethod new. 
	entityA name: 'a'.
	entityB := FamixStMethod new.
	entityB name: 'b'.
	group := MooseGroup new.
	group add: entityB; add: entityA.
	
	model setEntities: entityA.
	self assertCollection: (model entities) includesAll: {entityA}.
	self assert: model entities class equals: MooseGroup.
	
	model setEntities: group.
	self assertCollection: (model entities) includesAll: group.
	self assert: model entities class equals: group class
	
]

{ #category : #test }
MiCriticBrowserModelTest >> testSetOutput [
	| entityA |
	entityA := FamixStMethod new. 
	entityA name: 'a'.
	
	model setEntities: entityA.
	
	self assert: (model entities at:1) equals: entityA.
	self assert: model entities class equals: MooseGroup
]
