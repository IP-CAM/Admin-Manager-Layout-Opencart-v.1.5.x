<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
<div class="box">
    <div class="heading">
      <h1><img src="view/image/order.png" alt="" /><?php echo $text_layout ?></h1>
      <div class="buttons">
		<a onclick="$('#form').submit();" class="button"><?php echo $btn_save ?></a>
		<a href="<?php echo $cancel; ?>" class="button"><?php echo $btn_cancel ?></a>
	  </div>
    </div>
    <div class="content">
        <div id="vtabs" class="vtabs">
            <a href="#tab-template"><?php echo $tab_template ?></a>
            <a href="#tab-slideshow"><?php echo $tab_slideshow ?></a>
            <a href="#tab-banner"><?php echo $tab_banner ?></a>
            <a href="#tab-bestseller"><?php echo $tab_bestseller ?></a>
            <a href="#tab-featured"><?php echo $tab_featured ?></a>
            <a href="#tab-latest"><?php echo $tab_latest ?></a>
            <a href="#tab-account"><?php echo $tab_account ?></a>
            <a href="#tab-affiliate"><?php echo $tab_affiliate ?></a>
            <a href="#tab-carousel"><?php echo $tab_carousel ?></a>
            <a href="#tab-category"><?php echo $tab_category ?></a>
            <a href="#tab-special"><?php echo $tab_specials ?></a>
            <a href="#tab-images"><?php echo $tab_images ?></a>            
        </div>
        
        <form action="<?php echo $link; ?>" method="post" enctype="multipart/form-data" id="form">
            
            <!-- Cadastrar Detalhes do Tempalte - Inicio -->
            <div id="tab-template" class="vtabs-content">
                <table class="form">
                    <tbody>
                        
                        <!-- Nome do Layout -->
                        <tr>
                            <td><?php echo $entry_layout ?></td>
                            <td>
                                <select name="nameTemplate" id="nameTemplate">
                                    <option value="-1"><?php echo $entry_selectTemplate ?></option>
                                    <?php foreach ($templates as $template) { ?>
                                    <?php if ($template == $nameTemplate) { ?>
                                    <option value="<?php echo $template; ?>" selected="selected"><?php echo $template; ?></option>
                                    <?php }else{ ?>
                                    <option value="<?php echo $template; ?>"><?php echo $template; ?></option>
                                    <?php } ?>
                                    <?php } ?>
                                </select>
                            </td>
                        </tr>
                        
                        <!-- Descrição do Layout -->
                        <tr>
                            <td valign="top"><?php echo $entry_description ?></td>
                            <td><textarea name="descriptionTemplate"><?php echo $descriptionTemplate; ?></textarea></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- Cadastrar Detalhes do Tempalte - Fim -->
            
            <!-- Cadastrar slideshow - Inicio -->
            <div id="tab-slideshow" class="vtabs-content">
                
                <table id="module_slideshow" class="list">
                    <thead>
                        <tr>
                        <td class="left"><?php echo $entry_banner ?></td>
                        <td class="left"><?php echo $entry_dimension ?></td>
                        <td class="left"><?php echo $entry_layout ?></td>
                        <td class="left"><?php echo $entry_position ?></td>
                        <td class="left"><?php echo $entry_status ?></td>
                        <td class="right"><?php echo $entry_order ?></td>
                        <td></td>
                        </tr>
                    </thead>
                    <?php $module_row_slideshow = 0; ?>
                    <?php foreach ($slideshow_modules as $slideshow_module) { ?>
                    <tbody id="module-row-slideshow<?php echo $module_row_slideshow; ?>">
                        <tr>
                        <td class="left">
                            <select name="slideshow_module[<?php echo $module_row_slideshow; ?>][banner_id]">
                                <?php foreach ($banners as $banner) { ?>
                                <?php if ($banner['banner_id'] == $slideshow_module['banner_id']) { ?>
                                <option value="<?php echo $banner['banner_id'] ?>" selected="selected"><?php echo $banner['name'] ?></option>
                                <?php }else{ ?>
                                <option value="<?php echo $banner['banner_id'] ?>"><?php echo $banner['name'] ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left">
                                <input type="text" name="slideshow_module[<?php echo $module_row_slideshow; ?>][width]" value="<?php echo $slideshow_module['width'] ?>" size="3" />
                                <input type="text" name="slideshow_module[<?php echo $module_row_slideshow; ?>][height]" value="<?php echo $slideshow_module['height'] ?>" size="3"/>
                        </td>
                        <td class="left">
                            <select name="slideshow_module[<?php echo $module_row_slideshow; ?>][layout_id]">
                                <?php foreach ($layouts as $layout) { ?>
                                <?php if ($layout['layout_id'] == $slideshow_module['layout_id']) { ?>
                                <option value="<?php echo $layout['layout_id'] ?>" selected="selected"><?php echo $layout['name'] ?></option>
                                <?php }else{ ?>
                                <option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left">
                            <select name="slideshow_module[<?php echo $module_row_slideshow; ?>][position]">
                                <?php if ($slideshow_module['position'] == 'content_top') { ?>
                                <option value="content_top" selected="selected"><?php echo $entry_top ?></option>
                                <?php }else{ ?>
                                <option value="content_top"><?php echo $entry_top ?></option>
                                <?php } ?>
                                <?php if ($slideshow_module['position'] == 'content_bottom') { ?>
                                <option value="content_bottom" selected="selected"><?php echo $entry_bottom ?></option>
                                <?php }else{ ?>
                                <option value="content_bottom"><?php echo $entry_bottom ?></option>
                                <?php } ?>
                                <?php if ($slideshow_module['position'] == 'column_left') { ?>
                                <option value="column_left" selected="selected"><?php echo $entry_left ?></option>
                                <?php }else{ ?>
                                <option value="column_left"><?php echo $entry_left ?></option>
                                <?php } ?>
                                <?php if ($slideshow_module['position'] == 'column_right') { ?>
                                <option value="column_right" selected="selected"><?php echo $entry_right ?></option>
                                <?php }else{ ?>
                                <option value="column_right"><?php echo $entry_right ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left">
                            <select name="slideshow_module[<?php echo $module_row_slideshow; ?>][status]">
                                <?php if ($slideshow_module['status'] == 1) { ?>
                                <option value="1" selected="selected"><?php echo $entry_enabled; ?></option>
                                <option value="0"><?php echo $entry_disabled; ?></option>
                                <?php }else{ ?>
                                <option value="1"><?php echo $entry_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $entry_disabled; ?></option>
                                <?php } ?>
                            </selectio>
                        </td>
                        <td class="right">
                            <input type="text" name="slideshow_module[<?php echo $module_row_slideshow; ?>][sort_order]" value="<?php echo $slideshow_module['sort_order'] ?>" size="3" />
                        </td>
                        <td class="left">
                            <a onclick="$('#module-row-slideshow<?php echo $module_row_slideshow; ?>').remove();" class="button"><?php echo $entry_remove; ?></a>
                        </td>
                        </tr>
                    </tbody>
                    <?php $module_row_slideshow++; ?>
                    <?php } ?>
                    <tfoot>
                        <tr>
                        <td colspan="6"></td>
                        <td class="left"><a onclick="addModule();" class="button"><?php echo $entry_insert; ?></a></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            
            
            <!-- Cadastrar banner - Inicio -->
            <div id="tab-banner" class="vtabs-content">
                
                <table id="module_banner" class="list">
                    <thead>
                        <tr>
                        <td class="left"><?php echo $entry_banner ?></td>
                        <td class="left"><?php echo $entry_dimension ?></td>
                        <td class="left"><?php echo $entry_layout ?></td>
                        <td class="left"><?php echo $entry_position ?></td>
                        <td class="left"><?php echo $entry_status ?></td>
                        <td class="right"><?php echo $entry_order ?></td>
                        <td></td>
                        </tr>
                    </thead>
                    <?php $module_row_banner = 0; ?>
                    <?php foreach ($banner_modules as $banner_module) { ?>
                    <tbody id="module-row-banner<?php echo $module_row_banner; ?>">
                        <tr>
                        <td class="left">
                            <select name="banner_module[<?php echo $module_row_banner; ?>][banner_id]">
                                <?php foreach ($banners as $banner) { ?>
                                <?php if ($banner['banner_id'] == $banner_module['banner_id']) { ?>
                                <option value="<?php echo $banner['banner_id'] ?>" selected="selected"><?php echo $banner['name'] ?></option>
                                <?php }else{ ?>
                                <option value="<?php echo $banner['banner_id'] ?>"><?php echo $banner['name'] ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left">
                                <input type="text" name="banner_module[<?php echo $module_row_banner; ?>][width]" value="<?php echo $banner_module['width'] ?>" size="3" />
                                <input type="text" name="banner_module[<?php echo $module_row_banner; ?>][height]" value="<?php echo $banner_module['height'] ?>" size="3"/>
                        </td>
                        <td class="left">
                            <select name="banner_module[<?php echo $module_row_banner; ?>][layout_id]">
                                <?php foreach ($layouts as $layout) { ?>
                                <?php if ($layout['layout_id'] == $banner_module['layout_id']) { ?>
                                <option value="<?php echo $layout['layout_id'] ?>" selected="selected"><?php echo $layout['name'] ?></option>
                                <?php }else{ ?>
                                <option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left">
                            <select name="banner_module[<?php echo $module_row_banner; ?>][position]">
                                <?php if ($banner_module['position'] == 'content_top') { ?>
                                <option value="content_top" selected="selected"><?php echo $entry_top; ?></option>
                                <?php }else{ ?>
                                <option value="content_top"><?php echo $entry_top; ?></option>
                                <?php } ?>
                                <?php if ($banner_module['position'] == 'content_bottom') { ?>
                                <option value="content_bottom" selected="selected"><?php echo $entry_bottom; ?></option>
                                <?php }else{ ?>
                                <option value="content_bottom"><?php echo $entry_bottom; ?></option>
                                <?php } ?>
                                <?php if ($banner_module['position'] == 'column_left') { ?>
                                <option value="column_left" selected="selected"><?php echo $entry_left; ?></option>
                                <?php }else{ ?>
                                <option value="column_left"><?php echo $entry_left; ?></option>
                                <?php } ?>
                                <?php if ($banner_module['position'] == 'column_right') { ?>
                                <option value="column_right" selected="selected"><?php echo $entry_right; ?></option>
                                <?php }else{ ?>
                                <option value="column_right"><?php echo $entry_right; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left">
                            <select name="banner_module[<?php echo $module_row_banner; ?>][status]">
                                <?php if ($banner_module['status'] == 1) { ?>
                                <option value="1" selected="selected"><?php echo $entry_enabled; ?></option>
                                <option value="0"><?php echo $entry_disabled; ?></option>
                                <?php }else{ ?>
                                <option value="1"><?php echo $entry_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $entry_disabled; ?></option>
                                <?php } ?>
                            </selectio>
                        </td>
                        <td class="right">
                            <input type="text" name="banner_module[<?php echo $module_row_banner; ?>][sort_order]" value="<?php echo $banner_module['sort_order'] ?>" size="3" />
                        </td>
                        <td class="left">
                            <a onclick="$('#module-row-banner<?php echo $module_row_banner; ?>').remove();" class="button"><?php echo $entry_remove; ?></a>
                        </td>
                        </tr>
                    </tbody>
                    <?php $module_row_banner++; ?>
                    <?php } ?>
                    <tfoot>
                        <tr>
                        <td colspan="6"></td>
                        <td class="left"><a onclick="addModuleBanner();" class="button"><?php echo $entry_insert; ?></a></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            
            
            <!-- Cadastrar Os mais vendidos - Inicio -->
            <div id="tab-bestseller" class="vtabs-content">
                
                <table id="module_bestseller" class="list">
                    <thead>
                        <tr>
                        <td class="left"><?php echo $entry_limit; ?></td>
                        <td class="left"><?php echo $entry_dimension; ?></td>
                        <td class="left"><?php echo $entry_layout; ?></td>
                        <td class="left"><?php echo $entry_position; ?></td>
                        <td class="left"><?php echo $entry_status; ?></td>
                        <td class="right"><?php echo $entry_order; ?></td>
                        <td></td>
                        </tr>
                    </thead>
                    <?php $module_row_bestseller = 0; ?>
                    <?php foreach ($module_bestsellers as $module_bestseller) { ?>
                    <tbody id="module-row-bestseller<?php echo $module_row_bestseller; ?>">
                        <tr>
                        <td class="left">
                            <input name="module_bestseller[<?php echo $module_row_bestseller; ?>][limit]" value="<?php echo $module_bestseller['limit']; ?>" size="3" />
                        </td>
                        <td class="left">
                                <input type="text" name="module_bestseller[<?php echo $module_row_bestseller; ?>][image_width]" value="<?php echo $module_bestseller['image_width'] ?>" size="3" />
                                <input type="text" name="module_bestseller[<?php echo $module_row_bestseller; ?>][image_height]" value="<?php echo $module_bestseller['image_height'] ?>" size="3"/>
                        </td>
                        <td class="left">
                            <select name="module_bestseller[<?php echo $module_row_bestseller; ?>][layout_id]">
                                <?php foreach ($layouts as $layout) { ?>
                                <?php if ($layout['layout_id'] == $module_bestseller['layout_id']) { ?>
                                <option value="<?php echo $layout['layout_id'] ?>" selected="selected"><?php echo $layout['name'] ?></option>
                                <?php }else{ ?>
                                <option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left">
                            <select name="module_bestseller[<?php echo $module_row_bestseller; ?>][position]">
                                <?php if ($module_bestseller['position'] == 'content_top') { ?>
                                <option value="content_top" selected="selected"><?php echo $entry_top; ?></option>
                                <?php }else{ ?>
                                <option value="content_top"><?php echo $entry_top; ?></option>
                                <?php } ?>
                                <?php if ($module_bestseller['position'] == 'content_bottom') { ?>
                                <option value="content_bottom" selected="selected"><?php echo $entry_bottom; ?></option>
                                <?php }else{ ?>
                                <option value="content_bottom"><?php echo $entry_bottom; ?></option>
                                <?php } ?>
                                <?php if ($module_bestseller['position'] == 'column_left') { ?>
                                <option value="column_left" selected="selected"><?php echo $entry_left; ?></option>
                                <?php }else{ ?>
                                <option value="column_left"><?php echo $entry_left; ?></option>
                                <?php } ?>
                                <?php if ($module_bestseller['position'] == 'column_right') { ?>
                                <option value="column_right" selected="selected"><?php echo $entry_right; ?></option>
                                <?php }else{ ?>
                                <option value="column_right"><?php echo $entry_right; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left">
                            <select name="module_bestseller[<?php echo $module_row_bestseller; ?>][status]">
                                <?php if ($module_bestseller['status'] == 1) { ?>
                                <option value="1" selected="selected"><?php echo $entry_enabled; ?></option>
                                <option value="0"><?php echo $entry_disabled; ?></option>
                                <?php }else{ ?>
                                <option value="1"><?php echo $entry_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $entry_disabled; ?></option>
                                <?php } ?>
                            </selectio>
                        </td>
                        <td class="right">
                            <input type="text" name="module_bestseller[<?php echo $module_row_bestseller; ?>][sort_order]" value="<?php echo $module_bestseller['sort_order'] ?>" size="3" />
                        </td>
                        <td class="left">
                            <a onclick="$('#module-row-bestseller<?php echo $module_row_bestseller; ?>').remove();" class="button"><?php echo $entry_remove; ?></a>
                        </td>
                        </tr>
                    </tbody>
                    <?php $module_row_bestseller++; ?>
                    <?php } ?>
                    <tfoot>
                        <tr>
                        <td colspan="6"></td>
                        <td class="left"><a onclick="addModuleBestseller();" class="button"><?php echo $entry_insert; ?></a></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            
            
            <!-- Cadastrar Os destaques - Inicio -->
            <div id="tab-featured" class="vtabs-content">
                <table class="form">
				  <tr>
					<td><?php echo $entry_product; ?></td>
					<td><input type="text" name="product" value="" /></td>
				  </tr>
				  <tr>
					<td>&nbsp;</td>
					<td><div id="featured-product" class="scrollbox">
						<?php $class = 'odd'; ?>
						<?php foreach ($products as $product) { ?>
						<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
						<div id="featured-product<?php echo $product['product_id']; ?>" class="<?php echo $class; ?>"><?php echo $product['name']; ?> <img src="view/image/delete.png" />
						  <input type="hidden" value="<?php echo $product['product_id']; ?>" />
						</div>
						<?php } ?>
					  </div>
					  <input type="hidden" name="featured_product" value="<?php echo $featured_product; ?>" /></td>
				  </tr>
				</table>
                <table id="module_featured" class="list">
                    <thead>
                        <tr>
                        <td class="left"><?php echo $entry_limit; ?></td>
                        <td class="left"><?php echo $entry_dimension; ?></td>
                        <td class="left"><?php echo $entry_layout; ?></td>
                        <td class="left"><?php echo $entry_position; ?></td>
                        <td class="left"><?php echo $entry_status; ?></td>
                        <td class="right"><?php echo $entry_order; ?></td>
                        <td></td>
                        </tr>
                    </thead>
                    <?php $module_row_featured = 0; ?>
                    <?php foreach ($featured_modules as $featured_module) { ?>
                    <tbody id="module-row-featured<?php echo $module_row_featured; ?>">
                        <tr>
                        <td class="left">
                            <input name="featured_module[<?php echo $module_row_featured; ?>][limit]" value="<?php echo $featured_module['limit']; ?>" size="3" />
                        </td>
                        <td class="left">
                                <input type="text" name="featured_module[<?php echo $module_row_featured; ?>][image_width]" value="<?php echo $featured_module['image_width'] ?>" size="3" />
                                <input type="text" name="featured_module[<?php echo $module_row_featured; ?>][image_height]" value="<?php echo $featured_module['image_height'] ?>" size="3"/>
                        </td>
                        <td class="left">
                            <select name="featured_module[<?php echo $module_row_featured; ?>][layout_id]">
                                <?php foreach ($layouts as $layout) { ?>
                                <?php if ($layout['layout_id'] == $featured_module['layout_id']) { ?>
                                <option value="<?php echo $layout['layout_id'] ?>" selected="selected"><?php echo $layout['name'] ?></option>
                                <?php }else{ ?>
                                <option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left">
                            <select name="featured_module[<?php echo $module_row_featured; ?>][position]">
                                <?php if ($featured_module['position'] == 'content_top') { ?>
                                <option value="content_top" selected="selected"><?php echo $entry_top; ?></option>
                                <?php }else{ ?>
                                <option value="content_top"><?php echo $entry_top; ?></option>
                                <?php } ?>
                                <?php if ($featured_module['position'] == 'content_bottom') { ?>
                                <option value="content_bottom" selected="selected"><?php echo $entry_bottom; ?></option>
                                <?php }else{ ?>
                                <option value="content_bottom"><?php echo $entry_bottom; ?></option>
                                <?php } ?>
                                <?php if ($featured_module['position'] == 'column_left') { ?>
                                <option value="column_left" selected="selected"><?php echo $entry_left; ?></option>
                                <?php }else{ ?>
                                <option value="column_left"><?php echo $entry_left; ?></option>
                                <?php } ?>
                                <?php if ($featured_module['position'] == 'column_right') { ?>
                                <option value="column_right" selected="selected"><?php echo $entry_right; ?></option>
                                <?php }else{ ?>
                                <option value="column_right"><?php echo $entry_right; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left">
                            <select name="featured_module[<?php echo $module_row_featured; ?>][status]">
                                <?php if ($featured_module['status'] == 1) { ?>
                                <option value="1" selected="selected"><?php echo $entry_enabled; ?></option>
                                <option value="0"><?php echo $entry_disabled; ?></option>
                                <?php }else{ ?>
                                <option value="1"><?php echo $entry_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $entry_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="right">
                            <input type="text" name="featured_module[<?php echo $module_row_featured; ?>][sort_order]" value="<?php echo $featured_module['sort_order'] ?>" size="3" />
                        </td>
                        <td class="left">
                            <a onclick="$('#module-row-featured<?php echo $module_row_featured; ?>').remove();" class="button"><?php echo $entry_remove; ?></a>
                        </td>
                        </tr>
                    </tbody>
                    <?php $module_row_featured++; ?>
                    <?php } ?>
                    <tfoot>
                        <tr>
                        <td colspan="6"></td>
                        <td class="left"><a onclick="addModuleFeatured();" class="button"><?php echo $entry_insert; ?></a></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            
            
            <!-- Cadastrar Os novos produtos - Inicio -->
            <div id="tab-latest" class="vtabs-content">
                
                <table id="module_latest" class="list">
                    <thead>
                        <tr>
							<td class="left"><?php echo $entry_limit; ?></td>
							<td class="left"><?php echo $entry_dimension; ?></td>
							<td class="left"><?php echo $entry_layout; ?></td>
							<td class="left"><?php echo $entry_position; ?></td>
							<td class="left"><?php echo $entry_status; ?></td>
							<td class="right"><?php echo $entry_order; ?></td>
							<td></td>
                        </tr>
                    </thead>
                    <?php $module_row_latest = 0; ?>
                    <?php foreach ($latest_modules as $latest_module) { ?>
                    <tbody id="module-row-latest<?php echo $module_row_latest; ?>">
                        <tr>
                        <td class="left">
                            <input name="latest_module[<?php echo $module_row_latest; ?>][limit]" value="<?php echo $latest_module['limit']; ?>" size="3" />
                        </td>
                        <td class="left">
                                <input type="text" name="latest_module[<?php echo $module_row_latest; ?>][image_width]" value="<?php echo $latest_module['image_width'] ?>" size="3" />
                                <input type="text" name="latest_module[<?php echo $module_row_latest; ?>][image_height]" value="<?php echo $latest_module['image_height'] ?>" size="3"/>
                        </td>
                        <td class="left">
                            <select name="latest_module[<?php echo $module_row_latest; ?>][layout_id]">
                                <?php foreach ($layouts as $layout) { ?>
                                <?php if ($layout['layout_id'] == $latest_module['layout_id']) { ?>
                                <option value="<?php echo $layout['layout_id'] ?>" selected="selected"><?php echo $layout['name'] ?></option>
                                <?php }else{ ?>
                                <option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left">
                            <select name="latest_module[<?php echo $module_row_latest; ?>][position]">
                                <?php if ($latest_module['position'] == 'content_top') { ?>
                                <option value="content_top" selected="selected"><?php echo $entry_top; ?></option>
                                <?php }else{ ?>
                                <option value="content_top"><?php echo $entry_top; ?></option>
                                <?php } ?>
                                <?php if ($latest_module['position'] == 'content_bottom') { ?>
                                <option value="content_bottom" selected="selected"><?php echo $entry_bottom; ?></option>
                                <?php }else{ ?>
                                <option value="content_bottom"><?php echo $entry_bottom; ?></option>
                                <?php } ?>
                                <?php if ($latest_module['position'] == 'column_left') { ?>
                                <option value="column_left" selected="selected"><?php echo $entry_left; ?></option>
                                <?php }else{ ?>
                                <option value="column_left"><?php echo $entry_left; ?></option>
                                <?php } ?>
                                <?php if ($latest_module['position'] == 'column_right') { ?>
                                <option value="column_right" selected="selected"><?php echo $entry_right; ?></option>
                                <?php }else{ ?>
                                <option value="column_right"><?php echo $entry_right; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left">
                            <select name="latest_module[<?php echo $module_row_latest; ?>][status]">
                                <?php if ($latest_module['status'] == 1) { ?>
                                <option value="1" selected="selected"><?php echo $entry_enabled; ?></option>
                                <option value="0"><?php echo $entry_disabled; ?></option>
                                <?php }else{ ?>
                                <option value="1"><?php echo $entry_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $entry_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="right">
                            <input type="text" name="latest_module[<?php echo $module_row_latest; ?>][sort_order]" value="<?php echo $latest_module['sort_order'] ?>" size="3" />
                        </td>
                        <td class="left">
                            <a onclick="$('#module-row-latest<?php echo $module_row_latest; ?>').remove();" class="button"><?php echo $entry_remove; ?></a>
                        </td>
                        </tr>
                    </tbody>
                    <?php $module_row_latest++; ?>
                    <?php } ?>
                    <tfoot>
                        <tr>
                        <td colspan="6"></td>
                        <td class="left"><a onclick="addModulelatest();" class="button"><?php echo $entry_insert; ?></a></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            
			<!-- Modulo Account -->
			<div id="tab-account" class="vtabs-content">
				<table class="list" id="module_account">
					<thead>
						<tr>
							<td class="left"><?php echo $entry_layout ?></td>
							<td class="left"><?php echo $entry_position ?></td>
							<td class="left"><?php echo $entry_status ?></td>
							<td class="right"><?php echo $entry_order ?></td>
							<td class="left"></td>
						</tr>
					</thead>
					
					<?php $module_row_account = 0; ?>
                    <?php foreach ($account_modules as $account_module) { ?>
					<tbody id="module-row-account<?php echo $module_row_account ?>">
						<tr>
							<td class="left">
								<select name="account_module[<?php echo $module_row_account ?>][layout_id]">
									<?php foreach ($layouts as $layout): ?>
									<?php if ($account_module['layout_id'] == $layout['layout_id']){ ?>
									<option value="<?php echo $layout['layout_id'] ?>" selected="selected"><?php echo $layout['name'] ?></option>
									<?php }else{ ?>
									<option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>
									<?php } ?>
									<?php endforeach ?>
								</select>
							</td>
							
							<td class="left">
								<select name="account_module[<?php echo $module_row_account ?>][position]">
									<?php if ($account_module['position'] == 'content_top') { ?>
									<option value="content_top" selected="selected"><?php echo $entry_top; ?></option>
									<?php }else{ ?>
									<option value="content_top"><?php echo $entry_top; ?></option>
									<?php } ?>
									<?php if ($account_module['position'] == 'content_bottom') { ?>
									<option value="content_bottom" selected="selected"><?php echo $entry_bottom; ?></option>
									<?php }else{ ?>
									<option value="content_bottom"><?php echo $entry_bottom; ?></option>
									<?php } ?>
									<?php if ($account_module['position'] == 'column_left') { ?>
									<option value="column_left" selected="selected"><?php echo $entry_left; ?></option>
									<?php }else{ ?>
									<option value="column_left"><?php echo $entry_left; ?></option>
									<?php } ?>
									<?php if ($account_module['position'] == 'column_right') { ?>
									<option value="column_right" selected="selected"><?php echo $entry_right; ?></option>
									<?php }else{ ?>
									<option value="column_right"><?php echo $entry_right; ?></option>
									<?php } ?>
								</select>
							</td>
							
							<td class="left">
								<select name="account_module[<?php echo $module_row_account ?>][status]">
									<?php if ($account_module['status'] == 1){ ?>
									<option value="1" selected="selected">Enabled</option>
									<option value="0">Disabled</option>
									<?php }else{ ?>
									<option value="1">Enabled</option>
									<option value="0" selected="selected">Disabled</option>
									<?php } ?>
								</select>
							</td>
							
							<td class="right">
								<input type="text" size="3" value= "<?php echo $account_module['sort_order'] ?>" name="account_module[<?php echo $module_row_account ?>][sort_order]" />
							</td>
							
							<td class="left">
								<a onClick="$('#module-row-account<?php echo $module_row_account ?>').remove()" class="button">Remove</a>
							</td>
						</tr>
					</tbody>
					<?php $module_row_account++; ?>
                    <?php } ?>
					<tfoot>
                        <tr>
							<td colspan="4"></td>
							<td class="left"><a onclick="addModuleAccount();" class="button"><?php echo $entry_insert; ?></a></td>
                        </tr>
                    </tfoot>
				</table>
			</div>
            
			<!-- Modulo Afiliado -->
			<div id="tab-affiliate" class="vtabs-content">
				<table class="list" id="module_affiliate">
					<thead>
						<tr>
							<td class="left"><?php echo $entry_layout ?></td>
							<td class="left"><?php echo $entry_position ?></td>
							<td class="left"><?php echo $entry_status ?></td>
							<td class="right"><?php echo $entry_order ?></td>
							<td class="left"></td>
						</tr>
					</thead>
					
					<?php $module_row_affiliate = 0; ?>
                    <?php foreach ($affiliate_modules as $affiliate_module) { ?>
					<tbody id="module-row-affiliate<?php echo $module_row_affiliate ?>">
						<tr>
							<td class="left">
								<select name="affiliate_module[<?php echo $module_row_affiliate ?>][layout_id]">
									<?php foreach ($layouts as $layout): ?>
									<?php if ($affiliate_module['layout_id'] == $layout['layout_id']){ ?>
									<option value="<?php echo $layout['layout_id'] ?>" selected="selected"><?php echo $layout['name'] ?></option>
									<?php }else{ ?>
									<option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>
									<?php } ?>
									<?php endforeach ?>
								</select>
							</td>
							
							<td class="left">
								<select name="affiliate_module[<?php echo $module_row_affiliate ?>][position]">
									<?php if ($affiliate_module['position'] == 'content_top') { ?>
									<option value="content_top" selected="selected"><?php echo $entry_top; ?></option>
									<?php }else{ ?>
									<option value="content_top"><?php echo $entry_top; ?></option>
									<?php } ?>
									<?php if ($affiliate_module['position'] == 'content_bottom') { ?>
									<option value="content_bottom" selected="selected"><?php echo $entry_bottom; ?></option>
									<?php }else{ ?>
									<option value="content_bottom"><?php echo $entry_bottom; ?></option>
									<?php } ?>
									<?php if ($affiliate_module['position'] == 'column_left') { ?>
									<option value="column_left" selected="selected"><?php echo $entry_left; ?></option>
									<?php }else{ ?>
									<option value="column_left"><?php echo $entry_left; ?></option>
									<?php } ?>
									<?php if ($affiliate_module['position'] == 'column_right') { ?>
									<option value="column_right" selected="selected"><?php echo $entry_right; ?></option>
									<?php }else{ ?>
									<option value="column_right"><?php echo $entry_right; ?></option>
									<?php } ?>
								</select>
							</td>
							
							<td class="left">
								<select name="affiliate_module[<?php echo $module_row_affiliate ?>][status]">
									<?php if ($affiliate_module['status'] == 1){ ?>
									<option value="1" selected="selected">Enabled</option>
									<option value="0">Disabled</option>
									<?php }else{ ?>
									<option value="1">Enabled</option>
									<option value="0" selected="selected">Disabled</option>
									<?php } ?>
								</select>
							</td>
							
							<td class="right">
								<input type="text" size="3" value= "<?php echo $affiliate_module['sort_order'] ?>" name="affiliate_module[<?php echo $module_row_affiliate ?>][sort_order]" />
							</td>
							
							<td class="left">
								<a onClick="$('#module-row-affiliate<?php echo $module_row_affiliate ?>').remove()" class="button">Remove</a>
							</td>
						</tr>
					</tbody>
					<?php $module_row_affiliate++; ?>
                    <?php } ?>
					<tfoot>
                        <tr>
							<td colspan="4"></td>
							<td class="left"><a onclick="addModuleAffiliate();" class="button"><?php echo $entry_insert; ?></a></td>
                        </tr>
                    </tfoot>
				</table>
			</div>
			
			<!-- Modulo Carossel -->
			<div id="tab-carousel" class="vtabs-content">
				<table class="list" id="module_carousel">
					<thead>
						<tr>
							<td class="left"><?php echo $entry_banner?></td>
							<td class="left"><?php echo $entry_limit ?></td>
							<td class="left"><?php echo $entry_scroll ?></td>
							<td class="left"><?php echo $entry_dimension ?></td>
							<td class="left"><?php echo $entry_layout ?></td>
							<td class="left"><?php echo $entry_position ?></td>
							<td class="left"><?php echo $entry_status ?></td>
							<td class="right"><?php echo $entry_order ?></td>
							<td class="left"></td>
						</tr>
					</thead>
					
					<?php $module_row_carousel = 0; ?>
					<?php foreach ($carousel_modules as $carousel_module){ ?>
					<tbody id="module-row-carousel<?php echo $module_row_carousel ?>">
						<tr>
							<td class="left">
								<select name="carousel_module[<?php echo $module_row_carousel ?>][banner_id]">
									<?php foreach ($banners as $banner){ ?>
									<?php if ($carousel_module['banner_id'] == $banner['banner_id']){ ?>
									<option value="<?php echo $banner['banner_id'] ?>" selected="selected"><?php echo $banner['name'] ?></option>
									<?php }else{?>
									<option value="<?php echo $banner['banner_id'] ?>"><?php echo $banner['name'] ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
							
							<td class="left">
								<input type="text" value="<?php echo $carousel_module['limit'] ?>" size="1" name="carousel_module[<?php echo $module_row_carousel ?>][limit]" />
							</td>
							
							<td class="left">
								<input type="text" value="<?php echo $carousel_module['scroll'] ?>" size="1" name="carousel_module[<?php echo $module_row_carousel ?>][scroll]" />
							</td>
							
							<td class="left">
								<input type="text" value="<?php echo $carousel_module['width'] ?>" size="1" name="carousel_module[<?php echo $module_row_carousel ?>][width]" />
								<input type="text" value="<?php echo $carousel_module['height'] ?>" size="1" name="carousel_module[<?php echo $module_row_carousel ?>][height]" />
							</td>
							
							<td class="left">
								<select name="carousel_module[<?php echo $module_row_carousel ?>][layout_id]">
									<?php foreach ($layouts as $layout){ ?>
									<?php if ($carousel_module['layout_id'] == $layout['layout_id']){ ?>
									<option value="<?php echo $layout['layout_id'] ?>" selected="selected"><?php echo $layout['name'] ?></option>
									<?php }else{ ?>
									<option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
							
							<td class="left">
								<select name="carousel_module[<?php echo $module_row_carousel ?>][position]">
									<?php if ($carousel_module['position'] == 'content_top') { ?>
									<option value="content_top" selected="selected"><?php echo $entry_top; ?></option>
									<?php }else{ ?>
									<option value="content_top"><?php echo $entry_top; ?></option>
									<?php } ?>
									<?php if ($carousel_module['position'] == 'content_bottom') { ?>
									<option value="content_bottom" selected="selected"><?php echo $entry_bottom; ?></option>
									<?php }else{ ?>
									<option value="content_bottom"><?php echo $entry_bottom; ?></option>
									<?php } ?>
									<?php if ($carousel_module['position'] == 'column_left') { ?>
									<option value="column_left" selected="selected"><?php echo $entry_left; ?></option>
									<?php }else{ ?>
									<option value="column_left"><?php echo $entry_left; ?></option>
									<?php } ?>
									<?php if ($carousel_module['position'] == 'column_right') { ?>
									<option value="column_right" selected="selected"><?php echo $entry_right; ?></option>
									<?php }else{ ?>
									<option value="column_right"><?php echo $entry_right; ?></option>
									<?php } ?>
								</select>
							</td>
							
							<td class="left">
								<select name="carousel_module[<?php echo $module_row_carousel ?>][status]">
									<?php if ($carousel_module == 1){ ?>
									<option value="1" selected="selected"><?php echo $entry_enabled ?></option>
									<option value="0"><?php echo $entry_disabled ?></option>
									<?php }else{ ?>
									<option value="1"><?php echo $entry_enabled ?></option>
									<option value="0" selected="selected"><?php echo $entry_disabled ?></option>
									<?php } ?>
								</select>
							</td>
							
							<td class="left">
								<input type="text" value="<?php echo $carousel_module['sort_order'] ?>" size="3" name="carousel_module[<?php echo $module_row_carousel ?>][sort_order]" />
							</td>
							
							<td class="left">
								<a onClick="$('#module-row-carousel<?php echo $module_row_carousel ?>').remove()" class="button"><?php echo $entry_remove ?></a>
							</td>
						</tr>
					</tbody>
					<?php $module_row_carousel++ ?>
					<?php } ?>
					<tfoot>
						<tr>
							<td colspan="8" class="left"></td>
							<td class="left">
								<a onClick="addModuleCarousel()" class="button"><?php echo $entry_insert ?></a>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
            
			<!-- Modulo Categoria -->
			<div id="tab-category" class="vtabs-content">
				<table class="list" id="module_category">
					<thead>
						<tr>
							<td class="left"><?php echo $entry_layout ?></td>
							<td class="left"><?php echo $entry_position ?></td>
							<td class="left"><?php echo $entry_count ?></td>
							<td class="left"><?php echo $entry_status ?></td>
							<td class="right"><?php echo $entry_order ?></td>
							<td class="left"></td>
						</tr>
					</thead>
					
					<?php $module_row_category = 0 ?>
					<?php foreach ($category_modules as $category_module){ ?>
					<tbody id="module-row-category<?php echo $module_row_category ?>">
						<tr>
							<td class="left">
								<select name="category_module[<?php echo $module_row_category ?>][layout_id]">
									<?php foreach($layouts as $layout){ ?>
									<?php if ($category_module['layout_id'] == $layout['layout_id']){ ?>
									<option value="<?php echo $layout['layout_id'] ?>" selected="selected"><?php echo $layout['name'] ?></option>
									<?php }else{ ?>
									<option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
							
							<td class="left">
								<select name="category_module[<?php echo $module_row_category ?>][position]">
									<?php if ($category_module['position'] == 'content_top') { ?>
									<option value="content_top" selected="selected"><?php echo $entry_top; ?></option>
									<?php }else{ ?>
									<option value="content_top"><?php echo $entry_top; ?></option>
									<?php } ?>
									<?php if ($category_module['position'] == 'content_bottom') { ?>
									<option value="content_bottom" selected="selected"><?php echo $entry_bottom; ?></option>
									<?php }else{ ?>
									<option value="content_bottom"><?php echo $entry_bottom; ?></option>
									<?php } ?>
									<?php if ($category_module['position'] == 'column_left') { ?>
									<option value="column_left" selected="selected"><?php echo $entry_left; ?></option>
									<?php }else{ ?>
									<option value="column_left"><?php echo $entry_left; ?></option>
									<?php } ?>
									<?php if ($category_module['position'] == 'column_right') { ?>
									<option value="column_right" selected="selected"><?php echo $entry_right; ?></option>
									<?php }else{ ?>
									<option value="column_right"><?php echo $entry_right; ?></option>
									<?php } ?>
								</select>
							</td>
							
							<td class="left">
								<select name="category_module[<?php echo $module_row_category ?>][count]">
									<?php if ($category_module['count'] == 1){ ?>
									<option value="1" selected="selected"><?php echo $entry_enabled ?></option>
									<option value="0"><?php echo $entry_disabled ?></option>
									<?php }else{?>
									<option value="1"><?php echo $entry_enabled ?></option>
									<option value="0" selected="selected"><?php echo $entry_disabled ?></option>
									<?php } ?>
								</select>
							</td>
							
							<td class="left">
								<select name="category_module[<?php echo $module_row_category ?>][status]">
									<?php if ($category_module['status'] == 1){ ?>
									<option value="1" selected="selected"><?php echo $entry_enabled ?></option>
									<option value="0"><?php echo $entry_disabled ?></option>
									<?php }else{ ?>
									<option value="1"><?php echo $entry_enabled ?></option>
									<option value="0" selected="selected"><?php echo $entry_disabled ?></option>
									<?php } ?>
								</select>
							</td>
							
							<td class="right">
								<input type="text" name="category_module[<?php echo $module_row_category ?>][sort_order]" value="<?php echo $category_module['sort_order'] ?>" size="3" />
							</td>
							
							<td class="left">
								<a onClick="$('#module-row-category<?php echo $module_row_category ?>').remove()" class="button"><?php echo $entry_remove ?></a>
							</td>
						</tr>
					</tbody>
					<?php $module_row_category++ ?>
					<?php } ?>
					<tfoot>
						<tr>
							<td colspan="5" class="left"></td>
							<td class="left">
								<a onClick="addModuleCategory()" class="button"><?php echo $entry_insert ?></a>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			
			<!-- Modulo Promoção / Especial -->
			<div id="tab-special" class="vtabs-content">
				<table class="list" id="module_special">
					<thead>
						<tr>
							<td class="left"><?php echo $entry_limit ?></td>
							<td class="left"><?php echo $entry_dimension ?></td>
							<td class="left"><?php echo $entry_layout ?></td>
							<td class="left"><?php echo $entry_position ?></td>
							<td class="left"><?php echo $entry_status ?></td>
							<td class="right"><?php echo $entry_order ?></td>
							<td class="left"></td>
						</tr>
					</thead>
					
					<?php $module_row_special = 0 ?>
					<?php foreach ($special_modules as $special_module){ ?>
					<tbody id="module-row-special<?php echo $module_row_special ?>">
						<tr>
							<td class="left">
								<input type="text"value="<?php echo $special_module['limit'] ?>" name="special_module[<?php echo $module_row_special ?>][limit]" size="1" />
							</td>
							
							<td class="left">
								<input type="text" value="<?php echo $special_module['image_width'] ?>" name="special_module[<?php echo $module_row_special ?>][image_width]" size="1" />
								<input type="text" value="<?php echo $special_module['image_height'] ?>" name="special_module[<?php echo $module_row_special ?>][image_height]" size="1" />
							</td>
							
							<td class="left">
								<select name="special_module[<?php echo $module_row_special ?>][layout_id]">
									<?php foreach($layouts as $layout){ ?>
									<?php if ($special_module['layout_id'] == $layout['layout_id']){ ?>
									<option value="<?php echo $layout['layout_id'] ?>" selected="selected"><?php echo $layout['name'] ?></option>
									<?php }else{ ?>
									<option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</td>
							
							<td class="left">
								<select name="special_module[<?php echo $module_row_special ?>][position]">
									<?php if ($special_module['position'] == 'content_top') { ?>
									<option value="content_top" selected="selected"><?php echo $entry_top; ?></option>
									<?php }else{ ?>
									<option value="content_top"><?php echo $entry_top; ?></option>
									<?php } ?>
									<?php if ($special_module['position'] == 'content_bottom') { ?>
									<option value="content_bottom" selected="selected"><?php echo $entry_bottom; ?></option>
									<?php }else{ ?>
									<option value="content_bottom"><?php echo $entry_bottom; ?></option>
									<?php } ?>
									<?php if ($special_module['position'] == 'column_left') { ?>
									<option value="column_left" selected="selected"><?php echo $entry_left; ?></option>
									<?php }else{ ?>
									<option value="column_left"><?php echo $entry_left; ?></option>
									<?php } ?>
									<?php if ($special_module['position'] == 'column_right') { ?>
									<option value="column_right" selected="selected"><?php echo $entry_right; ?></option>
									<?php }else{ ?>
									<option value="column_right"><?php echo $entry_right; ?></option>
									<?php } ?>
								</select>
							</td>
							
							<td class="left">
								<select name="special_module[<?php echo $module_row_special ?>][status]">
									<?php if ($special_module == 1) {?>
									<option value="1" selected="selected"><?php echo $entry_enabled ?></option>
									<option value="0"><?php echo $entry_disabled ?></option>
									<?php }else{ ?>
									<option value="1"><?php echo $entry_enabled ?></option>
									<option value="0" selected="selected"><?php echo $entry_disabled ?></option>
									<?php } ?>
								</select>
							</td>
							
							<td class="right">
								<input type="text" value="<?php echo $special_module['sort_order'] ?>" name="special_module[<?php echo $module_row_special ?>][sort_order]" size="4" />
							</td>
							
							<td class="left">
								<a onClick="$('#module-row-special<?php echo $module_row_special ?>').remove()" class="button"><?php echo $entry_remove ?></a>
							</td>
						</tr>
					</tbody>
					<?php $module_row_special++ ?>
					<?php } ?>
					<tfoot>
						<tr>
							<td colspan="6" class="left"></td>
							<td class="left">
								<a onClick="addModuleSpecial()" class="button"><?php echo $entry_insert ?></a>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			
            <!-- Tamanho das Imagens -->
            <div id="tab-images" class="vtabs-content">
                <table class="form">
                    <tbody>
                        <tr>
                            <td><?php echo $entry_category_image_size; ?></td>
                            <td><input type="text" size="3" value="<?php echo $config_image_category_width; ?>" name="config_image_category_width" /> x <input type="text" size="3" value="<?php echo $config_image_category_height; ?>" name="config_image_category_height" /></td>
                        </tr>
                        
                        <tr>
                            <td><?php echo $entry_product_image_thumb_size; ?></td>
                            <td><input type="text" size="3" value="<?php echo $config_image_thumb_width; ?>" name="config_image_thumb_width" /> x <input type="text" size="3" value="<?php echo $config_image_thumb_height; ?>" name="config_image_thumb_height" /></td>
                        </tr>
                        
                        <tr>
                            <td><?php echo $entry_product_image_popup_size; ?></td>
                            <td><input type="text" size="3" value="<?php echo $config_image_popup_width; ?>" name="config_image_popup_width" /> x <input type="text" size="3" value="<?php echo $config_image_popup_height; ?>" name="config_image_popup_height" /></td>
                        </tr>
                        
                        <tr>
                            <td><?php echo $entry_product_image_list_size; ?></td>
                            <td><input type="text" size="3" value="<?php echo $config_image_product_width; ?>" name="config_image_product_width" /> x <input type="text" size="3" value="<?php echo $config_image_product_height; ?>" name="config_image_product_height" /></td>
                        </tr>
                        
                        <tr>
                            <td><?php echo $entry_additional_product_image_size; ?></td>
                            <td><input type="text" size="3" value="<?php echo $config_image_additional_width; ?>" name="config_image_additional_width" /> x <input type="text" size="3" value="<?php echo $config_image_additional_height; ?>" name="config_image_additional_height" /></td>
                        </tr>
                        
                        <tr>
                            <td><?php echo $entry_related_product_image_size; ?></td>
                            <td><input type="text" size="3" value="<?php echo $config_image_related_width; ?>" name="config_image_related_width" /> x <input type="text" size="3" value="<?php echo $config_image_related_height; ?>" name="config_image_related_height" /></td>
                        </tr>
                        
                        <tr>
                            <td><?php echo $entry_compare_image_size; ?></td>
                            <td><input type="text" size="3" value="<?php echo $config_image_compare_width; ?>" name="config_image_compare_width" /> x <input type="text" size="3" value="<?php echo $config_image_compare_height; ?>" name="config_image_compare_height" /></td>
                        </tr>
                        
                        <tr>
                            <td><?php echo $entry_wish_list_image_size; ?></td>
                            <td><input type="text" size="3" value="<?php echo $config_image_wishlist_width; ?>" name="config_image_wishlist_width" /> x <input type="text" size="3" value="<?php echo $config_image_wishlist_height; ?>" name="config_image_wishlist_height" /></td>
                        </tr>
                        
                        <tr>
                            <td><?php echo $entry_cart_image_size; ?></td>
                            <td><input type="text" size="3" value="<?php echo $config_image_cart_width; ?>" name="config_image_cart_width" /> x <input type="text" size="3" value="<?php echo $config_image_cart_height; ?>" name="config_image_cart_height" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
    <small><?php echo $entry_desenvolvido_por; ?><a href="mailto:valdeirpsr@hotmail.com.br">Valdeir Santana</a></small>
</div>
<script type="text/javascript"><!--
$('.vtabs a').tabs();

var module_row_slideshow = <?php echo $module_row_slideshow; ?>;
var module_row_banner = <?php echo $module_row_banner; ?>;
var module_row_bestseller = <?php echo $module_row_bestseller; ?>;
var module_row_featured = <?php echo $module_row_featured; ?>;
var module_row_latest = <?php echo $module_row_latest; ?>;
var module_row_account = <?php echo $module_row_account; ?>;
var module_row_affiliate = <?php echo $module_row_affiliate; ?>;
var module_row_carousel = <?php echo $module_row_carousel; ?>;
var module_row_category = <?php echo $module_row_category; ?>;
var module_row_special = <?php echo $module_row_special; ?>;

$('input[name=\'product\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $this->session->data['token']; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#featured-product' + ui.item.value).remove();
		
		$('#featured-product').append('<div id="featured-product' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');

		$('#featured-product div:odd').attr('class', 'odd');
		$('#featured-product div:even').attr('class', 'even');
		
		data = $.map($('#featured-product input'), function(element){
			return $(element).attr('value');
		});
						
		$('input[name=\'featured_product\']').attr('value', data.join());
					
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('#featured-product div img').live('click', function() {
	$(this).parent().remove();
	
	$('#featured-product div:odd').attr('class', 'odd');
	$('#featured-product div:even').attr('class', 'even');

	data = $.map($('#featured-product input'), function(element){
		return $(element).attr('value');
	});
					
	$('input[name=\'featured_product\']').attr('value', data.join());	
});

function addModule() {
	html  = '<tbody id="module-row-slideshow'+module_row_slideshow+'">';
	html += '  <tr>';
	html += '    <td class="left"><select name="slideshow_module['+module_row_slideshow+'][banner_id]">';
        <?php foreach ($banners as $banner) { ?>
	html += '      <option value=\'<?php echo $banner["banner_id"]; ?>\'><?php echo $banner["name"]; ?></option>';
        <?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><input type="text" name="slideshow_module['+module_row_slideshow+'][width]" value="" size="3" /> <input type="text" name="slideshow_module[' + module_row_slideshow + '][height]" value="" size="3" /></td>';	
	html += '    <td class="left"><select name="slideshow_module['+module_row_slideshow+'][layout_id]">';
        <?php foreach ($layouts as $layout) { ?>
        html += '       <option value=\'<?php echo $layout["layout_id"] ?>\'><?php echo $layout["name"] ?></option>';
        <?php } ?>
        html += '    </select></td>';
	html += '    <td class="left"><select name="slideshow_module[' + module_row_slideshow + '][position]">';
	html += '      <option value="content_top">Topo</option>';
	html += '      <option value="content_bottom">Rodapé</option>';
	html += '      <option value="column_left">Esquerda</option>';
	html += '      <option value="column_right">Direita</option>';
	html += '    </select></td>';
	html += '       <td><select name="slideshow_module[<?php echo $module_row_slideshow; ?>][status]">';
        html += '          <option value="1">Habilitado</option>';
        html += '          <option value="0">Desabilitado</option>';
        html += '       </select></td>';
	html += '    <td class="right"><input type="text" name="slideshow_module['+ module_row_slideshow +'][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row-slideshow'+module_row_slideshow+'\').remove();" class="button">Remover</a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module_slideshow tfoot').before(html);
	
	module_row_slideshow++;
}

function addModuleBanner() {	
	html  = '<tbody id="module-row-banner'+module_row_banner+'">';
	html += '  <tr>';
	html += '    <td class="left"><select name="banner_module['+module_row_banner+'][banner_id]">';
        <?php foreach ($banners as $banner) { ?>
	html += '      <option value=\'<?php echo $banner["banner_id"]; ?>\'><?php echo $banner["name"]; ?></option>';
        <?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><input type="text" name="banner_module['+module_row_banner+'][width]" value="" size="3" /> <input type="text" name="banner_module[' + module_row_banner + '][height]" value="" size="3" /></td>';	
	html += '    <td class="left"><select name="banner_module['+module_row_banner+'][layout_id]">';
        <?php foreach ($layouts as $layout) { ?>
        html += '       <option value=\'<?php echo $layout["layout_id"] ?>\'><?php echo $layout["name"] ?></option>';
        <?php } ?>
        html += '    </select></td>';
	html += '    <td class="left"><select name="banner_module[' + module_row_banner + '][position]">';
	html += '      <option value="content_top">Topo</option>';
	html += '      <option value="content_bottom">Rodapé</option>';
	html += '      <option value="column_left">Esquerda</option>';
	html += '      <option value="column_right">Direita</option>';
	html += '    </select></td>';
	html += '       <td><select name="banner_module[<?php echo $module_row_banner; ?>][status]">';
        html += '          <option value="1">Habilitado</option>';
        html += '          <option value="0">Desabilitado</option>';
        html += '       </select></td>';
	html += '    <td class="right"><input type="text" name="banner_module['+ module_row_banner +'][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row-banner'+module_row_banner+'\').remove();" class="button">Remover</a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module_banner tfoot').before(html);
	
	module_row_banner++;
}

function addModuleBestseller() {	
	html  = '<tbody id="module-row-bestseller'+module_row_bestseller+'">';
        html += '   <tr>';
        html += '        <td class="left">';
        html += '            <input name="module_bestseller['+module_row_bestseller+'][limit]" value="5" size="3" />';
        html += '        </td>';
        html += '        <td class="left">';
        html += '            <input type="text" name="module_bestseller['+module_row_bestseller+'][image_width]" value="80" size="3" />';
        html += '            <input type="text" name="module_bestseller['+module_row_bestseller+'][image_height]" value="80" size="3"/>';
        html += '        </td>';
        html += '        <td class="left">';
        html += '            <select name="module_bestseller['+module_row_bestseller+'][layout_id]">';
                                 <?php foreach ($layouts as $layout) { ?>  
        html += '                <option value=\'<?php echo $layout["layout_id"] ?>\'><?php echo $layout["name"] ?></option>';
                                 <?php } ?>  
        html += '            </select>';
        html += '        </td>';
        html += '        <td class="left">';
        html += '            <select name="module_bestseller['+module_row_bestseller+'][position]">';
        html += '                <option value="content_top">Topo</option>';
        html += '                <option value="content_bottom">Rodapé</option>';
        html += '                <option value="column_left">Esquerda</option>';
        html += '                <option value="column_right">Direita</option>';
        html += '            </select>';
        html += '        </td>';
        html += '        <td class="left">';
        html += '            <select name="module_bestseller['+module_row_bestseller+'][status]">';
        html += '                 <option value="1">Enable</option>';
        html += '                <option value="0">Disable</option>';
        html += '            </select>';
        html += '        </td>';
        html += '        <td class="right">';
        html += '            <input type="text" name="module_bestseller['+module_row_bestseller+'][sort_order]" value="" size="3" />';
        html += '        </td>';
        html += '        <td class="left">';
        html += '            <a onclick="$(\'#module-row-bestseller'+module_row_bestseller+'\').remove();" class="button">Remover</a>';
        html += '            </td>';
        html += '    </tr>';
        html += '</tbody>';
	
        $('#module_bestseller tfoot').before(html);
	
	module_row_bestseller++;
}

function addModuleFeatured () {
        html  = '    <tbody id="module-row-featured'+module_row_featured+'">';
        html  += '        <tr>';
        html  += '                <td class="left">';
        html  += '                        <input name="featured_module['+module_row_featured+'][limit]" value="5" size="3" />';
        html  += '                </td>';
        html  += '                <td class="left">';
        html  += '                        <input type="text" name="featured_module['+module_row_featured+'][image_width]" value="80" size="3" />';
        html  += '                        <input type="text" name="featured_module['+module_row_featured+'][image_height]" value="80" size="3"/>';
        html  += '                </td>';
        html  += '                <td class="left">';
        html  += '                        <select name="featured_module['+module_row_featured+'][layout_id]">';
        html  += '                                <?php foreach ($layouts as $layout) { ?>';
        html  += '                                <option value=\'<?php echo $layout["layout_id"] ?>\'><?php echo $layout["name"] ?></option>';
        html  += '                                <?php } ?>';
        html  += '                        </select>';
        html  += '                </td>';
        html  += '                <td class="left">';
        html  += '                        <select name="featured_module['+module_row_featured+'][position]">';
        html  += '                                <option value="content_top">Topo</option>';
        html  += '                                <option value="content_bottom">Rodapé</option>';
        html  += '                                <option value="column_left">Esquerda</option>';
        html  += '                                <option value="column_right">Direita</option>';
        html  += '                        </select>';
        html  += '                </td>';
        html  += '                <td class="left">';
        html  += '                        <select name="featured_module['+module_row_featured+'][status]">';
        html  += '                                <option value="1">Enable</option>';
        html  += '                                <option value="0">Disable</option>';
        html  += '                        </select>';
        html  += '                </td>';
        html  += '                <td class="right">';
        html  += '                        <input type="text" name="featured_module['+module_row_featured+'][sort_order]" value="" size="3" />';
        html  += '                </td>';
        html  += '                <td class="left">';
        html  += '                        <a onclick="$(\'#module-row-featured'+module_row_featured+'\').remove();" class="button">Remover</a>';
        html  += '                </td>';
        html  += '        </tr>';
        html  += '    </tbody>';
        
        $('#module_featured tfoot').before(html);
	
	module_row_featured++;
}

function addModulelatest () {
        html  = '    <tbody id="module-row-latest'+module_row_latest+'">';
        html  += '        <tr>';
        html  += '                <td class="left">';
        html  += '                        <input name="latest_module['+module_row_latest+'][limit]" value="5" size="3" />';
        html  += '                </td>';
        html  += '                <td class="left">';
        html  += '                        <input type="text" name="latest_module['+module_row_latest+'][image_width]" value="80" size="3" />';
        html  += '                        <input type="text" name="latest_module['+module_row_latest+'][image_height]" value="80" size="3"/>';
        html  += '                </td>';
        html  += '                <td class="left">';
        html  += '                        <select name="latest_module['+module_row_latest+'][layout_id]">';
        html  += '                                <?php foreach ($layouts as $layout) { ?>';
        html  += '                                <option value=\'<?php echo $layout["layout_id"] ?>\'><?php echo $layout["name"] ?></option>';
        html  += '                                <?php } ?>';
        html  += '                        </select>';
        html  += '                </td>';
        html  += '                <td class="left">';
        html  += '                        <select name="latest_module['+module_row_latest+'][position]">';
        html  += '                                <option value="content_top">Topo</option>';
        html  += '                                <option value="content_bottom">Rodapé</option>';
        html  += '                                <option value="column_left">Esquerda</option>';
        html  += '                                <option value="column_right">Direita</option>';
        html  += '                        </select>';
        html  += '                </td>';
        html  += '                <td class="left">';
        html  += '                        <select name="latest_module['+module_row_latest+'][status]">';
        html  += '                                <option value="1">Enable</option>';
        html  += '                                <option value="0">Disable</option>';
        html  += '                        </select>';
        html  += '                </td>';
        html  += '                <td class="right">';
        html  += '                        <input type="text" name="latest_module['+module_row_latest+'][sort_order]" value="" size="3" />';
        html  += '                </td>';
        html  += '                <td class="left">';
        html  += '                        <a onclick="$(\'#module-row-latest'+module_row_latest+'\').remove();" class="button">Remover</a>';
        html  += '                </td>';
        html  += '        </tr>';
        html  += '    </tbody>';
        
        $('#module_latest tfoot').before(html);
	
	module_row_latest++;
}

function addModuleAccount (){
	html  = '    <tbody id="module-row-account'+module_row_account+'">';
	html  += '    	<tr>';
	html  += '			<td class="left">';
	html  += '				<select name="account_module['+module_row_account+'][layout_id]">';
	html  += '					<?php foreach ($layouts as $layout): ?>';
	html  += '					<option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>';
	html  += '					<?php endforeach ?>';
	html  += '				</select>';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<select name="account_module['+module_row_account+'][position]">';
	html  += '					<option value="content_top"><?php echo $entry_top; ?></option>';
	html  += '					<option value="content_bottom"><?php echo $entry_bottom; ?></option>';
	html  += '					<option value="column_left"><?php echo $entry_left; ?></option>';
	html  += '					<option value="column_right"><?php echo $entry_right; ?></option>';
	html  += '				</select>';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<select name="account_module['+module_row_account+'][status]">';
	html  += '					<option value="1">Enabled</option>';
	html  += '					<option value="0">Disabled</option>';
	html  += '				</select>';
	html  += '			</td>';
	html  += '			<td class="right">';
	html  += '				<input type="text" size="3" value= "" name="account_module['+module_row_account+'][sort_order]" />';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<a onClick="$(\'#module-row-account'+module_row_account+'\').remove()" class="button">Remove</a>';
	html  += '			</td>';
	html  += '		</tr>';
	html  += '	</tbody>';
	
	$('#module_account tfoot').before(html);
	
	module_row_account++;
}

function addModuleAffiliate (){
	html  = '    <tbody id="module-row-affiliate'+module_row_affiliate+'">';
	html  += '    	<tr>';
	html  += '			<td class="left">';
	html  += '				<select name="affiliate_module['+module_row_affiliate+'][layout_id]">';
	html  += '					<?php foreach ($layouts as $layout): ?>';
	html  += '					<option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>';
	html  += '					<?php endforeach ?>';
	html  += '				</select>';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<select name="affiliate_module['+module_row_affiliate+'][position]">';
	html  += '					<option value="content_top"><?php echo $entry_top; ?></option>';
	html  += '					<option value="content_bottom"><?php echo $entry_bottom; ?></option>';
	html  += '					<option value="column_left"><?php echo $entry_left; ?></option>';
	html  += '					<option value="column_right"><?php echo $entry_right; ?></option>';
	html  += '				</select>';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<select name="affiliate_module['+module_row_affiliate+'][status]">';
	html  += '					<option value="1">Enabled</option>';
	html  += '					<option value="0">Disabled</option>';
	html  += '				</select>';
	html  += '			</td>';
	html  += '			<td class="right">';
	html  += '				<input type="text" size="3" value= "" name="affiliate_module['+module_row_affiliate+'][sort_order]" />';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<a onClick="$(\'#module-row-affiliate'+module_row_affiliate+'\').remove()" class="button">Remove</a>';
	html  += '			</td>';
	html  += '		</tr>';
	html  += '	</tbody>';
	
	$('#module_affiliate tfoot').before(html);
	
	module_row_affiliate++;
}

function addModuleCarousel (){
	html  = '    <tbody id="module-row-carousel'+module_row_carousel+'">';
	html  += '    	<tr>';
	html  += '			<td class="left">';
	html  += '				<select name="carousel_module['+module_row_carousel+'][banner_id]">';
	html  += '					<?php foreach ($banners as $banner){ ?>';
	html  += '					<option value="<?php echo $banner['banner_id'] ?>"><?php echo $banner['name'] ?></option>';
	html  += '					<?php } ?>';
	html  += '				</select>';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<input type="text" value="5" size="1" name="carousel_module['+module_row_carousel+'][limit]" />';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<input type="text" value="5" size="1" name="carousel_module['+module_row_carousel+'][scroll]" />';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<input type="text" value="80" size="1" name="carousel_module['+module_row_carousel+'][width]" />';
	html  += '				<input type="text" value="80" size="1" name="carousel_module['+module_row_carousel+'][height]" />';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<select name="carousel_module['+module_row_carousel+'][layout_id]">';
	html  += '					<?php foreach ($layouts as $layout){ ?>';
	html  += '					<option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>';
	html  += '					<?php } ?>';
	html  += '				</select>';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<select name="carousel_module['+module_row_carousel+'][position]">';
	html  += '					<option value="content_top"><?php echo $entry_top; ?></option>';
	html  += '					<option value="content_bottom"><?php echo $entry_bottom; ?></option>';
	html  += '					<option value="column_left"><?php echo $entry_left; ?></option>';
	html  += '					<option value="column_right"><?php echo $entry_right; ?></option>';
	html  += '				</select>';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<select name="carousel_module['+module_row_carousel+'][status]">';
	html  += '					<option value="1"><?php echo $entry_enabled ?></option>';
	html  += '					<option value="0"><?php echo $entry_disabled ?></option>';
	html  += '				</select>';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<input type="text" value="" size="3" name="carousel_module['+module_row_carousel+'][sort_order]" />';
	html  += '			</td>';
	html  += '			<td class="left">';
	html  += '				<a onClick="$(#\'module-row-carousel'+module_row_carousel+'\').remove()" class="button"><?php echo $entry_remove ?></a>';
	html  += '			</td>';
	html  += '		</tr>';
	html  += '	</tbody>';
	
	$('#module_carousel tfoot').before(html);
	
	module_row_carousel++;
}

function addModuleCategory (){
	html  = '    <tbody id="module-row-category'+module_row_category+'">';
	html  += '    	<tr>';
	html  += '			<td class="left">';
	html  += '				<select name="category_module['+module_row_category+'][layout_id]">';
	html  += '					<?php foreach($layouts as $layout){ ?>';
	html  += '					<option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>';
	html  += '					<?php } ?>';
	html  += '				</select>';
	html  += '			</td>';
	
	html  += '			<td class="left">';
	html  += '				<select name="category_module['+module_row_category+'][position]">';
	html  += '					<option value="content_top"><?php echo $entry_top; ?></option>';
	html  += '					<option value="content_bottom"><?php echo $entry_bottom; ?></option>';
	html  += '					<option value="column_left"><?php echo $entry_left; ?></option>';
	html  += '					<option value="column_right"><?php echo $entry_right; ?></option>';
	html  += '				</select>';
	html  += '			</td>';
			
	html  += '			<td class="left">';
	html  += '				<select name="category_module['+module_row_category+'][count]">';
	html  += '					<option value="1"><?php echo $entry_enabled ?></option>';
	html  += '					<option value="0"><?php echo $entry_disabled ?></option>';
	html  += '				</select>';
	html  += '			</td>';
			
	html  += '			<td class="left">';
	html  += '				<select name="category_module['+module_row_category+'][status]">';
	html  += '					<option value="1"><?php echo $entry_enabled ?></option>';
	html  += '					<option value="0"><?php echo $entry_disabled ?></option>';
	html  += '				</select>';
	html  += '			</td>';
			
	html  += '			<td class="right">';
	html  += '				<input type="text" name="category_module['+module_row_category+'][sort_order]" size="3" />';
	html  += '			</td>';
			
	html  += '			<td class="left">';
	html  += '				<a onClick="$(\'#module-row-category'+module_row_category+'\').remove()" class="button"><?php echo $entry_remove ?></a>';
	html  += '			</td>';
	html  += '		</tr>';
	html  += '	</tbody>';
	
	$('#module_category tfoot').before(html);
	
	module_row_category++;
	
}

function addModuleSpecial (){
	html  = '<tbody id="module-row-special'+module_row_special+'">';
	html  += '		<tr>';
	html  += '			<td class="left">';
	html  += '				<input type="text" value="5" name="special_module['+module_row_special+'][limit]" size="1" />';
	html  += '			</td>';

	html  += '			<td class="left">';
	html  += '				<input type="text" value="80" name="special_module['+module_row_special+'][image_width]" size="1" />';
	html  += '				<input type="text" value="80" name="special_module['+module_row_special+'][image_height]" size="1" />';
	html  += '			</td>';
				
	html  += '			<td class="left">';
	html  += '				<select name="special_module['+module_row_special+'][layout_id]">';
	html  += '					<?php foreach($layouts as $layout){ ?>';
	html  += '					<option value="<?php echo $layout['layout_id'] ?>"><?php echo $layout['name'] ?></option>';
	html  += '					<?php } ?>';
	html  += '				</select>';
	html  += '			</td>';
				
	html  += '			<td class="left">';
	html  += '				<select name="special_module['+module_row_special+'][position]">';
	html  += '					<option value="content_top"><?php echo $entry_top; ?></option>';
	html  += '					<option value="content_bottom"><?php echo $entry_bottom; ?></option>';
	html  += '					<option value="column_left"><?php echo $entry_left; ?></option>';
	html  += '					<option value="column_right"><?php echo $entry_right; ?></option>';
	html  += '				</select>';
	html  += '			</td>';
				
	html  += '			<td class="left">';
	html  += '				<select name="special_module['+module_row_special+'][status]">';
	html  += '					<option value="1"><?php echo $entry_enabled ?></option>';
	html  += '					<option value="0"><?php echo $entry_disabled ?></option>';
	html  += '				</select>';
	html  += '			</td>';
				
	html  += '			<td class="right">';
	html  += '				<input type="text" name="special_module['+module_row_special+'][sort_order]" size="4" />';
	html  += '			</td>';
				
	html  += '			<td class="left">';
	html  += '				<a onClick="$(\'#module-row-special'+module_row_special+'\').remove()" class="button"><?php echo $entry_remove ?></a>';
	html  += '			</td>';
	html  += '		</tr>';
	html  += '	</tbody>';
	
	$('#module_special tfoot').before(html);
	
	module_row_special++;
}

//--></script> 
<?php echo $footer; ?>