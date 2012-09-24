function enableEditor() {
	window.editor = CodeMirror.fromTextArea(document.getElementById("textarea-for-code"), {
		mode: 'application/x-httpd-php-open',
		indentUnit: 4,
		tabSize:5,
		indentWithTabs: true,
		enterMode: "keep",
		tabMode: "shift",
		smartIndent: false,
		lineNumbers: true, //Linhas
		lineWrapping: true, //Quebra de Linha
		onCursorActivity: function() {
			editor.setLineClass(hlLine, null);
			if (!editor.somethingSelected()) hlLine = editor.setLineClass(editor.getCursor().line, "activeline");
		},
		onUpdate: function() { //Quando atualizar o conteúdo
			$('#attention, #sucesso').empty().fadeOut('slow');
		},
		extraKeys: {
			"F11": function(cm) {
			  setFullScreen(cm, !isFullScreen(cm));
			},
			"Esc": function(cm) {
			  if (isFullScreen(cm)) setFullScreen(cm, false);
			}
		}
	});
	CodeMirror.defineMIME("application/x-httpd-php-open", {name: "php", phpOpen: true});
	var hlLine = editor.setLineClass(0, "activeline");
}
enableEditor();

function toggleHighlight() {
	if (window.enabled) {
		window.editor.toTextArea();
		window.enabled = false;
	} else {
		enableEditor();
		window.enabled = true;		
	}
}
	
function overlay_open() {
	var overlay = document.getElementById("overlay-container");
	var html = document.getElementsByTagName("html")[0];
	html.className = "overlay-open";
	overlay.style.display = "block";
}
	
function overlay_close() {
	var overlay = document.getElementById("overlay-container");
	var html = document.getElementsByTagName("html")[0];
	html.className = "";
	overlay.style.display = "none";
}
	
var phpvsubmit = document.getElementById('phpv-submit');
var codeform = document.getElementById('code-form');
var feedback = document.getElementById('feedback-overlay');
var new_feedback = document.getElementById('new-feedback');

codeform_onsubmit = function() {
	editor.save();
}
	
phpvsubmit.onclick = function() {
	codeform.action = phpvsubmit.href;
	codeform_onsubmit();
	codeform.submit();
	return false;
}

new_feedback.onclick = feedback.onclick = function() {
	overlay_open();
	return false;
}