Class {
	#name : #Egg,
	#superclass : #Object,
	#instVars : [
		'poisoned'
	],
	#classInstVars : [
		'counter'
	],
	#category : #'DebuggingWorkshop-Story'
}

{ #category : #initialization }
Egg class >> initialize [

	counter := 0
]

{ #category : #'instance creation' }
Egg class >> new [

	| egg |
	counter := counter + 1.
	egg := self basicNew initialize.
	counter = 20 ifTrue: [ egg poisoned: true ].
	^ egg
]

{ #category : #initialization }
Egg >> initialize [

	poisoned := false.
]

{ #category : #accessing }
Egg >> poisoned [

	^ poisoned
]

{ #category : #accessing }
Egg >> poisoned: anObject [

	poisoned := anObject
]
