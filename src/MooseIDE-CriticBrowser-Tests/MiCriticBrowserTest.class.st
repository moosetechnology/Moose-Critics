Class {
	#name : #MiCriticBrowserTest,
	#superclass : #MiAbstractBrowserTest,
	#instVars : [
		'stubRule',
		'deadRule',
		'basicEntity',
		'stubEntity'
	],
	#category : #'MooseIDE-CriticBrowser-Tests'
}

{ #category : #asserting }
MiCriticBrowserTest >> assertFollowActionFor: aMooseObject [

	aMooseObject isCollection 
		ifTrue: [ self assertCollection: browser model entities includesAll: aMooseObject.
					 self assert: browser model entities class equals: aMooseObject class ]
		ifFalse: [ self assert: (browser model entities at: 1) equals: aMooseObject ]
						
]

{ #category : #running }
MiCriticBrowserTest >> browserClass [ 
	^ MiCriticBrowser 
]

{ #category : #running }
MiCriticBrowserTest >> setUp [
	super setUp.
	stubRule := MiCBRule named: 'test1' on: ((MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isStub ]')).
	deadRule := MiCBRule named: 'test2' on: ((MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isDead ]')).
	stubEntity := FamixStMethod new.
	stubEntity name: 'test1'; isStub: true.
	basicEntity := FamixStMethod new.
	basicEntity name: 'test2'
	

]

{ #category : #test }
MiCriticBrowserTest >> testChildrenFor [
	| entity |
	entity := FamixStMethod new.
	entity name: 'test'; isStub: true.
	browser model 
		setEntities: entity;
		addRule: (MiCBRule named: 'test' on: (MiCriticBrowserFQQuery on: (FQBooleanQuery property: #isStub)));
		runRules.
	
	browser updateResultList: browser model getCompleteOutput.
	self assertCollection: (browser children: (browser queryResult roots anyOne) for: (browser queryResult)) includesAll: { entity }
]

{ #category : #test }
MiCriticBrowserTest >> testDeleteSelectedRule [
	browser model addRule: stubRule; addRule: deadRule.
	browser updateQueriesList.
	browser queries selectItem: stubRule.
	self assert: browser model rules size equals: 2.
	browser deleteSelectedRule.
	self assert: browser model rules size equals: 1
]

{ #category : #test }
MiCriticBrowserTest >> testFollowEntity [
	| mooseObjects entity1 entity2 entity3 |
	entity1 := FamixStClass new. entity1 name: 'Test'.
	entity2 := FamixJavaMethod new. entity2 name: 'test'.
	entity3 := FamixStPackage new. entity3 := { entity3 name: 'Test' } asMooseGroup.
	mooseObjects := { entity1. entity2. entity3 } asMooseGroup. 
	
	browser privateReceivingMode: MiFollowMode.
	mooseObjects do: [ :mooseObject | 
		self bus globallySelect: mooseObject.
		self assertFollowActionFor: mooseObject ]
]

{ #category : #test }
MiCriticBrowserTest >> testMiSelectedItem [

	| entity entityStub |
	entity := FamixStMethod new.
	entityStub := FamixStMethod new.
	entity name: 'test'. entityStub name: 'test'.
	entityStub isStub: true.
	
	"propagating the entity for the model to receive it"
	(browser model) 
		setEntities: {entity. entityStub} asMooseGroup; 
		addRule: (MiCBRule named: 'test' on: (MiCriticBrowserFQQuery on: (FQBooleanQuery property: #isStub)));
		runRules.
	browser updateResultList: browser model getCompleteOutput.
		
	self assert: browser miSelectedItem size equals: 1.
	self assert: (browser miSelectedItem at:1) equals: entityStub 
]

{ #category : #tests }
MiCriticBrowserTest >> testModelStartsEmpty [

	self assert: (browser model entities isEmpty)
]

{ #category : #test }
MiCriticBrowserTest >> testRunButtonAction [
	browser model setEntities: { stubEntity } asMooseGroup.
	browser model addRule: stubRule.
	browser runButton performAction.
	
	self assert: browser model output size equals: 1 
	
]

{ #category : #test }
MiCriticBrowserTest >> testSelectedQueries [
	browser model setEntities: { stubEntity. basicEntity } asMooseGroup.
	browser model addRule: stubRule; addRule: deadRule.
	browser model runRules.
	browser updateQueriesList.
	browser updateResultList: browser model getCompleteOutput.
	
	browser queries selectItem: stubRule.
	self assert: browser queryResult roots flatten size equals: 1.
	self assert: browser queryResult roots flatten anyOne equals: stubEntity.
	
	browser queries selectItem: deadRule.
	self assert: browser queryResult roots flatten size equals: 2.
	self assertCollection: browser queryResult roots flatten includesAll: { stubEntity. basicEntity }.
	
]

{ #category : #tests }
MiCriticBrowserTest >> testUnselectPrintsCompleteOutput [
	browser model setEntities: { stubEntity. basicEntity } asMooseGroup.
	browser model addRule: stubRule; addRule: deadRule.
	browser runButtonAction.
	
	browser queries selectItem: stubRule.
	browser queries unselectAll.
	self assert: (browser queryResult roots flatten size) equals: 2

]

{ #category : #test }
MiCriticBrowserTest >> testUpdateEntitiesList [
	browser model setEntities: stubEntity.
	
	browser updateEntitiesList.
	self assert: (browser entitiesList roots flatten size) equals: 1
]

{ #category : #tests }
MiCriticBrowserTest >> testUpdateQueriesList [
	self assert: browser queries roots size equals: 0.
	browser model addRule: stubRule.
	browser updateQueriesList.
	self assert: browser queries roots size equals: 1
]

{ #category : #test }
MiCriticBrowserTest >> testUpdateResultList [
	browser model addRule: stubRule; setEntities: { stubEntity } asMooseGroup; runRules. 
	
	browser updateResultList: browser model getCompleteOutput.
	self assert: (browser queryResult roots flatten size) equals: 1
]
