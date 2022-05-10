converting
stringToFullBlockClosure: aString
"converts a string to an block (to run the query)"
	^ Smalltalk compiler evaluate: aString