layout
defaultLayout 

	^ SpBoxLayout newLeftToRight
			addLast: inspectButton;
			addLast: falsePositiveButton;
			yourself