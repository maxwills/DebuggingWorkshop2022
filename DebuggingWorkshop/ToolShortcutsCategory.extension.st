Extension { #name : #ToolShortcutsCategory }

{ #category : #'*DebuggingWorkshop' }
ToolShortcutsCategory >> openDebuggerPartsImage [

	<shortcut>
	^ KMKeymap shortcut: $l meta shift action: [ 
		  [ 
		  (ZnEasy getPng:
			   'https://github.com/maxwills/DebuggingWorkshop2022/raw/main/resources/debugger-parts.png')
			  asMorph openInWindow ] onErrorDo: [ :e | e resumeUnchecked: e ] ]
]

{ #category : #'*DebuggingWorkshop' }
ToolShortcutsCategory >> openIdea [

	<shortcut>
	^ KMKeymap shortcut: $o meta shift action: [ 
		  [ 
		  (ZnEasy getJpeg:
			   'https://i.imgflip.com/6go95k.jpg')
			  asMorph openInWindow ] onErrorDo: [ :e | e resumeUnchecked: e ] ]
]

{ #category : #'*DebuggingWorkshop' }
ToolShortcutsCategory >> openSad [

	<shortcut>
	^ KMKeymap shortcut: $i meta shift action: [ 
		  [ 
		  (ZnEasy getJpeg:
			   'https://memegenerator.net/img/instances/73648989.jpg')
			  asMorph openInWindow ] onErrorDo: [ :e | e resumeUnchecked: e ] ]
]

{ #category : #'*DebuggingWorkshop' }
ToolShortcutsCategory >> openSunglasses [

	<shortcut>
	^ KMKeymap shortcut: $u meta shift action: [ 
		  [ 
		  (ZnEasy getPng:
			   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCwFtnCb2gLoVAaG90RmpLAU5irDzBL_TuRg&usqp=CAU')
			  asMorph openInWindow ] onErrorDo: [ :e | e resumeUnchecked: e ] ]
]
