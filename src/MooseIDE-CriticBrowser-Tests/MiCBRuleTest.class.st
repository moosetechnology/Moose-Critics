"
A MiCBRuleTest is a test class for testing the behavior of MiCBRule
"
Class {
	#name : #MiCBRuleTest,
	#superclass : #TestCase,
	#category : 'MooseIDE-CriticBrowser-Tests'
}

{ #category : #test }
MiCBRuleTest >> testQuery [
	self should: [ MiCBRule named: 'test' on: 'test' ] raise: NotAValidQuery.
	self shouldnt: [ MiCBRule named: 'test' on: (MiCriticBrowserPharoCodeQuery new) ] raise: NotAValidQuery
]
