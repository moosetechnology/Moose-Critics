tests
testStringToFullBlockClosure
	| block |
	block := handler stringToFullBlockClosure: '[ :a | a + 2 ]'.
	self assert: (block value: 1) equals: 3 