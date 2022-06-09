"
See class side methods
"
Class {
	#name : #BaptismByFireHints,
	#superclass : #Object,
	#category : #'DebuggingWorkshop-Workshop'
}

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> script00BrowseTest [

	"This script display the test code using a system browser"

	<script>
	(TrialByFireTest >> #testReproductionOfBugIssueNumberOne) browse
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> script00ShowBugReport [

	"Full-sized images available at: https://github.com/maxwills/DebuggingWorkshop2022/tree/main/resources"

	<script>
	DWUtils tryShowPNGImage:
		'https://github.com/maxwills/DebuggingWorkshop2022/raw/main/resources/debugger-parts.png'
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> script01ShowHint01 [

	"Full-sized images available at: https://github.com/maxwills/DebuggingWorkshop2022/tree/main/resources"

	<script>
	DWUtils tryShowPNGImage:
		'https://github.com/maxwills/DebuggingWorkshop2022/raw/main/resources/debugging-hints1.png'
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> script02ShowHint02 [

	"Full-sized images available at: https://github.com/maxwills/DebuggingWorkshop2022/tree/main/resources"

	<script>
	DWUtils tryShowPNGImage:
		'https://github.com/maxwills/DebuggingWorkshop2022/raw/main/resources/debugging-hints2.png'
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> script03ShowHint03 [

	"Full-sized images available at: https://github.com/maxwills/DebuggingWorkshop2022/tree/main/resources"

	<script>
	DWUtils tryShowPNGImage:
		'https://github.com/maxwills/DebuggingWorkshop2022/raw/main/resources/debugging-hints3.png'
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> script04ShowHint04 [

	"Full-sized images available at: https://github.com/maxwills/DebuggingWorkshop2022/tree/main/resources"

	<script>
	DWUtils tryShowPNGImage:
		'https://github.com/maxwills/DebuggingWorkshop2022/raw/main/resources/debugging-hints4.png'
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> script05ShowHint05 [

	"Full-sized images available at: https://github.com/maxwills/DebuggingWorkshop2022/tree/main/resources"

	<script>
	DWUtils tryShowPNGImage:
		'https://github.com/maxwills/DebuggingWorkshop2022/raw/main/resources/debugging-hints5.png'
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> scriptZZFixTheBugCheat [

	"Running this script will fix the bug"

	<script>
	SycFormatSourceCodeCommand compile:
		'prepareFullExecutionInContext: aToolContext
	super prepareFullExecutionInContext: aToolContext.
	
	sourceCodeEditor := aToolContext tool
	'.
	self inform: 'Hey, that is cheating! (Bug Fixed). '
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> scriptZZReIntroduceBug [

	"Running this script will re-introduce the bug"

	<script>
	DWUtils introduceFormattingBug.
	self inform: 'Bug reintroduced. Have fun!'
]
