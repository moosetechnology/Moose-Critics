layout
defaultLayout
	
	| choiceBar titlePane |
	
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
	
	^ SpBoxLayout newTopToBottom
		add: choiceBar expand: false;
		spacing: 5;
		add: titlePane expand: false;
		add: changeableBlock;
		yourself
		