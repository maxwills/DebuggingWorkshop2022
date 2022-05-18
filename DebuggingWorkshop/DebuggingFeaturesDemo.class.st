Class {
	#name : #DebuggingFeaturesDemo,
	#superclass : #Object,
	#category : #'DebuggingWorkshop-Workshop'
}

{ #category : #'as yet unclassified' }
DebuggingFeaturesDemo >> doBlock: aBlock [

"You failed :( 
Remember to use StepThrough next time.
Had you used step throught as instructed,
the execution would not stop in this code.
"

	aBlock value
]

{ #category : #'as yet unclassified' }
DebuggingFeaturesDemo >> getPoemEndingString [

	^ 'I am not a debugging expert',String cr, 'and neither are you :p'
]

{ #category : #printing }
DebuggingFeaturesDemo >> printFirstVerse [

	"Don't enter methods by using stepOver"

	Transcript
		show: 'Roses are red, ';
		cr
]

{ #category : #printing }
DebuggingFeaturesDemo >> printMeAPoem [

	"1. Enter methods with stepInto"

	self printFirstVerse.

	" 2.Don't enter methods by using stepOver"
	self printSecondVerse.

	" 3. StepOver once to hightlight the message send. Then use stepThrough to advance the execution until next expression of this code"
	self doBlock: [
		"it should step to here"
		"now step into to continue"
		 self printPoemEnding].
	Transcript cr
]

{ #category : #printing }
DebuggingFeaturesDemo >> printPoemEnding [
	"Press Proceed to resume the execution (no more debubugging)"
	Transcript
		show: self getPoemEndingString;
		cr.
		
	"I dont like this poem"
]

{ #category : #printing }
DebuggingFeaturesDemo >> printSecondVerse [

	"I am dissapoint :(. Just press stepOver this time :)"

	Transcript
		show: 'violets are blue, ';
		cr
]
