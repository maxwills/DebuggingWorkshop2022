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

	<script>
	(TrialByFireTest >> #testReproductionOfBugIssueNumberOne) browse
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> script00ShowBugReport [

	<script>
	DWUtils tryShowPNGImage:
		'https://github.com/maxwills/DebuggingWorkshop2022/raw/main/resources/debugger-parts.png'
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> script01ShowHint01 [

	<script>
	DWUtils tryShowPNGImage:
		'https://github.com/maxwills/DebuggingWorkshop2022/raw/main/resources/debugger-parts.png'
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> script02ShowHint02 [

	<script>
	DWUtils tryShowPNGImage:
		'https://github.com/maxwills/DebuggingWorkshop2022/raw/main/resources/debugger-parts.png'
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> script03ShowHint03 [

<script>
	DWUtils tryShowPNGImage:
		'https://github.com/maxwills/DebuggingWorkshop2022/raw/main/resources/debugger-parts.png'
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> script04ShowHint04 [

	<script>
	DWUtils tryShowPNGImage:
		'https://github.com/maxwills/DebuggingWorkshop2022/raw/main/resources/debugger-parts.png'
]

{ #category : #'as yet unclassified' }
BaptismByFireHints class >> scriptZZFixTheBugCheat [

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

	<script>
	DWUtils introduceFormattingBug.
	self inform: 'Bug reintroduced. Have fun!'
]
