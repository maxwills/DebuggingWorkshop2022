Class {
	#name : #Egg,
	#superclass : #Object,
	#instVars : [
		'poisoned'
	],
	#category : #'DebuggingWorkshop-Story'
}

{ #category : #initialization }
Egg >> initialize [

	poisoned := false.
]
