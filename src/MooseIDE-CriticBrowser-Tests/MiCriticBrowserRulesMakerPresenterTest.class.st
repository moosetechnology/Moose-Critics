"
A MiCriticBrowserQueryMakerPresenterTest is a test class for testing the behavior of MiCriticBrowserQueryMakerPresenter
"
Class {
	#name : #MiCriticBrowserRulesMakerPresenterTest,
	#superclass : #MiAbstractBrowserTest,
	#instVars : [
		'rulesMaker'
	],
	#category : #'MooseIDE-CriticBrowser-Tests'
}

{ #category : #running }
MiCriticBrowserRulesMakerPresenterTest >> browserClass [
	^ MiCriticBrowser 
]

{ #category : #running }
MiCriticBrowserRulesMakerPresenterTest >> setUp [
	super setUp.
	rulesMaker := browser rulesMakerPresenter.
	browser openRulesMakerButton performAction

]

{ #category : #running }
MiCriticBrowserRulesMakerPresenterTest >> tearDown [
	super tearDown.
	rulesMaker delete
]

{ #category : #test }
MiCriticBrowserRulesMakerPresenterTest >> testAddInputtedCodeRule [
	rulesMaker codeButtonAction.
	rulesMaker codeInput text: '[ :entity | entity isDead ]'.
	rulesMaker addButton performAction.
	
	self assert: browser model rules size equals: 1
]

{ #category : #test }
MiCriticBrowserRulesMakerPresenterTest >> testAddInputtedFQRule [
	| query |
	query := FQBooleanQuery property: #isStub.
	rulesMaker queriesBrowserButton click.
	rulesMaker queryDroplist items: { query }.
	rulesMaker queryDroplist selectItem: query.
	rulesMaker addButton performAction.
	
	self assert: browser model rules size equals: 1.
]

{ #category : #test }
MiCriticBrowserRulesMakerPresenterTest >> testCodeButtonAction [
	rulesMaker codeButtonAction.
	self assert: rulesMaker codeInput isVisible equals: true.
	self assert: rulesMaker queryDroplist isVisible equals: false
]

{ #category : #test }
MiCriticBrowserRulesMakerPresenterTest >> testQueriesBrowserButtonAction [
	rulesMaker queriesBrowserButtonAction.
	self assert: rulesMaker codeInput isVisible equals: false.
	self assert: rulesMaker queryDroplist isVisible equals: true
]
