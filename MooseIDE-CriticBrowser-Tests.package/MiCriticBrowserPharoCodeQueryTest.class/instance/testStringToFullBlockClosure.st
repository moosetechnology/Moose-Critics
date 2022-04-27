tests
testStringToFullBlockClosure
	| block |
	block := handler stringToFullBlockClosure: 'entity + 2'.
	self assert: (block value: 1) equals: 3 