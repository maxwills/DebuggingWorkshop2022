Class {
	#name : #SteppingChallenge,
	#superclass : #TestCase,
	#category : #DebuggingWorkshop
}

{ #category : #'as yet unclassified' }
SteppingChallenge >> lvl1: aBlock [

	^ self lvl2: [aBlock ensure: [  ]]
]

{ #category : #'as yet unclassified' }
SteppingChallenge >> lvl2: aBlock [

	^ self lvl3: [aBlock onErrorDo: [  ]]
]

{ #category : #'as yet unclassified' }
SteppingChallenge >> lvl3: aBlock [

	^ [self lvl4: aBlock] ensure: [  ]
]

{ #category : #'as yet unclassified' }
SteppingChallenge >> lvl4: aBlock [

	| val |
	[  ] ensure: [ val := aBlock value ].
	^ val
]

{ #category : #'as yet unclassified' }
SteppingChallenge >> something: aNumber [

	aNumber < 0 ifTrue: [ ^ self ].
	^ self something: aNumber - 1
]
