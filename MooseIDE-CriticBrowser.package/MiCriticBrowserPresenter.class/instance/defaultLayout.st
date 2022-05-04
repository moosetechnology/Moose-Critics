layout
defaultLayout	
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