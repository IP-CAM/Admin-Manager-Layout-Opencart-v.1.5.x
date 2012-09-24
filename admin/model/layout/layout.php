<?php
class ModelLayoutLayout extends Model {
    
    //Cadastra novos templates no banco de dados
    public function insert($data){
		
		if (!empty($data['slideshow_module'])):
			$data['slideshow_module'] = serialize($data['slideshow_module']);
		else:
			$data['slideshow_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['banner_module'])):
			$data['banner_module'] = serialize($data['banner_module']);
		else:
			$data['banner_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['module_bestseller'])):
			$data['module_bestseller'] = serialize($data['module_bestseller']);
		else:
			$data['module_bestseller'] = 'a:0:{}';
		endif;
		
		if (!empty($data['featured_module'])):
			$data['featured_module'] = serialize($data['featured_module']);
		else:
			$data['featured_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['account_module'])):
			$data['account_module'] = serialize($data['account_module']);
		else:
			$data['account_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['affiliate_module'])):
			$data['affiliate_module'] = serialize($data['affiliate_module']);
		else:
			$data['affiliate_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['carousel_module'])):
			$data['carousel_module'] = serialize($data['carousel_module']);
		else:
			$data['carousel_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['category_module'])):
			$data['category_module'] = serialize($data['category_module']);
		else:
			$data['category_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['special_module'])):
			$data['special_module'] = serialize($data['special_module']);
		else:
			$data['special_module'] = 'a:0:{}';
		endif;
		
        $sql = "INSERT INTO `" . DB_DATABASE . "`.`layouts` (`nameTemplate`, `descriptionTemplate`, `slideshow_module`, `banner_module`, `featured_module`, `featured_product`, `account_module`, `affiliate_module`, `carousel_module`, `category_module`, `special_module`, `config_image_category_width`, `config_image_category_height`, `config_image_thumb_width`, `config_image_thumb_height`, `config_image_popup_width`, `config_image_popup_height`, `config_image_product_width`, `config_image_product_height`, `config_image_additional_width`, `config_image_additional_height`, `config_image_related_width`, `config_image_related_height`, `config_image_compare_width`, `config_image_compare_height`, `config_image_wishlist_width`, `config_image_wishlist_height`, `config_image_cart_width`, `config_image_cart_height`) 
                VALUES ('".$data['nameTemplate']."', 
                                '".$data['descriptionTemplate']."', 
                                '".$data['slideshow_module']."', 
                                '".$data['banner_module']."',
                                '".$data['featured_module']."',
                                '".$data['featured_product']."',
                                '".$data['account_module']."',
                                '".$data['affiliate_module']."',
                                '".$data['carousel_module']."',
                                '".$data['category_module']."',
                                '".$data['special_module']."',
                                '".$data['config_image_category_width']."', 
                                '".$data['config_image_category_height']."', 
                                '".$data['config_image_thumb_width']."', 
                                '".$data['config_image_thumb_height']."', 
                                '".$data['config_image_popup_width']."', 
                                '".$data['config_image_popup_height']."', 
                                '".$data['config_image_product_width']."', 
                                '".$data['config_image_product_height']."', 
                                '".$data['config_image_additional_width']."', 
                                '".$data['config_image_additional_height']."', 
                                '".$data['config_image_related_width']."', 
                                '".$data['config_image_related_height']."', 
                                '".$data['config_image_compare_width']."', 
                                '".$data['config_image_compare_height']."', 
                                '".$data['config_image_wishlist_width']."', 
                                '".$data['config_image_wishlist_height']."', 
                                '".$data['config_image_cart_width']."', 
                                '".$data['config_image_cart_height']."');";
        
        $this->db->query($sql);
        
    }
    
    //Ativa o template selecionado
    public function activateTemplate($id) {
        
		//Carrega os models
		$this->load->model('setting/setting');
		$this->load->model('setting/extension');
		
        //Ativa o template selecionado
        $this->db->query("UPDATE  `layouts` SET  `activated` =  '1' WHERE  `layouts`.`id` = ". $id .";");
        
        //Desativa os demais templates
        $this->db->query("UPDATE  `layouts` SET  `activated` =  '0' WHERE  `layouts`.`id` != ". $id .";");
        
        $data = $this->db->query('SELECT * FROM layouts WHERE id = "' . $id . '"');
		
		//Captura todos os modulos instalados
		$modules_install = $this->model_setting_extension->getInstalled('module');
		
		//Banner Simples
		if (!in_array('banner', $modules_install))
			$this->model_setting_extension->install('module', 'banner');
		
		//Fabricantes
		if (!in_array('carousel', $modules_install))
			$this->model_setting_extension->install('module', 'carousel');
		
		//Destaques
		if (!in_array('featured', $modules_install))
			$this->model_setting_extension->install('module', 'featured');
		
		//Slideshow
		if (!in_array('slideshow', $modules_install))
			$this->model_setting_extension->install('module', 'slideshow');
		
		//Últimos Produtos
		if (!in_array('latest', $modules_install))
			$this->model_setting_extension->install('module', 'latest');
		
		//Account
		if (!in_array('account', $modules_install))
			$this->model_setting_extension->install('module', 'account');
		
		//Afiliados
		if (!in_array('affiliate', $modules_install))
			$this->model_setting_extension->install('module', 'affiliate');
		
		//Carrossel
		if (!in_array('carousel', $modules_install))
			$this->model_setting_extension->install('module', 'carousel');
		
		//Categoria
		if (!in_array('category', $modules_install))
			$this->model_setting_extension->install('module', 'category');
		
		//Promoção / Especial
		if (!in_array('special', $modules_install))
			$this->model_setting_extension->install('module', 'special');
		
		
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['nameTemplate'] . "' WHERE  `key` = 'config_template';");
		$this->model_setting_setting->editSetting('slideshow', array('slideshow_module' => unserialize($data->row['slideshow_module'])));
		$this->model_setting_setting->editSetting('banner', array('banner_module' => unserialize($data->row['banner_module'])));
		$this->model_setting_setting->editSetting('bestseller', array('bestseller_module' => unserialize($data->row['module_bestseller'])));
		$this->model_setting_setting->editSetting('featured', array('featured_product' => $data->row['featured_product'], 'featured_module' => unserialize($data->row['featured_module'])));
		$this->model_setting_setting->editSetting('latest', array('latest_module' => unserialize($data->row['latest_module'])));
		$this->model_setting_setting->editSetting('account', array('account_module' => unserialize($data->row['account_module'])));
		$this->model_setting_setting->editSetting('affiliate', array('affiliate_module' => unserialize($data->row['affiliate_module'])));
		$this->model_setting_setting->editSetting('carousel', array('carousel_module' => unserialize($data->row['carousel_module'])));
		$this->model_setting_setting->editSetting('category', array('category_module' => unserialize($data->row['category_module'])));
		$this->model_setting_setting->editSetting('special', array('special_module' => unserialize($data->row['special_module'])));
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_category_width'] . "' WHERE  `key` = 'config_image_category_width';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_category_height'] . "' WHERE  `key` = 'config_image_category_height';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_thumb_width'] . "' WHERE  `key` = 'config_image_thumb_width';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_thumb_height'] . "' WHERE  `key` = 'config_image_thumb_height';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_popup_width'] . "' WHERE  `key` = 'config_image_popup_width';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_popup_height'] . "' WHERE  `key` = 'config_image_popup_height';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_product_width'] . "' WHERE  `key` = 'config_image_product_width';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_product_height'] . "' WHERE  `key` = 'config_image_product_height';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_additional_width'] . "' WHERE  `key` = 'config_image_additional_width';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_additional_height'] . "' WHERE  `key` = 'config_image_additional_height';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_related_width'] . "' WHERE  `key` = 'config_image_related_width';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_related_height'] . "' WHERE  `key` = 'config_image_related_height';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_compare_width'] . "' WHERE  `key` = 'config_image_compare_width';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_compare_height'] . "' WHERE  `key` = 'config_image_compare_height';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_wishlist_width'] . "' WHERE  `key` = 'config_image_wishlist_width';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_wishlist_height'] . "' WHERE  `key` = 'config_image_wishlist_height';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_cart_width'] . "' WHERE  `key` = 'config_image_cart_width';");
        $this->db->query("UPDATE  `setting` SET  `value` = '" . $data->row['config_image_cart_height'] . "' WHERE  `key` = 'config_image_cart_height';");
        
    }
    
    //Deleta template
    public function deleteTemplate($id) {
        
        $sql = $this->db->query("SELECT * FROM `layouts` WHERE `id` = '" . $id . "' AND `activated` = '1' ");
        
        if (!empty($sql->row)) {
            return true;
        }else{
            $this->db->query('DELETE FROM `layouts` WHERE `id` = "' . $id . '"');
        }
    }
    
    //Captura um template
    public function getTemplate ($id) {
        
        $sql = $this->db->query("SELECT * FROM `layouts` WHERE `id` = '" . $id . "'");
        
        return $sql;
        
    }
    
    //Atualiza o template
    public function updateTemplate ($id, $data) {
        
		if (!empty($data['slideshow_module'])):
			$data['slideshow_module'] = serialize($data['slideshow_module']);
		else:
			$data['slideshow_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['banner_module'])):
			$data['banner_module'] = serialize($data['banner_module']);
		else:
			$data['banner_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['module_bestseller'])):
			$data['module_bestseller'] = serialize($data['module_bestseller']);
		else:
			$data['module_bestseller'] = 'a:0:{}';
		endif;
		
		if (!empty($data['latest_module'])):
			$data['latest_module'] = serialize($data['latest_module']);
		else:
			$data['latest_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['featured_module'])):
			$data['featured_module'] = serialize($data['featured_module']);
		else:
			$data['featured_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['account_module'])):
			$data['account_module'] = serialize($data['account_module']);
		else:
			$data['account_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['affiliate_module'])):
			$data['affiliate_module'] = serialize($data['affiliate_module']);
		else:
			$data['affiliate_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['carousel_module'])):
			$data['carousel_module'] = serialize($data['carousel_module']);
		else:
			$data['carousel_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['category_module'])):
			$data['category_module'] = serialize($data['category_module']);
		else:
			$data['category_module'] = 'a:0:{}';
		endif;
		
		if (!empty($data['special_module'])):
			$data['special_module'] = serialize($data['special_module']);
		else:
			$data['special_module'] = 'a:0:{}';
		endif;
		
        $sqlUpdate = "UPDATE `layouts` SET 
                    `nameTemplate` = '".$data['nameTemplate']."', 
                    `descriptionTemplate` = '".$data['descriptionTemplate']."', 
                    `slideshow_module` = '".$data['slideshow_module']."',
                    `banner_module` = '".$data['banner_module']."',
                    `module_bestseller` = '".$data['module_bestseller']."',
                    `featured_module` = '".$data['featured_module']."',
                    `latest_module` = '".$data['latest_module']."',
                    `account_module` = '".$data['account_module']."',
                    `featured_product` = '".$data['featured_product']."', 
                    `affiliate_module` = '".$data['affiliate_module']."', 
                    `carousel_module` = '".$data['carousel_module']."', 
                    `category_module` = '".$data['category_module']."', 
                    `special_module` = '".$data['special_module']."', 
                    `config_image_category_width` = '".$data['config_image_category_width']."', 
                    `config_image_category_height` = '".$data['config_image_category_height']."', 
                    `config_image_thumb_width` = '".$data['config_image_thumb_width']."', 
                    `config_image_thumb_height` = '".$data['config_image_thumb_height']."', 
                    `config_image_popup_width` = '".$data['config_image_popup_width']."', 
                    `config_image_popup_height` = '".$data['config_image_popup_height']."', 
                    `config_image_product_width` = '".$data['config_image_product_width']."', 
                    `config_image_product_height` = '".$data['config_image_product_height']."', 
                    `config_image_additional_width` = '".$data['config_image_additional_width']."', 
                    `config_image_additional_height` = '".$data['config_image_additional_height']."', 
                    `config_image_related_width` = '".$data['config_image_related_width']."', 
                    `config_image_related_height` = '".$data['config_image_related_height']."', 
                    `config_image_compare_width` = '".$data['config_image_compare_width']."', 
                    `config_image_compare_height` = '".$data['config_image_compare_height']."', 
                    `config_image_wishlist_width` = '".$data['config_image_wishlist_width']."', 
                    `config_image_wishlist_height` = '".$data['config_image_wishlist_height']."', 
                    `config_image_cart_width` = '".$data['config_image_cart_width']."', 
                    `config_image_cart_height` = '".$data['config_image_cart_height']."' 
                     WHERE `id` = '" . $id . "'";
        
        $this->db->query($sqlUpdate);
        
        //Verifica se o template editado está ativo
        $verificaTemplate = $this->getTemplate($id);
        
        if ($verificaTemplate->row['activated'] == 1) {
            $this->activateTemplate($id);
        }
        
    }
    
}
?>