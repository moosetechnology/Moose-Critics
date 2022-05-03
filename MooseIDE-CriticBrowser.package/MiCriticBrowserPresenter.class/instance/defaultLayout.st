layout
defaultLayout
	changeableBlock := (SpBoxLayout new 
						add: ('Entities requested' asPresenter) expand: false;
						add: queryResult;
						yourself).
	
	^ SpBoxLayout newTopToBottom
		add: (SpPanedLayout newLeftToRight 
			add: (SpBoxLayout new 
				add: 'Rules' expand: false;
				add: queries;
				yourself);
			add: changeableBlock;
			yourself);
		add: (SpBoxLayout newLeftToRight
				add: inspectButton expand: false;
				addLast: openQueryMakerButton;
				spacing: 5; 
				addLast: runButton;
		yourself) expand: false;
	yourself