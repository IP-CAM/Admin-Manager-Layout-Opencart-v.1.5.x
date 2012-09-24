<?php
class ControllerAppaearanceModeleditor extends Controller {
	private $error = array(); 
	
	public function index() {
		
		//Carrega linguagem
		$this->load->language('appaearance/themeditor');
		//Define o <title></title> da página
		$this->document->setTitle($this->language->get('heading_title'));
		//Captura o titúlo
		$this->data['heading_title'] = $this->language->get('heading_title');
		//Selecione o tema
		$this->data['entry_selectTheme'] = $this->language->get('entry_selectTheme');
		//Caractere Especial
		$this->data['entry_characterSpecial'] = $this->language->get('entry_characterSpecial');
		//Adicionar Hiperlink
		$this->data['entry_hiperlink'] = $this->language->get('entry_hiperlink');
		//Adicionar Imagem
		$this->data['entry_image'] = $this->language->get('entry_image');
		//Adicionar Tabela
		$this->data['entry_table'] = $this->language->get('entry_table');
		//Botão para Selecionar
		$this->data['btn_select'] = $this->language->get('btn_select');
		//Botaão para cancelar
		$this->data['btn_cancel'] = $this->language->get('btn_cancel');
		//Botaão para salvar o arquivo
		$this->data['btn_saveFile'] = $this->language->get('btn_saveFile');
		//Botão de inserir
		$this->data['btn_insert'] = $this->language->get('btn_insert');
		//Tab de informação
		$this->data['tabs_information'] = $this->language->get('tabs_information');
		//Tab de destino
		$this->data['tabs_destiny'] = $this->language->get('tabs_destiny');
		//Tab avançados
		$this->data['tabs_advanced'] = $this->language->get('tabs_advanced');
		//Tab para editar link
		$this->data['tabs_editLink'] = $this->language->get('tabs_editLink');
		//Tab para formatar tabela
		$this->data['tabs_formatTable'] = $this->language->get('tabs_formatTable');
		//Ajuda com fullscreen
		$this->data['help_fullscreen'] = $this->language->get('help_fullscreen');
		
		//Actions Buttons
		$this->data['action_cancel'] = $this->url->link('common/home', 'token=' . $this->session->data['token']);
		
		//Verifica se o parâmetro FILE está sendo passado via URL | Caso exista captura o código fonte do arquivo
		if (isset($this->request->get['file'])):
			$dados = explode('/', $this->request->get['file']);
			$this->data['codFonte'] = $this->capturaCodFonte($dados[1], $dados[0]);
		else:
			$this->data['codFonte'] = $this->capturaCodFonte(DIR_CATALOG . 'model/account/address.php');
		endif;
		
		$this->data['arquivos'] = $this->capturaLink();
		
		//Erro
		$this->data['error_warning'] = null;
		
		
		//Breadcrumbs
		$this->data['breadcrumbs'] = array();
		
		$this->data['breadcrumbs'][] = array(
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token']),
			'text' => $this->language->get('entry_home'),
			'separator' => false
		);
		
		$this->data['breadcrumbs'][] = array(
			'href' => 'appaearance/themeeditor',
			'text' => $this->language->get('heading_title'),
			'separator' => '  ::  '
		);
		
		//CSS
		$this->document->addStyle('view/javascript/editor/css/codemirror.css');
		$this->document->addStyle('view/javascript/editor/util/dialog.css');
		$this->document->addStyle('view/javascript/editor/colorpicker/colorpicker.css');
		$this->document->addStyle('view/javascript/jquery/ui/themes/base/jquery.ui.selectmenu.css');
		$this->document->addStyle('view/javascript/jquery/ui/themes/base/jquery.ui.tabs.css');
		
		//CSS - Themes
		$this->document->addStyle('view/javascript/editor/theme/ambiance.css');
		$this->document->addStyle('view/javascript/editor/theme/blackboard.css');
		$this->document->addStyle('view/javascript/editor/theme/cobalt.css');
		$this->document->addStyle('view/javascript/editor/theme/eclipse.css');
		$this->document->addStyle('view/javascript/editor/theme/elegant.css');
		$this->document->addStyle('view/javascript/editor/theme/erlang-dark.css');
		$this->document->addStyle('view/javascript/editor/theme/lesser-dark.css');
		$this->document->addStyle('view/javascript/editor/theme/monokai.css');
		$this->document->addStyle('view/javascript/editor/theme/neat.css');
		$this->document->addStyle('view/javascript/editor/theme/night.css');
		$this->document->addStyle('view/javascript/editor/theme/rubyblue.css');
		$this->document->addStyle('view/javascript/editor/theme/vibrant-ink.css');
		$this->document->addStyle('view/javascript/editor/theme/xq-dark.css');
		
		//Javascript
		$this->document->addScript('view/javascript/editor/codemirror.js');
		$this->document->addScript('view/javascript/editor/util/formatting.js');
		$this->document->addScript('view/javascript/editor/mode/xml/xml.js');
		$this->document->addScript('view/javascript/editor/mode/javascript/javascript.js');
		$this->document->addScript('view/javascript/editor/mode/css/css.js');
		$this->document->addScript('view/javascript/editor/js/clike.js');
		$this->document->addScript('view/javascript/editor/mode/php/php.js');
		$this->document->addScript('view/javascript/editor/mode/htmlmixed/htmlmixed.js');
		$this->document->addScript('view/javascript/shortcut.js');
		$this->document->addScript('view/javascript/editor/util/searchcursor.js');
		$this->document->addScript('view/javascript/editor/util/search.js');
		$this->document->addScript('view/javascript/editor/util/dialog.js');
		$this->document->addScript('view/javascript/editor/colorpicker/colorpicker.js');
		$this->document->addScript('view/javascript/editor/colorpicker/eye.js');
		$this->document->addScript('view/javascript/jquery/ui/minified/jquery.ui.selectmenu.js');
		
		$this->template = 'appaearance/model-editor.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	//Captura o o link de todos arquivos .tpl do tema definido
	public function capturaLink(){
		
		$nArray = array();
		
		$array = $this->list_files( DIR_CATALOG . 'model');

		foreach ($array as $key => $value):
			
			if (strpos($value, '/account/'))
				$nArray['account'][] = $value;
				
			if (strpos($value, '/affiliate/'))
				$nArray['affiliate'][] = $value;
				
			if (strpos($value, '/model/catalog/'))
				$nArray['catalog'][] = $value;
				
			if (strpos($value, '/checkout/'))
				$nArray['checkout'][] = $value;
				
			if (strpos($value, '/design/'))
				$nArray['design'][] = $value;
				
			if (strpos($value, '/localisation/'))
				$nArray['localisation'][] = $value;
				
			if (strpos($value, '/payment/'))
				$nArray['payment'][] = $value;
				
			if (strpos($value, '/setting/'))
				$nArray['setting'][] = $value;
				
			if (strpos($value, '/shipping/'))
				$nArray['shipping'][] = $value;
				
			if (strpos($value, '/tool/'))
				$nArray['tool'][] = $value;
				
			if (strpos($value, '/total/'))
				$nArray['total'][] = $value;
			
		endforeach;
		
		return $nArray;
	}
	
	//Captura código fonte de um arquivo
	public function capturaCodFonte($filename = '', $folder = ''){
		// lê o conteúdo do arquivo para uma string
		if (empty($theme) && empty($folder)):
			$conteudo = file_get_contents($filename);
		else:
			$conteudo = file_get_contents(DIR_CATALOG . 'model/' . $folder . '/'.$filename);
		endif;
		
		return $conteudo;
	}
	
	//Lista todos arquivos
	public function list_files( $folder = '') {
		
		if ( empty($folder) )
			return false;

		$files = array();
		if ( $dir = @opendir( $folder ) ) {
			while (($file = readdir( $dir ) ) !== false ) {
				if ( in_array($file, array('.', '..') ) )
					continue;
				if ( is_dir( $folder . '/' . $file ) ) {
					$files2 = $this->list_files( $folder . '/' . $file);
					if ( $files2 )
						$files = array_merge($files, $files2 );
				} else {
					$extension = substr($file, strlen($file)-3, 3);
					if ($extension == 'php')
					$files[] = $folder . '/' . $file;
				}
			}
		}
		@closedir( $dir );
		return $files;
	}
	
	//Salva um arquivo
	public function saveFile(){
		$dados = explode('/', $this->request->get['file']);
		list($folder, $filename) = $dados;
		
		$handler = fopen(DIR_CATALOG . 'model/'.$folder.'/'.$filename, 'w+');
		
		if (fwrite($handler, html_entity_decode($this->request->post['code']))):
			echo json_encode(array('sucesso' => 'O arquivo <i><u>' . ucwords($folder) . ': ' . ucwords(preg_replace('/_|.php/i', ' ', $filename)) . ' <span>(' . $filename . '.tpl)</span></u></i> foi editado com sucesso!'));
		else:
			echo json_encode(array('erro' => 'Erro ao tentar editar o arquivo <i><u>' . ucwords($folder) . ': ' . ucwords(preg_replace('/_|.php/i', ' ', $filename)) . ' <span>(' . $filename . '.tpl)</span></u></i>!'));
		endif;
	}
	
} ?>