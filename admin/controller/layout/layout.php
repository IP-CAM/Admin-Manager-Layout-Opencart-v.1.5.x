<?php
class ControllerLayoutLayout extends Controller {
	public function index() {
		//Carrega linguagem Layout
		$this->load->language('layout/layout');

		//Adicionar o titulo
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->getList();
	}
        
	//Função para inserir um novo tema
	public function insert() {
		//Carrega linguagem Layout
		$this->load->language('layout/layout');
			   
		//Adicionar o titulo
		$this->document->setTitle($this->language->get('heading_title'));
		
		//Links
		$this->data['link'] = $this->url->link('layout/layout/insert', 'token=' . $this->session->data['token'], 'SSL');
		
		//Verifica se o usuário enviou os dados e faz a validação
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			
			//Carrega o model layout
			$this->load->model('layout/layout');
			
			//Inseri os dados na tabela layout
			$this->model_layout_layout->insert($_POST);
			
			//Redireciona
			$this->redirect($this->url->link('layout/layout', 'token=' . $this->session->data['token'], 'SSL'));
			
		}
		
		//Carrega tela de formulário
		$this->getForm();
	}
	
	//Carrega a lista com todos temas cadastrados
	private function getList() {
		//Links
		$this->data['linkInsert'] = $this->url->link('layout/layout/insert', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['linkActivate'] = $this->url->link('layout/layout/activateTemplate', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['linkEdit'] = $this->url->link('layout/layout/update', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['linkDelete'] = $this->url->link('layout/layout/deleteTemplate', 'token=' . $this->session->data['token'], 'SSL');
		
		//Captura todos os templates cadastrados
		$sqlGetTemplates = $this->db->query('SELECT * FROM layouts');
		
		//Adiciona o resultado na variavel templates
		$this->data['templates'] = $sqlGetTemplates->rows;
		
		//Breadcrumbs - Inicio
		$url = '';
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
			
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('report/product_viewed', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);
		//Breadcrumbs - Fim
					 
		$this->template = 'layout/layout.tpl';
		$this->children = array(
		'common/header',
		'common/footer'
		);
			
		$this->response->setOutput($this->render());
	}
	
	//Carrega o formulário de adição ou atualização
	private function getForm() {
		//Carrega os model
		$this->load->model('design/layout');
		$this->load->model('design/banner');
		$this->load->model('layout/layout');
		
		$this->load->language('layout/layout');
		$this->data['text_layout'] = $this->language->get('text_layout');

		$this->data['btn_save'] = $this->language->get('btn_save');
		$this->data['btn_cancel'] = $this->language->get('btn_cancel');
		$this->data['entry_remove'] = $this->language->get('entry_remove');
		$this->data['entry_insert'] = $this->language->get('entry_insert');

		$this->data['tab_template'] = $this->language->get('tab_template');
		$this->data['tab_slideshow'] = $this->language->get('tab_slideshow');
		$this->data['tab_banner'] = $this->language->get('tab_banner');
		$this->data['tab_bestseller'] = $this->language->get('tab_bestseller');
		$this->data['tab_featured'] = $this->language->get('tab_featured');
		$this->data['tab_latest'] = $this->language->get('tab_latest');
		$this->data['tab_account'] = $this->language->get('tab_account');
		$this->data['tab_affiliate'] = $this->language->get('tab_affiliate');
		$this->data['tab_carousel'] = $this->language->get('tab_carousel');
		$this->data['tab_category'] = $this->language->get('tab_category');
		$this->data['tab_specials'] = $this->language->get('tab_specials');
		$this->data['tab_images'] = $this->language->get('tab_images');

		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_selectTemplate'] = $this->language->get('entry_selectTemplate');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['entry_banner'] = $this->language->get('entry_banner');
		$this->data['entry_scroll'] = $this->language->get('entry_scroll');
		$this->data['entry_count'] = $this->language->get('entry_count');
		$this->data['entry_dimension'] = $this->language->get('entry_dimension');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_order'] = $this->language->get('entry_order');
		$this->data['entry_top'] = $this->language->get('entry_top');
		$this->data['entry_bottom'] = $this->language->get('entry_bottom');
		$this->data['entry_left'] = $this->language->get('entry_left');
		$this->data['entry_right'] = $this->language->get('entry_right');
		$this->data['entry_enabled'] = $this->language->get('entry_enabled');
		$this->data['entry_disabled'] = $this->language->get('entry_disabled');
		$this->data['entry_product'] = $this->language->get('entry_product');
		$this->data['entry_category_image_size'] = $this->language->get('entry_category_image_size');
		$this->data['entry_product_image_thumb_size'] = $this->language->get('entry_product_image_thumb_size');
		$this->data['entry_product_image_popup_size'] = $this->language->get('entry_product_image_popup_size');
		$this->data['entry_product_image_list_size'] = $this->language->get('entry_product_image_list_size');
		$this->data['entry_additional_product_image_size'] = $this->language->get('entry_additional_product_image_size');
		$this->data['entry_related_product_image_size'] = $this->language->get('entry_related_product_image_size');
		$this->data['entry_compare_image_size'] = $this->language->get('entry_compare_image_size');
		$this->data['entry_wish_list_image_size'] = $this->language->get('entry_wish_list_image_size');
		$this->data['entry_cart_image_size'] = $this->language->get('entry_cart_image_size');
		$this->data['entry_desenvolvido_por'] = $this->language->get('entry_desenvolvido_por');
		
		//Template Atual
		$this->data['currentTemplate'] = $this->config->get('config_template');
		
		//Captura todos Templates - Inicio
		$this->data['templates'] = array();

		$directories = glob(DIR_CATALOG . 'view/theme/*', GLOB_ONLYDIR);
	
		foreach ($directories as $directory) {
			$this->data['templates'][] = basename($directory);

			$this->data['colorsTemplate'] = '';
		}
		
		//Verifica se é o method é diferente de post e se existe o parametro de url id_template
		if (isset($this->request->get['id_template']) && ($this->request->server['REQUEST_METHOD'] != "POST")) {
			$template_info = $this->model_layout_layout->getTemplate($this->request->get['id_template']);
		};
			
		if (!empty($template_info)) {
			$this->data['nameTemplate'] = $template_info->row['nameTemplate'];
		}else{
			$this->data['nameTemplate'] = '';
		}

		if (!empty($template_info)) {
			$this->data['descriptionTemplate'] = $template_info->row['descriptionTemplate'];
		}else{
			$this->data['descriptionTemplate'] = '';
		}

		if (!empty($template_info)) {
			$this->data['slideshow_modules'] = unserialize($template_info->row['slideshow_module']);
		}else{
			$this->data['slideshow_modules'] = unserialize('a:0:{}');
		}
		
		if (!empty($template_info)) {
			$this->data['banner_modules'] = unserialize($template_info->row['banner_module']);
		}else{
			$this->data['banner_modules'] = unserialize('a:0:{}');
		}
		
		if (!empty($template_info)) {
			$this->data['module_bestsellers'] = unserialize($template_info->row['module_bestseller']);
		}else{
			$this->data['module_bestsellers'] = unserialize('a:0:{}');
		}
		
		if (!empty($template_info)) {
			$this->data['featured_modules'] = unserialize($template_info->row['featured_module']);
		}else{
			$this->data['featured_modules'] = unserialize('a:0:{}');
		}
		
		if (!empty($template_info)) {
			$this->data['featured_product'] = $template_info->row['featured_product'];
		}else{
			$this->data['featured_product'] = '';
		}
		
		if (!empty($template_info)) {
			$this->data['latest_modules'] = unserialize($template_info->row['latest_module']);
		}else{
			$this->data['latest_modules'] = unserialize('a:0:{}');
		}
		
		if (!empty($template_info)) {
			$this->data['account_modules'] = unserialize($template_info->row['account_module']);
		}else{
			$this->data['account_modules'] = unserialize('a:0:{}');
		}
		
		if (!empty($template_info)) {
			$this->data['affiliate_modules'] = unserialize($template_info->row['affiliate_module']);
		}else{
			$this->data['affiliate_modules'] = unserialize('a:0:{}');
		}
		
		if (!empty($template_info)) {
			$this->data['carousel_modules'] = unserialize($template_info->row['carousel_module']);
		}else{
			$this->data['carousel_modules'] = unserialize('a:0:{}');
		}
		
		if (!empty($template_info)) {
			$this->data['category_modules'] = unserialize($template_info->row['category_module']);
		}else{
			$this->data['category_modules'] = unserialize('a:0:{}');
		}
		
		if (!empty($template_info)) {
			$this->data['special_modules'] = unserialize($template_info->row['special_module']);
		}else{
			$this->data['special_modules'] = unserialize('a:0:{}');
		}

		if (!empty($template_info)) {
			$this->data['config_image_category_width'] = $template_info->row['config_image_category_width'];
		}else{
			$this->data['config_image_category_width'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_category_height'] = $template_info->row['config_image_category_height'];
		}else{
			$this->data['config_image_category_height'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_thumb_width'] = $template_info->row['config_image_thumb_width'];
		}else{
			$this->data['config_image_thumb_width'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_thumb_height'] = $template_info->row['config_image_thumb_height'];
		}else{
			$this->data['config_image_thumb_height'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_popup_width'] = $template_info->row['config_image_popup_width'];
		}else{
			$this->data['config_image_popup_width'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_popup_height'] = $template_info->row['config_image_popup_height'];
		}else{
			$this->data['config_image_popup_height'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_product_width'] = $template_info->row['config_image_product_width'];
		}else{
			$this->data['config_image_product_width'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_product_height'] = $template_info->row['config_image_product_height'];
		}else{
			$this->data['config_image_product_height'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_additional_width'] = $template_info->row['config_image_additional_width'];
		}else{
			$this->data['config_image_additional_width'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_additional_height'] = $template_info->row['config_image_additional_height'];
		}else{
			$this->data['config_image_additional_height'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_related_width'] = $template_info->row['config_image_related_width'];
		}else{
			$this->data['config_image_related_width'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_related_height'] = $template_info->row['config_image_related_height'];
		}else{
			$this->data['config_image_related_height'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_compare_width'] = $template_info->row['config_image_compare_width'];
		}else{
			$this->data['config_image_compare_width'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_compare_height'] = $template_info->row['config_image_compare_height'];
		}else{
			$this->data['config_image_compare_height'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_wishlist_width'] = $template_info->row['config_image_wishlist_width'];
		}else{
			$this->data['config_image_wishlist_width'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_wishlist_height'] = $template_info->row['config_image_wishlist_height'];
		}else{
			$this->data['config_image_wishlist_height'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_cart_width'] = $template_info->row['config_image_cart_width'];
		}else{
			$this->data['config_image_cart_width'] = '';
		}

		if (!empty($template_info)) {
			$this->data['config_image_cart_height'] = $template_info->row['config_image_cart_height'];
		}else{
			$this->data['config_image_cart_height'] = '';
		}
		
		if (!empty($template_info)) {
			$products = explode(',', $template_info->row['featured_product']);
		}else{
			$products = array('0');
		}
		
		$this->load->model('catalog/product');
		
		$this->data['products'] = array();
		
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name']
				);
			}
		}	
		
		//botao cancel
		$this->data['cancel'] = $this->url->link('layout/layout', 'token=' . $this->session->data['token'], 'SSL');
		
		//Carrega todos layouts
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		//Captura banenrs
		$this->data['banners'] = $this->model_design_banner->getBanners();
		
		//Breadcrumbs - Inicio
			$url = '';
			
	if (isset($this->request->get['page'])) {
		$url .= '&page=' . $this->request->get['page'];
	}
			
	$this->data['breadcrumbs'] = array();

	$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
	);

	$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('report/product_viewed', 'token=' . $this->session->data['token'] . $url, 'SSL'),
				'separator' => ' :: '
	);
			//Breadcrumbs - Fim
			
			 
	$this->template = 'layout/layout_form.tpl';
	$this->children = array(
		'common/header',
		'common/footer'
	);
			
	$this->response->setOutput($this->render());
	}
	
	//Captura todos arquivos de cores do template selecionado
	public function getColorsTemplate() {
		//Captura todos Templates - Inicio
		$colorsTemplate = array();

		$colors = glob(DIR_CATALOG . 'view/theme/'.$this->request->get['nameTemplate'].'/stylesheet/colors/*.css');
		
		foreach ($colors as $color) {
			$colorsTemplate[] = substr(basename($color),0,-4);
		}
		
		$this->response->setOutput(json_encode($colorsTemplate));
	}
	
	//Ativa o layout
	public function activateTemplate() {
		
		$this->load->model('layout/layout');
		$this->model_layout_layout->activateTemplate($this->request->get['id_template']);
		
		$this->redirect($this->url->link('layout/layout', 'token='.$this->session->data['token'], 'SSL'));
		
	}
	
	//Deleta o layout
	public function deleteTemplate() {
		
		$this->load->model('layout/layout');
		if ($this->model_layout_layout->deleteTemplate($this->request->get['id_template']) == true) {
			$this->session->data['notDelete'] = 'Ative outro template para poder deletar esse.';
		}

		$this->redirect($this->url->link('layout/layout', 'token='.$this->session->data['token'], 'SSL'));
		
	}
	
	//Edita Template
	public function update(){
		
		//Links
		$this->data['link'] = $this->url->link('layout/layout/update', 'token=' . $this->session->data['token'] . '&id_template=' . $this->request->get['id_template'], 'SSL');
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()) {
			
			$this->load->model('layout/layout');
			$this->model_layout_layout->updateTemplate($this->request->get['id_template'],$_POST);
			
			$this->redirect($this->url->link('layout/layout', 'token=' . $this->session->data['token'], 'SSL'));
			
		}
		
		$this->getForm();
		
	}

	//Valida o formulário de Inserção dos dados
	private function validateForm () {
		if (!$this->user->hasPermission('modify', 'layout/layout')) {
		$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if($_POST['nameTemplate'] == '-1') {
			$this->error['template'] = 'Por Favor, selecione um tema.';
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>