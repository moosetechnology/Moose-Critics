"
A MiCriticBrowserModelTest is a test class for testing the behavior of MiCriticBrowserModel
"
Class {
	#name : #MiCriticBrowserModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'MooseIDE-CriticBrowser-Tests'
}

{ #category : #initialization }
MiCriticBrowserModelTest >> setUp [
	model := MiCriticBrowserModel new.
]

{ #category : #tests }
MiCriticBrowserModelTest >> testAddRule [
	model addRule: 'test'.
	self assert: model rules size equals: 0.
	
	model addRule: (MiCBRule named: 'test' on: MiCriticBrowserPharoCodeQuery new).
	self assert: model rules size equals: 1 
]

{ #category : #test }
MiCriticBrowserModelTest >> testDeleteRule [
	| rule |
	rule := (MiCBRule named: 'test' on: MiCriticBrowserPharoCodeQuery new).
	model addRule: rule.
	model deleteRule: rule.
	self assert: model rules size equals: 0
]

{ #category : #test }
MiCriticBrowserModelTest >> testGetCompleteOutput [
	| entity1 entity2 rule1 rule2 group |
	entity1 := FamixStMethod new.
	entity2 := FamixStMethod new.
	entity1 isStub: true.
	group := MooseGroup new.
	group add: entity1; add: entity2.
	rule1 := MiCBRule named: 'test1' on: (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isStub ]'). 
	rule2 := MiCBRule named: 'test2' on: (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isDead ]').
	
	model setEntities: group.
	model addRule: rule1; addRule: rule2.
	model runRules.
	self assert: model getCompleteOutput class equals: MiCBViolationGroup.
	self assertCollection: model getCompleteOutput allEntities includesAll: group  
	
]

{ #category : #test }
MiCriticBrowserModelTest >> testOutputOf [
	| entity rule |
	entity := FamixJavaMethod new.
	entity isStub: true.
	rule := MiCBRule named: 'test1' on: (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isStub ]'). 
	
	model setEntities: { entity } asMooseGroup.
	model addRule: rule.
	model runRules.
	self assert: (model outputOf: rule) class equals: MiCBViolationGroup.
	self assertCollection: model getCompleteOutput allEntities includesAll: { entity }
]

{ #category : #test }
MiCriticBrowserModelTest >> testOutputOfCollection [
	| entity1 entity2 rule1 rule2 group |
	entity1 := FamixStMethod new.
	entity2 := FamixStMethod new.
	entity1 isStub: true.
	group := MooseGroup new.
	group add: entity1; add: entity2.
	rule1 := MiCBRule named: 'test1' on: (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isStub ]'). 
	rule2 := MiCBRule named: 'test2' on: (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isDead ]').
	
	model setEntities: group.
	model addRule: rule1; addRule: rule2.
	model runRules.
	self assert: (model outputOfCollection: { rule1. rule2 }) class equals: MiCBViolationGroup.
	self assertCollection: (model outputOfCollection: { rule1. rule2 }) allEntities includesAll: group
]

{ #category : #tests }
MiCriticBrowserModelTest >> testRunRules [
	| entity1 entity2 rule1 rule2 group |
	entity1 := FamixStMethod new.
	entity2 := FamixStMethod new.
	entity1 isStub: true.
	group := MooseGroup new.
	group add: entity1; add: entity2.
	rule1 := MiCBRule named: 'test1' on: (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isStub ]'). 
	rule2 := MiCBRule named: 'test2' on: (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isDead ]').
	
	model setEntities: group; addRule: rule1; addRule: rule2.
	model runRules.
	self assert: model output size equals: 2.
	self assertCollection: ((model outputOf: rule1) allEntities) includesAll: {entity1}.
	self assertCollection: ((model outputOf: rule2) allEntities) includesAll: group.
	
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
