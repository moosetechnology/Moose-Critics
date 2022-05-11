"
Class implementing the presenter used to input queries, can use Pharo code or queries produced by the Queries Browser.
"
Class {
	#name : #MiCriticBrowserRulesMakerPresenter,
	#superclass : #MiPresenter,
	#instVars : [
		'codeButton',
		'queriesBrowserButton',
		'codePresenter',
		'codeInput',
		'queriesBrowserPresenter',
		'addButton',
		'queryDroplist',
		'changeableBlock',
		'closeButton',
		'mainWindow',
		'ruleTitle',
		'ruleSummary'
	],
	#category : 'MooseIDE-CriticBrowser'
}

{ #category : #'accessing - tests' }
MiCriticBrowserRulesMakerPresenter >> addButton [
"used for testing purposes, do not access outside of tests"
	^ addButton
]

{ #category : #adding }
MiCriticBrowserRulesMakerPresenter >> addButtonAction [
	codeButton state 
		ifTrue: [ self addInputtedCodeRule ] 
		ifFalse: [ self addInputtedFQRule ].
	ruleTitle text: ''.
	mainWindow updateQueriesList 
]

{ #category : #adding }
MiCriticBrowserRulesMakerPresenter >> addInputtedCodeRule [
	codeInput text ifNotNil: 
		[ mainWindow model addRule: (MiCBRule named: (ruleTitle text) on: (MiCriticBrowserPharoCodeQuery on: (codeInput text))) ].
	codeInput text: '[ :entity | ]'
]

{ #category : #adding }
MiCriticBrowserRulesMakerPresenter >> addInputtedFQRule [
	queryDroplist selectedItem ifNotNil: 
		[ mainWindow model addRule: (MiCBRule named: (ruleTitle text) on: (MiCriticBrowserFQQuery on: (queryDroplist selectedItem))) ]
]

{ #category : #'buttons actions' }
MiCriticBrowserRulesMakerPresenter >> codeButtonAction [
	changeableBlock 
		removeAll;
		add: ('Input for code query :' asPresenter) expand: false;
		add: codePresenter.
	codeInput show. queryDroplist hide.
	codeInput text: '[ :entity | ]'.
]

{ #category : #'accessing - tests' }
MiCriticBrowserRulesMakerPresenter >> codeInput [
"used for testing purposes, do not access outside of tests"
	^ codeInput
]

{ #category : #initialization }
MiCriticBrowserRulesMakerPresenter >> consume: aQuery [
	queryDroplist items: self fetchQueries 
]

{ #category : #layout }
MiCriticBrowserRulesMakerPresenter >> defaultLayout [
	
	| choiceBar titlePane summaryPane |
	
	choiceBar := SpBoxLayout newLeftToRight 
		add: codeButton;
		add: queriesBrowserButton;
		beHomogeneous;
		yourself.
	
	titlePane := SpBoxLayout newTopToBottom
		add: ('Rule name : ' asPresenter) expand: false;
		add: ruleTitle expand: false;
		yourself.
	
	changeableBlock := SpBoxLayout newTopToBottom 
		add: ('Input for code query :' asPresenter) expand: false; 
		add: codePresenter;
		yourself.
		
	summaryPane := SpBoxLayout newTopToBottom
		add: ('Summary of the rule :' asPresenter) expand: false;
		add: ruleSummary expand: true;
		yourself.
	
	^ SpBoxLayout newTopToBottom
		add: choiceBar expand: false;
		spacing: 5;
		add: titlePane expand: false;
		add: changeableBlock;
		add: summaryPane;
		yourself
		
]

{ #category : #accessing }
MiCriticBrowserRulesMakerPresenter >> defaultTitle [
	^ 'Rules maker'
]

{ #category : #initialization }
MiCriticBrowserRulesMakerPresenter >> fetchQueries [
	^ ((self application itemsFor: FQAbstractQuery)
		asOrderedCollection) select: [ :each | each isValid ] 
]

{ #category : #initialization }
MiCriticBrowserRulesMakerPresenter >> initialize [
	super initialize
]

{ #category : #initialization }
MiCriticBrowserRulesMakerPresenter >> initializeButtons [
	codeButton := self newRadioButton.
	queriesBrowserButton := self newRadioButton.
	addButton := self newButton.
	closeButton := self newButton.
	
	codeButton label: 'Pharo Code';
		whenActivatedDo: [ self codeButtonAction ];
		associatedRadioButtons: { queriesBrowserButton }.
	
	queriesBrowserButton label: 'Queries Browser';
		whenActivatedDo: [ self queriesBrowserButtonAction ].
	
	addButton label: 'Add query';
		icon: (self iconNamed: #smallAdd);
		action: [ self addButtonAction ].
		
	closeButton label: 'Close';
		icon: (self iconNamed: #glamorousClose);
		action: [ self window close ]
]

{ #category : #initialization }
MiCriticBrowserRulesMakerPresenter >> initializeDialogWindow: aDialogWindowPresenter [
	aDialogWindowPresenter 
		addButton: addButton;
		addButton: closeButton
]

{ #category : #initialization }
MiCriticBrowserRulesMakerPresenter >> initializePresenters [
	
	self initializeButtons.
	
	ruleTitle := self newTextInput.
	ruleSummary := self newText.
	codeInput := self newCode.
	queryDroplist := self newDropList.
	
	codeInput text: '[ :entity | ]'.
	
	codePresenter := MiPresenter new 
		layout: (SpBoxLayout newTopToBottom 
						add: codeInput;
						yourself); 
		yourself.
	
	queryDroplist startWithoutSelection;
					  items: self fetchQueries;
					  centered.
	
	queriesBrowserPresenter := MiPresenter new 
		layout: (SpBoxLayout newTopToBottom 
						add: queryDroplist expand: false; 
						yourself);
		yourself
]

{ #category : #initialization }
MiCriticBrowserRulesMakerPresenter >> initializeWindow: aWindowPresenter [	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: self defaultTitle;
		initialExtent: 460 @ 460
]

{ #category : #accessing }
MiCriticBrowserRulesMakerPresenter >> mainWindow: aWindowPresenter [
	mainWindow := aWindowPresenter 
]

{ #category : #accessing }
MiCriticBrowserRulesMakerPresenter >> queriesBrowserButton [
	^ queriesBrowserButton
]

{ #category : #'buttons actions' }
MiCriticBrowserRulesMakerPresenter >> queriesBrowserButtonAction [
	changeableBlock 
		removeAll; 
		add: ('Choose a query :' asPresenter) expand: false;
		add: queriesBrowserPresenter;
		expand: false.
	codeInput hide. queryDroplist show.
]

{ #category : #'accessing - tests' }
MiCriticBrowserRulesMakerPresenter >> queryDroplist [
"used for testing purposes, do not access outside of tests"
	^ queryDroplist
]

{ #category : #removing }
MiCriticBrowserRulesMakerPresenter >> remove: aQuery [
	queryDroplist items: self fetchQueries 
]

{ #category : #updating }
MiCriticBrowserRulesMakerPresenter >> update: aQuery [
	queryDroplist items: self fetchQueries 
]
