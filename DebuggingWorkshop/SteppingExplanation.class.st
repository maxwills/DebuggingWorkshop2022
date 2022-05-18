Class {
	#name : #SteppingExplanation,
	#superclass : #Object,
	#category : #DebuggingWorkshop
}

{ #category : #'as yet unclassified' }
SteppingExplanation >> doBlock: aBlock [

"You failed :( 
Remember to use StepThrough next time.
Had you used step throught as instructed,
the execution would not stop in this code.
"

	aBlock value
]

{ #category : #'as yet unclassified' }
SteppingExplanation >> getPoemEndingString [

	^ 'I am not a debugging expert',String cr, 'and neither are you :p'
]

{ #category : #printing }
SteppingExplanation >> printFirstVerse [

	"Don't enter methods by using stepOver"

	Transcript
		show: 'Roses are red, ';
		cr
]

{ #category : #printing }
SteppingExplanation >> printMeAPoem [

	"1. Enter methods with stepInto"

	self printFirstVerse.

	" 2.Don't enter methods by using stepOver"
	self printSecondVerse.

	" 3. use stepThrough a couple times to advance the execution until next expression of this code"
	self doBlock: [
		"it should step to here"
		"now step into to continue"
		 self printPoemEnding].
	Transcript cr
]

{ #category : #printing }
SteppingExplanation >> printPoemEnding [
	"Press Proceed to resume the execution (no more debubugging)"
	Transcript
		show: self getPoemEndingString;
		cr.
		
	"I dont like this poem"
]

{ #category : #printing }
SteppingExplanation >> printSecondVerse [

	"I am dissapoint :(. Just press stepOver this time :)"

	Transcript
		show: 'violets are blue, ';
		cr
]
