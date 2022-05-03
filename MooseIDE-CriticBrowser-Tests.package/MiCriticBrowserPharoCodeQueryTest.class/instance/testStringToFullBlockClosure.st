tests
testStringToFullBlockClosure
	| block |
	block := handler stringToFullBlockClosure: '[ :entity | entity + 2 ]'.
	self assert: (block value: 1) equals: 3 