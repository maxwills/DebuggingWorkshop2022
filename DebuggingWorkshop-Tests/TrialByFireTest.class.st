"
A SycFormatSourceCodeCommandTest is a test class for testing the behavior of SycFormatSourceCodeCommand
"
Class {
	#name : #TrialByFireTest,
	#superclass : #TestCase,
	#category : #'DebuggingWorkshop-Tests'
}

{ #category : #'as yet unclassified' }
TrialByFireTest >> createTestCheckerFor: anObject [

	| checker |
	checker := Exercise1Checker new.
	anObject writeSlotNamed: #textMorph value: checker.
	^ checker
]

{ #category : #test }
TrialByFireTest >> testReproductionOfBugIssueNumberOne [

	"This test programmatically reproduces the first bug of the workshop. 
It also checks that the problem was fixed according the hints.
The code here is not designed to give insight of the bug.
(Normally, test should do that, but not this tome for the workshop).

Press the circular button next to the method name to run the test.
THe button become green when the test passes.
Good luck.
"

	| cmd editorContext editor checker |
	editor := ClyMethodCreationToolMorph new.
	checker := self createTestCheckerFor: editor.
	cmd := SycFormatSourceCodeCommand new.
	editorContext := ClyTextEditorContext for: editor.
	cmd prepareFullExecutionInContext: editorContext.
	cmd execute.
	self assert: checker testOk
]
