<?PHP
	
	require_once('../../../../../config.php');
	require_once('../../../../../../system/startup.php');
	$language = new Language('english');
	$language ->load('appaearance/themeditor');
	$session = new Session();
?>
<style>
	#previewImage{
		background:#FFF;
		border:2px solid #000;
		height:238px;
		overflow:auto;
		width:287px;
	}
</style>

<!---------------------------->
<!--          TABS          -->
<!---------------------------->
<div id="tabs" class="htabs">
	<a href="#tab-information"><?php echo $language->get('tabs_information'); ?></a>
	<a href="#tab-link"><?php echo $language->get('tabs_editLink'); ?></a>
	<a href="#tab-advanced" id="advanced"><?php echo $language->get('tabs_advanced'); ?></a>
</div>

<!---------------------------->
<!--     TAB INFORMATION    -->
<!---------------------------->
<div id="tab-information">
	<table>
		<tr>
			<!---------------------------->
			<!--          URL           -->
			<!---------------------------->
			<td>
				<label for="link_image"><?php echo $language->get('dl_url'); ?></label><br/>
				<input type="text" id="link_image" class="left" size="50" />
				<a onClick="image_upload('image', 'thumb', 'link_image');" class="button" style="color:#FFF"><?php echo $language->get('dl_browse'); ?></a>
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--          ALT           -->
			<!---------------------------->
			<td>
				<label for="alt"><?php echo $language->get('dl_alt'); ?></label><br/>
				<input type="text" id="alt" class="left" size="81" />
			</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<!---------------------------->
			<!--         WIDTH          -->
			<!---------------------------->
			<td>
				<label for="width"><?php echo $language->get('dl_width'); ?></label><br/>
				<input type="text" id="width" size="15" />
			</td>
			
			<!---------------------------->
			<!--        PREVIEW         -->
			<!---------------------------->
			<td rowspan="6" colspan="2">
				<div id="previewImage">
					<img src="" id="image" />
					<span>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.</span>
				</div>
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--         HEIGHT         -->
			<!---------------------------->
			<td>
				<label for="height"><?php echo $language->get('dl_height'); ?></label><br/>
				<input type="text" id="height" size="15" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--         BORDER         -->
			<!---------------------------->
			<td>
				<label for="border"><?php echo $language->get('dl_border'); ?></label><br/>
				<input type="text" id="border" size="15" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--         HSPACE         -->
			<!---------------------------->
			<td>
				<label for="hspace"><?php echo $language->get('dl_hspace'); ?></label><br/>
				<input type="text" id="hspace" size="15" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--         VSPACE         -->
			<!---------------------------->
			<td>
				<label for="vspace"><?php echo $language->get('dl_vspace'); ?></label><br/>
				<input type="text" id="vspace" size="15" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--          ALIGN         -->
			<!---------------------------->
			<td>
				<label for="align"><?php echo $language->get('dl_align'); ?></label><br/>
				<select id="align">
					<option value=""><?php echo $language->get('dl_notAdjusted'); ?></option>
					<option value="left"><?php echo $language->get('dl_left'); ?></option>
					<option value="right"><?php echo $language->get('dl_right'); ?></option>
				</select>
			</td>
		</tr>
	</table>
</div>

<!---------------------------->
<!--        TAB LINK        -->
<!---------------------------->
<div id="tab-link">
	<table>
		<tr>
			<!---------------------------->
			<!--           URL          -->
			<!---------------------------->
			<td>
				<label for="url"><?php echo $language->get('dl_url'); ?></label><br/>
				<input type="text" id="url" size="50" />
				<a onClick="image_upload('image2','thumb', 'url')" class="button right" style="color:#FFF;"><?php echo $language->get('dl_browse'); ?></a>
				<img src="" style="display:none;" id="image2" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--         TARGET         -->
			<!---------------------------->
			<td>
				<label for="target"><?php echo $language->get('dl_target'); ?></label><br/>
				<select id="target">
					<option value=""><?php echo $language->get('dl_notAdjusted'); ?></option>
					<option value="_blank"><?php echo $language->get('dl_target_blank'); ?></option>
					<option value="_top"><?php echo $language->get('dl_target_top'); ?></option>
					<option value="_self"><?php echo $language->get('dl_target_self'); ?></option>
					<option value="_parent"><?php echo $language->get('dl_target_parent'); ?></option>
				</select>
			</td>
		</tr>
	</table>

