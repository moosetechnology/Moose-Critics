Class {
	#name : #MiCBViolationGroup,
	#superclass : #MooseSpecializedGroup,
	#category : #'MooseIDE-CriticBrowser'
}

{ #category : #accessing }
MiCBViolationGroup >> allEntities [
	^ (self collect: [ :each | each violatingEntity ]) asMooseGroup
]
