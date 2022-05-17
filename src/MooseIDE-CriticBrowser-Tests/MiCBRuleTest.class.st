"
A MiCBRuleTest is a test class for testing the behavior of MiCBRule
"
Class {
	#name : #MiCBRuleTest,
	#superclass : #TestCase,
	#category : #'MooseIDE-CriticBrowser-Tests'
}

{ #category : #test }
MiCBRuleTest >> testQuery [
	self should: [ MiCBRule named: 'test' on: 'test' ] raise: NotAValidQuery.
	self shouldnt: [ MiCBRule named: 'test' on: (MiCriticBrowserPharoCodeQuery new) ] raise: NotAValidQuery
]

{ #category : #test }
MiCBRuleTest >> testRunOn [
	| rule entity stubEntity res |
	rule := MiCBRule named: 'test1' on: ((MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isStub ]')).
	entity := FamixJavaMethod new.
	stubEntity := FamixJavaMethod new. stubEntity isStub: true.
	res := rule runOn: { entity. stubEntity } asMooseGroup.
	self assert: (res class) equals: FamixCBViolationGroup.
	self assert: (res size) equals: 1.
	self assert: ((res at: 1) class) equals: MiCBViolation.
	self assert: ((res at: 1) violatingEntity) equals: stubEntity.
	self assert: ((res at: 1) violatedRule) equals: rule
]