</div>

<div id="tab-advanced">
	<table>
		<tr>
			<!---------------------------->
			<!--           ID           -->
			<!---------------------------->
			<td>
				<label for="id"><?php echo $language->get('dl_id'); ?></label><br/>
				<input type="text" id="id" />
			</td>
			
			<!---------------------------->
			<!--          DIR           -->
			<!---------------------------->
			<td>
				<label for="dir"><?php echo $language->get('dl_dir'); ?></label><br/>
				<select id="dir">
					<option value=""><?php echo $language->get('dl_notAdjusted'); ?></option>
					<option value="ltr"><?php echo $language->get('dl_dir_ltr'); ?></option>
					<option value="rtl"><?php echo $language->get('dl_dir_rtl'); ?></option>
				</select>
			</td>
			
			<!---------------------------->
			<!--          LANG          -->
			<!---------------------------->
			<td>
				<label for="lang"><?php echo $language->get('dl_lang'); ?></label><br/>
				<input type="text" id="lang" />
			</td>
			
			<td></td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--        LONGDESC        -->
			<!---------------------------->
			<td colspan="3">
				<label for="longdesc"><?php echo $language->get('dl_longdesc'); ?></label><br/>
				<input type="text" id="longdesc" size="84" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--         CLASS          -->
			<!---------------------------->
			<td colspan="2">
				<label for="class"><?php echo $language->get('dl_class'); ?></label><br/>
				<input type="text" id="class" size="60" />
			</td>
			
			<!---------------------------->
			<!--          TITLE         -->
			<!---------------------------->
			<td>
				<label for="title"><?php echo $language->get('dl_title'); ?></label><br/>
				<input type="text" id="title" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--          STYLE          -->
			<!---------------------------->
			<td colspan="3">
				<label for="style"><?php echo $language->get('dl_style'); ?></label><br/>
				<input type="text" id="style" size="84" />
			</td>
		</tr>
	</table>
</div>

<script>
		$("#tabs a").tabs();
		
		$('#link_image').keyup(function (){
			$('#image').attr('src',$(this).val());
		});
		
		$('#width').keyup(function (){
			$('#image').css({
				'width':$(this).val()
			});
		});
		
		$('#height').keyup(function (){
			$('#image').css({
				'height':$(this).val()
			});
		});
		
		$('#border').keyup(function (){
			$('#image').css({
				'border':$(this).val()+'px solid #000'
			});
		});
		
		$('#hspace').keyup(function (){
			$('#image').attr('hspace',$(this).val());
		});
		
		$('#vspace').keyup(function (){
			$('#image').attr('vspace',$(this).val());
		});
		
		$('#align').change(function (){
			$('#image').css({
				'float':$(this).val()
			});
		});
		
		$('#advanced').click (function (){
			var Border = $('#border').val();
			var Float  = $('#align').val();
			var Height = $('#height').val();
			var Width  = $('#width').val();
			var Data   = '';
			
			if (Border != ''){
				$('#style').val('border:'+Border+'px solid #000; '+Data);
				Data   = $('#style').val();
			}
			
			if (Float != ''){
				$('#style').val('float:'+Float+'; '+Data);
				Data   = $('#style').val();
			}
				
			if (Height != ''){
				$('#style').val('height:'+Height+'px; '+Data);
				Data   = $('#style').val();
			}
				
			if (Width != ''){
				$('#style').val('width:'+Width+'px; '+Data);
				Data   = $('#style').val();
			}
			
		});
		
		function image_upload(field, thumb, link) {
			$('#dialog').remove();
			
			$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $session->data['token']; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
			
			$('#dialog').dialog({
				title: '<?php echo $language->get('entry_image'); ?>',
				close: function (event, ui) {
						$.ajax({
						url: 'index.php?route=common/filemanager/image&token=<?php echo $session->data['token']; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
						dataType: 'text',
						success: function(text) {
							$('#' + field).attr('src',text);
							$('#' + link).attr('value',text);
						}
					});
				},	
				bgiframe: false,
				width: 800,
				height: 400,
				resizable: false,
				modal: false
			});
		};
</script>