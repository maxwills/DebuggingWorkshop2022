Class {
	#name : #ExampleLogger,
	#superclass : #Object,
	#classInstVars : [
		'enabled',
		'counter'
	],
	#category : #'DebuggingWorkshop-Utils'
}

{ #category : #accessing }
ExampleLogger class >> counter [

	^ counter ifNil: [ counter := 0 ]
]

{ #category : #accessing }
ExampleLogger class >> counter: anObject [

	counter := anObject
]

{ #category : #accessing }
ExampleLogger class >> enabled [

	^ enabled ifNil: [ enabled := true ]
]

{ #category : #accessing }
ExampleLogger class >> enabled: anObject [

	enabled := anObject
]

{ #category : #logging }
ExampleLogger class >> log: aString [

	self enabled ifFalse: [ ^ self ].
	counter := self counter + 1.
	Transcript
		show: counter asString , '. ' , aString;
		cr
]

{ #category : #logging }
ExampleLogger class >> reset [

	<script>
	counter := 0.
	Transcript clear
]
