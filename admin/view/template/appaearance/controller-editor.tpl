<?php
	
	//+--------------------------------------------------------------------------------------+
	//              Verifica se o parâmetro FILE está sendo passado via URL                  |
	//    Caso esteja captura o nome do arquivo, pasta e tema que o arquivo se encontra      |
	//+--------------------------------------------------------------------------------------+
	if (isset($this->request->get['file'])):
		$title = explode('/', $this->request->get['file']);
		$arquivoSelecionado  = ucwords(str_replace('_', ' ', $title[0])).': ';
		$arquivoSelecionado .= ucwords(preg_replace('/_|.php/i', ' ', $title[1]));
		$arquivoSelecionado .= ' <span>('.$title[1].')</span>';
	else:
		$arquivoSelecionado = 'Account <span>(account.php)</span>';
	endif;

?>
<!---------------------------->
<!--         HEADER         -->
<!---------------------------->
<?php echo $header; ?>
<div id="content">
	
	<!---------------------------->
	<!--      BREADCRUMB        -->
	<!---------------------------->
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	
	<!---------------------------->
	<!--          ERROR         -->
	<!---------------------------->
	<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	
	<!---------------------------->
	<!--          BOX           -->
	<!---------------------------->
	<div class="box">
		
		<!---------------------------->
		<!--        HEADING         -->
		<!---------------------------->
		<div class="heading">
			<h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
			<div class="buttons">
				<a href="<?php echo $action_cancel; ?>" class="button"><?php echo $btn_cancel; ?></a>
			</div>
		</div>
		
		<!---------------------------->
		<!--        CONTENT         -->
		<!---------------------------->
		<div class="content">
			
			<!---------------------------->
			<!--  MSG ERRO AND SUCCESS  -->
			<!---------------------------->
			<div class="success" style="display:none" id="sucesso"></div>
			<div class="attention" style="display:none" id="attention"></div>
			
			<!---------------------------->
			<!--THEME |FOLDER | FILENAME-->
			<!---------------------------->
			<div class="headingThemeEditor">
				<h3 class="themeEditorTitle">
					<?php echo $arquivoSelecionado ?>
				</h3>
			</div>
			
			<!---------------------------->
			<!--     CONTENT EDITOR     -->
			<!---------------------------->
			<div class="page-body-wrapper">
				<div class="page-body">
					
					<!---------------------------->
					<!--  OPTIONS FORMAT CODE   -->
					<!---------------------------->
					<div id="formatCode">
						<div class="formatCode">
							<!---------------------------->
							<!--          SAVE          -->
							<!---------------------------->
							<div class="boxFormatCode">
								<div class="save"></div>
							</div>
							
							<!---------------------------->
							<!--       FULLSCREEN       -->
							<!---------------------------->
							<div class="boxFormatCode">
								<div class="fullscreen" title="<?php echo $help_fullscreen; ?>"></div>
							</div>
							
							<!---------------------------->
							<!--   EDITOR BASIC TEXT    -->
							<!---------------------------->
							<div class="boxFormatCode">
								<div class="bold"></div>
								<div class="italic"></div>
								<div class="underline"></div>
								<div class="tracado"></div>
								<span class="lineFormatCode"></span>
								<div class="sub"></div>
								<div class="sup"></div>
							</div>
							
							<!---------------------------->
							<!--     SORT (OL | UL)     -->
							<!---------------------------->
							<div class="boxFormatCode">
								<div class="ol"></div>
								<div class="ul"></div>
							</div>
							
							<!---------------------------->
							<!--       ALIGN TEXT       -->
							<!---------------------------->
							<div class="boxFormatCode">
								<div class="alignLeft"></div>
								<div class="alignCenter"></div>
								<div class="alignRight"></div>
							</div>
							
							<!---------------------------->
							<!--   CARACTER SPECIAL     -->
							<!---------------------------->
							<div class="boxFormatCode">
								<div class="caracterSpecial"></div>
							</div>
							
							<!---------------------------->
							<!--       REDO | UNDO      -->
							<!---------------------------->
							<div class="boxFormatCode">
								<div class="undo"></div>
								<div class="redo"></div>
							</div>
							
							<!---------------------------->
							<!--      FONT FAMILY       -->
							<!---------------------------->
							<div class="boxFormatCodeSelect">
								<select id="fontFamily">
									<option value="font-family:arial,helvetica,sans-serif;">Arial</option>
									<option value="font-family:comic sans ms,cursive;">Comic Sans Ms</option>
									<option value="font-family:courier new,courier,monospace;">Courier News</option>
									<option value="font-family:georgia,serif;">Georgia</option>
									<option value="font-family:lucida sans unicode,lucida grande,sans-serif;">Lucida Sans Unicode</option>
									<option value="font-family:tahoma,geneva,sans-serif;">Tahoma</option>
									<option value="font-family:times new roman,times,serif;">Times New Roman</option>
									<option value="font-family:trebuchet ms,helvetica,sans-serif;">Trebuchet Ms</option>
									<option value="font-family:verdana,geneva,sans-serif;" style="width:150px">Verdana</option>
								</select>
							</div>
							
							<!---------------------------->
							<!--        FONT SIZE       -->
							<!---------------------------->
							<div class="boxFormatCodeSelect">
								<select id="fontSize">
									<option value="font-size:8px;">8</option>
									<option value="font-size:9px;">9</option>
									<option value="font-size:10px;">10</option>
									<option value="font-size:11px;">11</option>
									<option value="font-size:12px;">12</option>
									<option value="font-size:14px;">14</option>
									<option value="font-size:16px;">16</option>
									<option value="font-size:18px;">18</option>
									<option value="font-size:20px;">20</option>
									<option value="font-size:22px;">22</option>
									<option value="font-size:24px;">24</option>
									<option value="font-size:26px;">26</option>
									<option value="font-size:28x;">28</option>
									<option value="font-size:36px;">36</option>
									<option value="font-size:48px;">48</option>
									<option value="font-size:72px;" style="width:30px">72</option>
								</select>
							</div>
							
							<!---------------------------->
							<!--       COLOR TEXT       -->
							<!---------------------------->
							<div class="boxFormatCode">
								<input type="text" class="colorText" />
								<input type="text" class="backgroundText" />
							</div>
							
							<!---------------------------->
							<!--        HIPERLINK       -->
							<!---------------------------->
							<div class="boxFormatCode">
								<div class="hiperlink"></div>
							</div>
							
							<!---------------------------->
							<!--    ADVANCED EDITOR     -->
							<!---------------------------->
							<div class="boxFormatCode">
								<div class="addImage"></div>
								<div class="table"></div>
								<div class="hr"></div>
							</div>
						</div>
					</div>
					
					<!---------------------------->
					<!--         EDITOR         -->
					<!---------------------------->
					<form id="code-form" class="form-for-code" method="post">
						<textarea id="textarea-for-code" class="textarea-for-code" name="code" wrap="off" onkeydown="return catchTab(this,event)" style="display: none; "><?php echo $codFonte ?></textarea>
						<a id="updateFile" onClick="saveFile()" class="button" style="margin-top:15px"><?php echo $btn_saveFile; ?></a>
					</form>
					
					<!---------------------------->
					<!--     LIST OF FILES      -->
					<!---------------------------->
					<div id="listFiles">
						<ul>
							<?php foreach ($arquivos as $key => $values){ ?>
								<?php if ($key != 'name_theme'){ ?>
									<li>
										<h3><?php echo ucwords($key) ?></h3>
										<ul>
										<?php foreach ($values as $value){ ?>
										<li>
											<a style="cursor:pointer" onClick="openFile('<?php echo $key.'%2F'.(basename($value, '.tpl').'%2F') ?>')">
												<?php echo ucwords(preg_replace('/[_-]/i', ' ', basename($value, '.tpl'))) ?><br/>
												<span class="nonessential">(<?php echo basename($value, '') ?>)</span>
											</a>
										</li>
										<?php }; ?>
										</ul>
									</li>
								<?php }; ?>
							<?php }; ?>
						</ul>
					</div> <!-- END LIST OF FILES -->
				</div> <!-- END div class="page-body" -->
			</div> <!-- END div class="page-body-wrapper" -->
			<div id="windowFormatCode"></div>
		</div> <!-- END CONTENT -->
	</div> <!-- END BOX -->
