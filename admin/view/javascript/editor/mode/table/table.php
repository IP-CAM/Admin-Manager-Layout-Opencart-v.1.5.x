<?PHP
	
	require_once('../../../../../config.php');
	require_once('../../../../../../system/startup.php');
	$language = new Language('english');
	$language ->load('appaearance/themeditor');
?>

<!---------------------------->
<!--          TABS          -->
<!---------------------------->
<div id="tabs" class="htabs">
	<a href="#tab-formatTable"><?php echo $language->get('tabs_formatTable') ?></a>
	<a href="#tab-advanced" id="advanced"><?php echo $language->get('tabs_advanced') ?></a>
</div>

<div id="tab-formatTable">
	<table>
		<tr>
			<!---------------------------->
			<!--       LINES | TD       -->
			<!---------------------------->
			<td>
				<label for="td"><?php echo $language->get('dl_td') ?></label><br/>
				<input id="td" type="text" value="3" />
			</td>
			
			<!---------------------------->
			<!--          WIDTH         -->
			<!---------------------------->
			<td>
				<label for="width"><?php echo $language->get('dl_width') ?></label><br/>
				<input id="width" type="text" value="500" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--       COLS | TR        -->
			<!---------------------------->
			<td>
				<label for="tr"><?php echo $language->get('dl_tr') ?></label><br/>
				<input id="tr" type="text" value="2" />
			</td>
			
			<!---------------------------->
			<!--         HEIGHT         -->
			<!---------------------------->
			<td>
				<label for="height"><?php echo $language->get('dl_height') ?></label><br/>
				<input id="height" type="text" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--       THEAD | TH       -->
			<!---------------------------->
			<td>
				<label for="th"><?php echo $language->get('dl_th') ?></label><br/>
				<select id="th">
					<option value=""><?php echo $language->get('dl_none') ?></option>
					<option value="thead"><?php echo $language->get('dl_th_firstLine') ?></option>
					<option value="tr"><?php echo $language->get('dl_th_firstCol') ?></option>
					<option value="thead_and_tr"><?php echo $language->get('dl_th_both') ?></option>
				</select>
			</td>
			
			<!---------------------------->
			<!--      CELLSPACING       -->
			<!---------------------------->
			<td>
				<label for="cellspacing"><?php echo $language->get('dl_cellspacing') ?></label><br/>
				<input id="cellspacing" type="text" value="1" />
			</td>
		</tr>
		<tr>
			
			<!---------------------------->
			<!--         BORDER         -->
			<!---------------------------->
			<td>
				<label for="border"><?php echo $language->get('dl_border') ?></label><br/>
				<input id="border" type="text" value="1" />
			</td>
			
			<!---------------------------->
			<!--      CELLPADDING       -->
			<!---------------------------->
			<td>
				<label for="cellpadding"><?php echo $language->get('dl_cellpadding') ?></label><br/>
				<input id="cellpadding" type="text" value="1" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--          ALIGN         -->
			<!---------------------------->
			<td>
				<label for="align"><?php echo $language->get('dl_align') ?></label><br/>
				<select id="align">
					<option value=""><?php echo $language->get('dl_notAdjusted') ?></option>
					<option value="left"><?php echo $language->get('dl_left') ?></option>
					<option value="center"><?php echo $language->get('dl_center') ?></option>
					<option value="right"><?php echo $language->get('dl_right') ?></option>
				</select>
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--         CAPTION        -->
			<!---------------------------->
			<td colspan="2">
				<label for="caption"><?php echo $language->get('dl_caption') ?></label><br/>
				<input type="text" size="45" id="caption" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--         SUMARY         -->
			<!---------------------------->
			<td colspan="2">
				<label for="summary"><?php echo $language->get('dl_sumary') ?></label><br/>
				<input type="text" size="45" id="summary" />
			</td>
		</tr>
	</table>
</div>

<!---------------------------->
<!--      TAB ADVANCED      -->
<!---------------------------->
<div id="tab-advanced">
	<table>
		<tr>
		
			<!---------------------------->
			<!--           ID           -->
			<!---------------------------->
			<td>
				<label for="id"><?php echo $language->get('dl_id') ?></label><br/>
				<input type="text" id="id" />
			</td>
			
			<!---------------------------->
			<!--          DIR           -->
			<!---------------------------->
			<td>
				<label for="dir"><?php echo $language->get('dl_dir') ?></label><br/>
				<select id="dir">
					<option value=""><?php echo $language->get('dl_noAdjusted') ?></option>
					<option value="ltr"><?php echo $language->get('dl_dir_ltr') ?></option>
					<option value="rtl"<?php echo $language->get('dl_dir_rtl') ?></option>
				</select>
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--         STYLE          -->
			<!---------------------------->
			<td>
				<label for="style"><?php echo $language->get('dl_style') ?></label><br/>
				<input type="text" id="style" />
			</td>
			
			<!---------------------------->
			<!--          CLASS         -->
			<!---------------------------->
			<td>
				<label for="class"><?php echo $language->get('dl_class') ?></label><br/>
				<input type="text" id="class" />
			</td>
		</tr>
	</table>
</div>

<script>
		$("#tabs a").tabs();
		
		$('#advanced').click(function(){
			
			var Height = $('#height').val();
			var Width  = $('#width').val();
			var Data   = '';
			
			if (Height != ''){
				$('#style').val('height:'+Height+'px; '+Data)
				Data = $('#style').val();
			}
			
			if (Width != ''){
				$('#style').val('width:'+Width+'px; '+Data)
				Data = $('#style').val();
			}
			
		});
		
</script>