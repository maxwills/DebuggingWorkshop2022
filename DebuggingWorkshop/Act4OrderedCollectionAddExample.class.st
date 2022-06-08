Class {
	#name : #Act4OrderedCollectionAddExample,
	#superclass : #Object,
	#category : #'DebuggingWorkshop-Workshop'
}

{ #category : #adding }
Act4OrderedCollectionAddExample >> add: newObject [

	"Copy and paste this code in the OrderedCollection class"

	newObject class = Egg ifTrue: [ 
		ExampleLogger log: 'add: method called' ].

	^ self addLast: newObject
]
