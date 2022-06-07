Class {
	#name : #Exercise1Checker,
	#superclass : #Object,
	#instVars : [
		'methodCalled'
	],
	#category : #'DebuggingWorkshop-Tests'
}

{ #category : #formatting }
Exercise1Checker >> formatSourceCode [
methodCalled := true
]

{ #category : #initialization }
Exercise1Checker >> initialize [ 
methodCalled :=false
]

{ #category : #tests }
Exercise1Checker >> testOk [
^methodCalled 
]
