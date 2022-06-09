Class {
	#name : #Act5OrderedCollectionAddContextExample,
	#superclass : #Object,
	#category : #'DebuggingWorkshop-Workshop'
}

{ #category : #adding }
Act5OrderedCollectionAddContextExample >> add: newObject [

	"Copy and paste this code in the OrderedCollection class"

	newObject class = Egg ifTrue: [ 
		| senderMethodName senderMethodClassName |
		senderMethodName := thisContext sender selector.
		senderMethodClassName := thisContext sender method methodClass name.
		ExampleLogger log:
			'#add: method called from: ' , senderMethodClassName , '>>'
			, senderMethodName ].
	^ self addLast: newObject
]