</div> <!-- END ID CONTENT -->

<script src="view/javascript/editor/js/js_editor.js"></script>
<script><!--
	
	//Exibe os arquivos quando clicado no título
	$('#listFiles li').click(function (){
		$('#listFiles li').not(this).find('ul').hide();
		$(this).find('ul').toggle();
	});
	
	//Adiciona a class ListFileActive
	$('#listFiles li ul li').click(function (){
		$(this).addClass('listFileActive');
	});
	
	var top = $('#formatCode').offset().top - parseFloat($('#formatCode').css('marginTop').replace(/auto/, 0));
	$(window).scroll(function (event) {
	// what the y position of the scroll is
		var y = $(this).scrollTop();

		// whether that's below the form
		if (y >= top) {
		  // if so, ad the fixed class
		  $('#formatCode').addClass('formatCodeActive');
		} else {
		  // otherwise remove it
		  $('#formatCode').removeClass('formatCodeActive');
		}
	});
	
	//Verifica se algum texto está selecionado
	function selectedText(){
		if (editor.somethingSelected()){
			return true;
		}else{
			return false;
		}
	}
	
	//Salva o arquivo
	$('.save').click(function(){
		saveFile();
	});
	
	//Entra no modo Fullscreen
	$('.fullscreen').click(function(){
		setFullScreen(editor, !isFullScreen(editor));
	});
	
	//Aplica ou Adiciona bold ao editor
	$('.bold').click(function(){
		bold();
	});
	
	//Aplica ou Adiciona italic ao editor
	$('.italic').click(function(){
		italic();
	});
	
	//Aplica ou Adiciona underline ao editor
	$('.underline').click(function(){
		underline();
	});
	
	//Aplica ou Adiciona um traçado no texot
	$('.tracado').click(function(){
		tracado();
	});
	
	//Aplica ou Adiciona a tag <sub> ao editor
	$('.sub').click(function(){
		if (selectedText()){
			editor.replaceSelection('<sub>' + editor.getSelection() + '</sub>');
		}else{
			editor.replaceSelection('<sub></sub>');
		}
	});
	
	//Aplica ou Adiciona a tag <sup> ao editor
	$('.sup').click(function(){
		if (selectedText()){
			editor.replaceSelection('<sup>' + editor.getSelection() + '</sup>');
		}else{
			editor.replaceSelection('<sup></sup>');
		}
	});
	
	//Aplica ou Adiciona uma lista ordenada
	$('.ol').click(function(){
		if (!selectedText()){
			editor.replaceSelection('<ol><li></li></ol>');
			autoFormatSelection(false);
			editor.focus();
		}
	});
	
	//Aplica ou Adiciona uma lista não ordenada
	$('.ul').click(function(){
		if (!selectedText()){
			editor.replaceSelection('<ul><li></li></ul>');
			autoFormatSelection(false);
			editor.focus();
		}
	});
	
	//Adiciona o texto ao lado esquerdo
	$('.alignLeft').click(function(){
		alignTextLeft();
	});
	
	//Centraliza um texto
	$('.alignCenter').click(function(){
		alignTextCenter();
	});
	
	//Adiciona o texto ao lado direito
	$('.alignRight').click(function(){
		alignTextRight();
	});
	
	//Adiciona um caractere especial ao editor
	$('.caracterSpecial').click(function(){
		characterSpecial();
	});
	
	//Desfaz uma ação
	$('.undo').click(function(){
		undo();
	});
	
	//Refaz uma ação
	$('.redo').click(function(){
		redo();
	});
	
	//Altera a fonte
	$('select#fontFamily').selectmenu({
		select: function(event, options) {
			if (selectedText()){
				editor.replaceSelection('<span style="' + options.value + '">' + editor.getSelection() + '</span>');
			}else{
				editor.replaceSelection('<span style="' + options.value + '"></span>');
			}
		}
	});
	
	//Altera o tamanho da fonte
	$('select#fontSize').selectmenu({
		select: function(event, options) {
			if (selectedText()){
				editor.replaceSelection('<span style="' + options.value + '">' + editor.getSelection() + '</span>');
			}else{
				editor.replaceSelection('<span style="' + options.value + '"></span>');
			}
		}
	});
	
	//Mudar cor do Texto
	$('.colorText').ColorPicker({
		color: '#0000ff',
		onHide: function (colpkr) {
			$(colpkr).fadeOut(500);
			return false;
		},
		onSubmit: function(hsb, hex, rgb, el) {
			if (selectedText()){
				editor.replaceSelection('<span style="color:#' + hex + '">' + editor.getSelection() + '</span>');
			}else{
				editor.replaceSelection('<span style="color:#' + hex + '"></span>');
			}
			editor.focus();
			$(el).ColorPickerHide();
		},
		onBeforeShow: function (hsb, hex, rgb, el) {
			$(this).ColorPickerSetColor(this.value);
		}
	});
	
	//Mudar backgorund do Texto
	$('.backgroundText').ColorPicker({
		color: '#0000ff',
		onHide: function (colpkr) {
			$(colpkr).fadeOut(500);
			return false;
		},
		onSubmit: function(hsb, hex, rgb, el) {
			if (selectedText()){
				editor.replaceSelection('<span style="background-color:#' + hex + '">' + editor.getSelection() + '</span>');
			}else{
				editor.replaceSelection('<span style="background-color:#' + hex + '"></span>');
			}
			editor.focus();
			$(el).ColorPickerHide();
		},
		onBeforeShow: function (hsb, hex, rgb, el) {
			$(this).ColorPickerSetColor(this.value);
		}
	});
	
	//Adiciona um link ao editor
	$('.hiperlink').click(function(){
		addLink();
	});
	
	//Adiciona uma imagem ao editor
	$('.addImage').click(function(){
		addImage();
	});
	
	//Adiciona uma tabela ao editor
	$('.table').click (function (){
		addTable();
	});
	
	//Adiciona um linha horizontal ao texto
	$('.hr').click (function (){
		editor.replaceSelection('<hr />');
	});
	
	//Função para salvar o arquivo
	function saveFile(){
		$.ajax({
			url: 'index.php?route=appaearance/controllereditor/saveFile/&token=<?php echo $this->session->data['token'].'&file='.urlencode($_GET['file']) ?>',
			type: 'post',
			data: 'code='+editor.getValue(),
			dataType: 'json',
			success: function (data){
				
				if (data['sucesso']){
					$('#sucesso').html(data['sucesso']);
					$('#sucesso').fadeIn('fast');
				};
				
				if (data['erro']){
					$('#attention').html(data['erro']).fadeIn('slow');
				};
			}
		});
	}
	
	//Função que Refaz uma ação
	function redo(){
		editor.redo();
		editor.focus();
	}
	
	//Função que Desfaz uma ação
	function undo(){
		editor.undo();
		editor.focus();
	}
	
	//Função que inseri um caractere especial
	function characterSpecial(){
		$('#windowFormatCode').load('view/javascript/editor/mode/caracterSpecial/caracterSpecial.html').dialog({
			title:'<?php echo $entry_characterSpecial; ?>',
			modal:true,
			buttons: {
				"<?php echo $btn_cancel; ?>": function (){
					$(this).dialog('close')
				}
			},
			height:378,
			width:464
		});
	}
	
	//Função que adiciona uma tabela
	function addTable(){
		$('#windowFormatCode').load('view/javascript/editor/mode/table/table.html').dialog({
			title:'<?php echo $entry_table; ?>',
			modal:true,
			buttons: {
				"<?php echo $btn_insert; ?>": function (){
					
					//Captura o valor TH (cabeçalho)
					var TH   = $('#th').val();
					//Caso a variavel esja false o cabeçalho da primeira linha não é criado
					var ThY  = true;
					//Caso a variavel esja false o cabeçalho da primeira coluna não é criado
					var TdY  = true;
					//Captura a quantidade de TR
					var TR   = $('#tr').val();
					//Captura a quantidade de TD
					var TD   = $('#td').val();
					var code = '';
					
					if ($('#cellspacing').val() != ''){
						var Cellspacing = 'cellspacing="'+$('#cellspacing').val()+'" ';
					}else{
						var Cellspacing = '';
					}
					
					if ($('#cellpadding').val() != ''){
						var Cellpadding = 'cellpadding="'+$('#cellpadding').val()+'" ';
					}else{
						var Cellpadding = '';
					}
					
					if ($('#align').val() != ''){
						var Align = 'align="'+$('#align').val()+'" ';
					}else{
						var Align = '';
					}
					
					if ($('#caption').val() != ''){
						var Caption = '<caption>'+$('#caption').val()+'</caption>';
					}else{
						var Caption = '';
					}
					
					if ($('#summary').val() != ''){
						var Summary = 'summary="'+$('#summary').val()+'" ';
					}else{
						var Summary = '';
					}
					
					if ($('#id').val() != ''){
						var Id = 'id="'+$('#id').val()+'" ';
					}else{
						var Id = '';
					}
					
					if ($('#dir').val() != ''){
						var Dir = 'dir="'+$('#dir').val()+'" ';
					}else{
						var Dir = '';
					}
					
					if ($('#style').val() != ''){
						var Style = 'style="'+$('#style').val()+'"';
					}else{
						var Style = '';
					}
					
					if ($('#class').val() != ''){
						var Class = 'class="'+$('#class').val()+'" ';
					}else{
						var Class = '';
					}
					
					for (i = 1; i <= TR; i++){
						TdY  = true;
						//Cria o cabeçalho da Primeira Linha
						if (TH == 'thead' || TH == 'thead_and_tr' && ThY == true){
							code += '<thead>';
								code += '<tr>';
								for (z = 1; z <= TD; z++){
									code += '<th scope="col">&nbsp;</th>';
								}
								code += '</tr>';
							code += '</thead>';
							ThY = false;
						}
						
						//Cria os TR's da tabela
						code += '<tr>';
							for (j = 1; j < TD; j++){
								//Cria o cabeçalho da primeira linha
								if (TH == 'thead_and_tr' || TH == 'tr' && TdY == true){
									code += '<th scope="row">&nbsp;</th>';
								}
								//Define variavel como false, para não criar mais de um TH por TR
								TdY  = false;
								code += '<td>&nbsp;</td>';
							}
						//Fecha TR
						code += '</tr>';
					}
					
					editor.replaceSelection('<table '+Cellspacing+Cellpadding+Align+Id+Dir+Style+Class+'>'+Caption+code+'</table>');
					$(this).dialog('close');
					autoFormatSelection(false);
					editor.focus();
				},
				"<?php echo $btn_cancel; ?>": function (){
					$(this).dialog('close');
				}
			},
			height:500,
			width:400
		});
	}
	
	//Função que adiciona uma imagem
	function addImage() {
		$('#windowFormatCode').load('view/javascript/editor/mode/image/image.php').dialog({
			title:'<?php echo $entry_image; ?>',
			modal:true,
			buttons: {
				"<?php echo $btn_insert; ?>": function (){
					if ($('#link_image').val() != ''){
						var linkImage = 'scr="'+$('#link_image').val()+'" ';
					}else{
						var linkImage = '';
					}
					
					if ($('#alt').val() != ''){
						var Alt = 'alt="'+$('#alt').val()+'" ';
					}else{
						var Alt = '';
					}
					
					if ($('#border').val() != ''){
						var Border = 'border="'+$('#border').val()+'" ';
					}else{
						var Border = '';
					}
					
					if ($('#hspace').val() != ''){
						var HSpace = 'hspace="'+$('#hspace').val()+'" ';
					}else{
						var HSpace = '';
					}
					
					if ($('#vspace').val() != ''){
						var VSpace = 'vspace="'+$('#vspace').val()+'" ';
					}else{
						var VSpace = '';
					}
					
					if ($('#link_image').val() != '' && $('#target').val() != ''){
						var startUrl = '<a href="'+$('#url').val()+'" target="'+$('#target').val()+'">'+$('#url').val();
						var endUrl   = '</a>';
					}else{
						var startUrl = '';
						var endUrl   = '';
					}
					
					if ($('#id').val() != ''){
						var Id = 'id="'+$('#id').val()+'" ';
					}else{
						var Id = '';
					}
					
					if ($('#dir').val() != ''){
						var Dir = 'dir="'+$('#dir').val()+'" ';
					}else{
						var Dir = '';
					}
					
					if ($('#lang').val() != ''){
						var Lang = 'lang="'+$('#lang').val()+'" ';
					}else{
						var Lang = '';
					}
					
					if ($('#longdesc').val() != ''){
						var longDesc = 'longdesc="'+$('#longdesc').val()+'" ';
					}else{
						var longDesc = '';
					}
					
					if ($('#class').val() != ''){
						var Class = 'class="'+$('#class').val()+'" ';
					}else{
						var Class = '';
					}
					
					if ($('#title').val() != ''){
						var Title = 'title="'+$('#title').val()+'" ';
					}else{
						var Title = '';
					}
					
					if ($('#style').val() != ''){
						var Style = 'style="'+$('#style').val()+'" ';
					}else{
						var Style = '';
					}
					
					
					editor.replaceSelection(startUrl + '<img ' + linkImage + Alt + Border + HSpace + VSpace + VSpace + Dir + Lang + longDesc + Class + Title + Style + '/>' + endUrl);
					$(this).dialog('close');
					autoFormatSelection(false);
					editor.focus();
				},
				"<?php echo $btn_cancel; ?>": function (){
					$(this).dialog('close');
				}
			},
			height:500,
			width:464
		});
	}
	
	//Função que adiciona um link
	function addLink() {
		$('#windowFormatCode').load('view/javascript/editor/mode/hiperlink/hiperlink.php').dialog({
			title:'<?php echo $entry_hiperlink; ?>',
			modal:true,
			buttons: {
				"<?php echo $btn_insert; ?>": function (){
					if ($('#accesskey').val() != '') {
						var Accesskey = 'accesskey='+$('#accesskey').val()+'" ';
					}else{
						var Accesskey = '';
					};
					
					if ($('#charset').val() != '') {
						var Charset = 'charset="'+$('#charset').val()+'" ';
					}else{
						var Charset = '';
					};
					
					
					if ($('#class').val() != '') {
						var Class = 'class="'+$('#class').val()+'" ';
					}else{
						var Class = '';
					};
					
					
					if ($('#dir').val() != '') {
						var Dir = 'dir="'+$('#dir').val()+'" ';
					}else{
						var Dir = '';
					};
					
					
					if ($('#href').val() != '') {
						var Href = 'href="'+$('#protocol').val()+$('#url').val()+'" ';
						var nameUrl = $('#protocol').val()+$('#url').val();
					}else{
						var Href = '';
						var nameUrl = '';
					};
					
					
					if ($('#id').val() != '') {
						var Id = 'id="'+$('#id').val()+'" ';
					}else{
						var Id = '';
					};
					
					
					if ($('#language').val() != '') {
						var Lang = 'language="'+$('#language').val()+'" ';
					}else{
						var Lang = '';
					};
					
					
					if ($('#name').val() != '') {
						var Name = 'name="'+$('#name').val()+'" ';
					}else{
						var Name = '';
					};
					
					
					if ($('#rel').val() != '') {
						var Rel = 'rel="'+$('#rel').val()+'" ';
					}else{
						var Rel = '';
					};
					
					
					if ($('#style').val() != '') {
						var Style = 'style="'+$('#style').val()+'" ';
					}else{
						var Style = '';
					};
					
					
					if ($('#tabIndex').val() != '') {
						var Tabindex = 'tabIndex="'+$('#tabIndex').val()+'" ';
					}else{
						var Tabindex = '';
					};
					
					
					if ($('#target').val() != '') {
						var Target = '"target='+$('#target').val()+'" ';
					}else{
						var Target = '';
					};
					
					
					if ($('#title').val() != '') {
						var Title = 'title="'+$('#title').val()+'" ';
					}else{
						var Title = '';
					};
					
					
					if ($('#type').val() != '') {
						var Type = 'type="'+$('#type').val()+'"';
					}else{
						var Type = '';
					};
					
					editor.replaceSelection('<a ' + Accesskey + Charset + Class + Dir + Href + Id + Lang + Name + Rel + Style + Tabindex + Target + Title + Type + '>' + nameUrl + '</a>');
					$(this).dialog('close');
					autoFormatSelection(false);
					editor.focus();
				},
				"<?php echo $btn_cancel; ?>": function (){
					$(this).dialog('close');
				}
			},
			height:378,
			width:464
		});
	}
	
	//Função que alinha texto a direita
	function alignTextRight() {
		if (selectedText()){
			editor.replaceSelection('<span style="text-align:right;">' + editor.getSelection() + '</span>');
		}else{
			editor.replaceSelection('<span style="text-align:right;"></span>');
		}
		editor.focus();
	}
	
	//Função que alinha texto ao centro
	function alignTextCenter() {
		if (selectedText()){
			editor.replaceSelection('<span style="text-align:center;">' + editor.getSelection() + '</span>');
		}else{
			editor.replaceSelection('<span style="text-align:center;"></span>');
		}
		editor.focus();
	}
	
	//Função que alinha texto a esquerda
	function alignTextLeft() {
		if (selectedText()){
			editor.replaceSelection('<span style="text-align:left;">' + editor.getSelection() + '</span>');
		}else{
			editor.replaceSelection('<span style="text-align:left;"></span>');
		}
		editor.focus();
	}
	
	//Função que adiciona texto em bold
	function bold() {
		if (selectedText()){
			editor.replaceSelection('<span style="font-weight:bold;">' + editor.getSelection() + '</span>');
		}else{
			editor.replaceSelection('<span style="font-weight:bold;"></span>');
		}
		editor.focus();
	}
	
	//Função que adiciona texto em italic
	function italic() {
		if (selectedText()){
			editor.replaceSelection('<em>' + editor.getSelection() + '</em>');
		}else{
			editor.replaceSelection('<em></em>');
		}
		editor.focus();
	}
	
	//Função que adiciona texto em underline
	function underline() {
		if (selectedText()){
			editor.replaceSelection('<u>' + editor.getSelection() + '</u>');
		}else{
			editor.replaceSelection('<u></u>');
		}
		editor.focus();
	}
	
	//Função que adiciona um traçado no texto
	function tracado(){
		if (selectedText()){
			editor.replaceSelection('<strike>' + editor.getSelection() + '</strike>');
		}else{
			editor.replaceSelection('<strike></strike>');
		}
		editor.focus();
	}
	
	//Seleciona Tudo
	function getSelectedRange() {
		return { from: editor.getCursor(true), to: editor.getCursor(false) };
	}

	//Auto Formata o Código
	function autoFormatSelection(selectAll) {
		editor.setOption("mode", "htmlmixed");
		if (selectAll)
			CodeMirror.commands["selectAll"](editor);
		var range = getSelectedRange();
		editor.autoFormatRange(range.from, range.to);
		editor.setOption("mode", "application/x-httpd-php-open");
	}
	
	//Seleciona tema
	function selectTheme() {
		var theme = $('#select').val();
		editor.setOption("theme", theme);
	}
	
	//Verifica se está no modo FullScreen
	function isFullScreen(cm) {
      return /\bCodeMirror-fullscreen\b/.test(cm.getWrapperElement().className);
    }
	
	//Captura a altura da tela
    function winHeight() {
      return window.innerHeight || (document.documentElement || document.body).clientHeight;
    }
	
	//Fullscreen
    function setFullScreen(cm, full) {
	  $('#formatCode').removeClass('formatCodeActive');
      var wrap = cm.getWrapperElement(), scroll = cm.getScrollerElement();
      if (full) {
        wrap.className += " CodeMirror-fullscreen";
        scroll.style.height = winHeight() + "px";
        document.documentElement.style.overflow = "hidden";
      } else {
        wrap.className = wrap.className.replace(" CodeMirror-fullscreen", "");
        scroll.style.height = "";
        document.documentElement.style.overflow = "";
      }
      cm.refresh();
	  editor.focus();
    }
    
	CodeMirror.connect(window, "resize", function() {
      var showing = document.body.getElementsByClassName("CodeMirror-fullscreen")[0];
      if (!showing) return;
      showing.CodeMirror.getScrollerElement().style.height = winHeight() + "px";
    });
	
	//Atalho de Salvar
	shortcut.add("Ctrl+S",function() {
		saveFile();
	});
	
	//Atalho para adicionar o efeito bold ao texto
	shortcut.add("Ctrl+B",function() {
		bold();
	});
	
	//Atalho para adicionar o efeito italic ao texto
	shortcut.add("Ctrl+I",function() {
		italic();
	});
	
	//Atalho para adicionar o efeito underline ao texto
	shortcut.add("Ctrl+U",function() {
		underline();
	});
	
	//Atalho para adicionar o efeito traçado ao texto
	shortcut.add("Ctrl+T",function() {
		tracado();
	});
	
	//Atalho para alinhar o texto a esquerda
	shortcut.add("Ctrl+L",function() {
		alignTextLeft();
	});
	
	//Atalho para centralizar o texto
	shortcut.add("Ctrl+E",function() {
		alignTextCenter();
	});
	
	//Atalho para alinhar o texto a direita
	shortcut.add("Ctrl+R",function() {
		alignTextRight();
	});
	
	//Atalho para adicionar um caractere especial
	shortcut.add("Ctrl+H",function() {
		characterSpecial();
	});
	
	//Atalho para undo uma ação
	shortcut.add("Ctrl+Z",function() {
		undo();
	});
	
	//Atalho para redo uma ação
	shortcut.add("Ctrl+Y",function() {
		redo();
	});
	
	//Atalho para adicionar um link
	shortcut.add("Ctrl+K",function() {
		addLink();
	});
	
	//Atalho para adicionar uma imagem
	shortcut.add("Ctrl+M",function() {
		addImage();
	});
	
	//Atalho para adicionar uma tabela
	shortcut.add("Ctrl+D",function() {
		addTable();
	});
	
	//Abre arquivo
	function openFile(urlFile){
		location = "index.php?route=appaearance/controllereditor/&token=<?php echo $this->session->data['token'] ?>&file="+urlFile+url;
	};
	
//--></script>
<?php echo $footer; ?>