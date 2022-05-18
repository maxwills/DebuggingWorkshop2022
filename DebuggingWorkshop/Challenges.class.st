"
A DebuggingWorkshopTest is a test class for testing the behavior of DebuggingWorkshop
"
Class {
	#name : #Challenges,
	#superclass : #TestCase,
	#classInstVars : [
		'answers'
	],
	#category : #DebuggingWorkshop
}

{ #category : #'as yet unclassified' }
Challenges class >> getAnswerFor: ctx [

	^ answers at: ctx sender method selector
]

{ #category : #initialization }
Challenges class >> initialize [

	"you are cheating!, stop it!"

	answers := Dictionary new.
	answers at: #testTask1 put: 123
]

{ #category : #'as yet unclassified' }
Challenges class >> launchTask1 [

	<script>
	| code removeSubstrings |
	removeSubstrings := [ :str :substr | 
	                    str copyReplaceAll: substr with: '' ].

	code := (self class >> #task1ChallengePlaygroundCode) sourceCode.
	code := removeSubstrings value: code value: String tab.
	code := removeSubstrings value: code value: 'task1ChallengePlaygroundCode'.
	StPlayground openContents: code trim
]

{ #category : #'as yet unclassified' }
Challenges class >> task1ChallengePlaygroundCode [

	self flag: 'Challenge1: Step and inspect. What is the value of x?'.
	SteppingChallenge new lvl1: [ 
		| r x |
		r := Random new
			     seed: 123;
			     yourself.
		x := r nextInteger: 10000.
		self flag: 'good luck!' ]
]

{ #category : #test }
Challenges >> testTask1 [

	"Stepping Exercise"

	"Instructions: 
	Evaluate the following code: (self launchTask1)'.
	A playground will open with a program.
	Debug the code and find the value of the variable 'x'.
	
	Rules: 
	1. Use only the debugger and its stepping functionalities.
	2. Don't write code or modify the challenge code.
	3. Don't use breakpoints or any sort of halting"
	
	"Question: What is the value of the variable 'x'"

	| answer |
	answer := 0."<- write your answer"
	self assert: self verifyAnswer
]

{ #category : #'as yet unclassified' }
Challenges >> verifyAnswer [

	| ctx |
	ctx := thisContext.
	[ 
	^ (ctx sender readVariableNamed: #answer)
	  = (self class getAnswerFor: ctx) ]
		on: Exception
		do: [ 
			self inform:
				'There is an error in the code. Please revert all changes.'.
			^ false ]
]
