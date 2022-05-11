"
Critique browser for Famix Models.
"
Class {
	#name : #MiCriticBrowser,
	#superclass : #MiAbstractBrowser,
	#instVars : [
		'entitiesList',
		'queries',
		'editMenu',
		'runButton',
		'queryResult',
		'inspectButton',
		'rulesMakerPresenter',
		'openRulesMakerButton'
	],
	#category : #'MooseIDE-CriticBrowser'
}

{ #category : #'instance creation' }
MiCriticBrowser class >> newModel [
	^ MiCriticBrowserModel new
]

{ #category : #'instance creation' }
MiCriticBrowser class >> open [
	<script>
	^ super open
]

{ #category : #accessing }
MiCriticBrowser class >> title [ 
	^ 'Model Critic Browser'
]

{ #category : #'window control' }
MiCriticBrowser >> browserClosed [
	super browserClosed.
	self application unregisterConsumer: rulesMakerPresenter 
]

{ #category : #testing }
MiCriticBrowser >> canFollowEntity: anEntity [
"whether the browser accepts to deal with anObject"
	^ anEntity isMooseObject
]

{ #category : #'as yet unclassified' }
MiCriticBrowser >> children: aCollection for: aTreePresenter [
"provides content of the children block for the collection root for a given tree presenter"
	^ (aTreePresenter roots includes: aCollection) 
		ifTrue: [ (aTreePresenter roots at: (aTreePresenter roots indexOf: aCollection)) asCollection ] 
		ifFalse: [ {  } ]
]

{ #category : #layout }
MiCriticBrowser >> defaultLayout [	
	^ SpBoxLayout newTopToBottom
		add: (SpPanedLayout newLeftToRight
			add: (SpBoxLayout new 
					add: 'Entities' expand: false;
					add: entitiesList;
					yourself);
			add: (SpPanedLayout newLeftToRight
				add: (SpBoxLayout new 
					add: 'Rules' expand: false;
					add: queries;
					yourself);
				add: (SpBoxLayout new 
					add: ('Entities requested' asPresenter) expand: false;
					add: queryResult;
					yourself);
			yourself);
		yourself);
		add: (SpBoxLayout newLeftToRight
			add: inspectButton expand: false;
			addLast: openRulesMakerButton;
			spacing: 5; 
			addLast: runButton;
			yourself) expand: false;
	yourself
]

{ #category : #accessing }
MiCriticBrowser >> defaultTitle [
	^ 'Model Critic Browser'
]

{ #category : #'updating screen' }
MiCriticBrowser >> displayQuery: selectedQuery [
"displays the queries, adding the number of entities they get if the query has been executed"
	^ (model output includesKey: selectedQuery) 
	ifTrue: 
		[ (selectedQuery name), ' (' , ((model output at: selectedQuery) size asString) , ')'] 
	ifFalse: [ selectedQuery name ]
]

{ #category : #'accessing - testing' }
MiCriticBrowser >> entitiesList [
"used for testing purposes, do not access outside of tests"
	^ entitiesList
]

{ #category : #actions }
MiCriticBrowser >> followEntity: anEntity [
	self model setEntities: (anEntity asMooseGroup).
	self updateEntitiesList 
]

{ #category : #initialization }
MiCriticBrowser >> initialize [
	super initialize.
	application registerConsumer: rulesMakerPresenter for: FQAbstractQuery 
]

{ #category : #initialization }
MiCriticBrowser >> initializeButtons [
	inspectButton := self newButton.
	openRulesMakerButton := self newButton.
	runButton := self newButton.
	
	openRulesMakerButton
		label: 'Add rules';
		icon: (self iconNamed: #smallAdd);
		action: [ rulesMakerPresenter openDialog ].
	
	runButton 
		label: 'Run';
		icon: (self iconNamed: #glamorousPlay);
		action: [ self runButtonAction ].
	
	inspectButton 
		label: 'Inspect model';
		icon: (self iconNamed: #glamorousInspect);
		action: [ self model entities inspect ].
]

{ #category : #initialization }
MiCriticBrowser >> initializeLists [
	entitiesList := self newTree.
	queries := self newTree.
	queryResult := self newTree.
	
	entitiesList 
		display: [ :each | self stringForItem: each ];
		children: [ :each | self children: each for: entitiesList ];
		activateOnDoubleClick;
		whenActivatedDo: [ :each | each selectedItem inspect ].
	
	queries
		items: self model rules;
		display: [ :each | self displayQuery: each ];
		beMultipleSelection;
		whenSelectionChangedDo: [ (model output) ifNotEmpty: [ self selectedQueries ] ].
	
	queryResult
		display: [ :each | self stringForItem: each ];
		children: [ :each | self children: each for: queryResult ];
		activateOnDoubleClick;
		whenActivatedDo: [ :each | each selectedItem inspect ]
]

{ #category : #initialization }
MiCriticBrowser >> initializeMenu [
]

{ #category : #accessing }
MiCriticBrowser >> initializePresenters [
	
	super initializePresenters.
	self initializeLists.
	self initializeButtons.
	
	rulesMakerPresenter := self instantiate: MiCriticBrowserRulesMakerPresenter on: model.
	rulesMakerPresenter mainWindow: self.
	
	self focusOrder
			add: queries;
			add: queryResult;
			add: inspectButton;
			add: openRulesMakerButton;
			add: runButton.
]

{ #category : #initialization }
MiCriticBrowser >> initializeWindow: aWindowPresenter [	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: self defaultTitle;
		initialExtent: 760 @ 360
]

{ #category : #accessing }
MiCriticBrowser >> miSelectedItem [ 
	^ self queryResult roots flatten asMooseGroup
]

{ #category : #'accessing - testing' }
MiCriticBrowser >> openRulesMakerButton [
"used for testing purposes, do not access outside of tests"
	^ openRulesMakerButton
]

{ #category : #'accessing - testing' }
MiCriticBrowser >> queries [
"used for testing purposes, do not access outside of tests"
	^ queries
]

{ #category : #'accessing - testing' }
MiCriticBrowser >> queryResult [
"used for testing purposes, do not access outside of tests"
	^ queryResult 
]

{ #category : #'accessing - testing' }
MiCriticBrowser >> rulesMakerPresenter [
"used for testing purposes, do not access outside of tests"
	^ rulesMakerPresenter
]

{ #category : #'accessing - testing' }
MiCriticBrowser >> runButton [
"used for testing purposes, do not access outside of tests"
	^ runButton
]

{ #category : #'buttons actions' }
MiCriticBrowser >> runButtonAction [
"executes the queries on the entities stored in the model, then prints the results"
	self model runRules.
	self updateResultList: model getCompleteOutput.
	self updateQueriesList
]

{ #category : #'selected object' }
MiCriticBrowser >> selectedQueries [
"shows in the output list only the entities validating the selected queries (or the complete output if no query is selected)"
	| entitiesList |
	entitiesList := MooseGroup new.
	(queries selectedItems) 
		ifNotEmpty: [
			(queries selectedItems) do: 
				[ :each | entitiesList := entitiesList | (model output at: each) ].
			self updateResultList: entitiesList ]
		ifEmpty: [ 
			self updateResultList: model getCompleteOutput ]
]

{ #category : #naming }
MiCriticBrowser >> stringForItem: item [
	(queryResult roots includes: item) ifTrue: [ ^ item description ].
	^ item name
]

{ #category : #'updating screen' }
MiCriticBrowser >> updateEntitiesList [
	| roots |
	roots := (model entities allEntityTypes collect: [ :type | 
		           model entities allWithType: type ]) asOrderedCollection.
	roots do: [ :group | group description: group details ].
	entitiesList roots:
		(roots sort: [ :group | group description onlyLetters ] ascending).
	
	entitiesList roots: roots.
	entitiesList refresh.
	
]

{ #category : #'updating screen' }
MiCriticBrowser >> updateQueriesList [
	queries roots: self model rules.
	queries refresh
]

{ #category : #'updating screen' }
MiCriticBrowser >> updateResultList: aCollection [
	| roots |
	roots := (aCollection allEntityTypes collect: [ :type | 
		           aCollection allWithType: type ]) asOrderedCollection.
	roots do: [ :group | group description: group details ].
	queryResult roots:
		(roots sort: [ :group | group description onlyLetters ] ascending).
	
	queryResult roots: roots.
	queryResult refresh.
	self updateToolbar
]
