CodeMirror.xmlHints['<'] = [
	'levelTop',
	'levelRoot',
	'mainLevel'
];

CodeMirror.xmlHints['<levelTop '] = 
CodeMirror.xmlHints['<levelRoot '] = 
CodeMirror.xmlHints['<mainLevel '] = [
	'property1111',
	'property2222'
];

CodeMirror.xmlHints['<levelTop><'] = 
CodeMirror.xmlHints['<levelRoot><'] = 
CodeMirror.xmlHints['<mainLevel><'] = [
	'second',
	'two'
];

CodeMirror.xmlHints['<levelTop><second '] = [
	
];

CodeMirror.xmlHints['<levelTop><second><'] = [
	'three',
	'x-three'
];