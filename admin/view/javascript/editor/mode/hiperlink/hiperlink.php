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
	<a href="#tab-information"><?php echo $language->get('tabs_information'); ?></a>
	<a href="#tab-destiny"><?php echo $language->get('tabs_destiny'); ?></a>
	<a href="#tab-advanced"><?php echo $language->get('tabs_advanced'); ?></a>
</div>

<!---------------------------->
<!--    TAB INFORMATION     -->
<!---------------------------->
<div id="tab-information">
	<table>
		<tr>
			<!---------------------------->
			<!--          TYPE          -->
			<!---------------------------->
			<td>
				<label for="typeHiperlink"><?php echo $language->get('dl_typeHiperlink'); ?></label><br/>
				<select id="typeHiperlink" style="height:23px;">
					<option value="url"><?php echo $language->get('dl_url'); ?></option>
				</select>
			</td>
			
			<!---------------------------->
			<!--        PROTOCOL        -->
			<!---------------------------->
			<td>
				<label for="protocol"><?php echo $language->get('dl_protocol'); ?></label><br/>
				<select id="protocol">
					<option value="http://">http://</option>
					<option value="https://">https://</option>
					<option value="ftp://">ftp://</option>
					<option value="news://">news://</option>
					<option value="outros"><?php echo $language->get('dl_other'); ?></option>
				</select>
			</td>
		</tr>
		
		<tr>		
			<!---------------------------->
			<!--          URL           -->
			<!---------------------------->
			<td colspan="2">
				<label for="url"><?php echo $language->get('URL'); ?></label><br/>
				<input type="text" id="url" size="60" />
			</td>
		</tr>
	</table>
</div>


<!---------------------------->
<!--      TAB DESTINY       -->
<!---------------------------->
<div id="tab-destiny">
	
	<!---------------------------->
	<!--         TARGET         -->
	<!---------------------------->
	<label for="target"><?php echo $language->get('dl_target'); ?></label>
	<select id="target">
		<option value=""><?php echo $language->get('dl_notAdjusted'); ?></option>
		<option value="_blank"><?php echo $language->get('dl_target_blank'); ?></option>
		<option value="_top"><?php echo $language->get('dl_target_top'); ?></option>
		<option value="_self"><?php echo $language->get('dl_target_self'); ?></option>
		<option value="_parent"><?php echo $language->get('dl_target_parent'); ?></option>
	</select>
	
</div>

<!---------------------------->
<!--     TAB ADVANCED       -->
<!---------------------------->
<div id="tab-advanced">
	<table>
		<tr>
			<!---------------------------->
			<!--           ID           -->
			<!---------------------------->
			<td>
				<label for="id"><?php echo $language->get('id'); ?></label>
				<input type="text" id="id" />
			</td>
			
			<!---------------------------->
			<!--          DIR           -->
			<!---------------------------->
			<td>
				<label for="dir"><?php echo $language->get('dl_dir'); ?></label>
				<select id="dir">
					<option value=""><?php echo $language->get('dl_notAdjusted'); ?></option>
					<option value="ltr"><?php echo $language->get('dl_dir_ltr'); ?></option>
					<option value="rtl"><?php echo $language->get('dl_dir_rtl'); ?></option>
				</select>
			</td>
			
			<!---------------------------->
			<!--        ACCESSKEY       -->
			<!---------------------------->
			<td>
				<label for="accesskey"><?php echo $language->get('dl_accesskey'); ?></label>
				<input type="text" id="accesskey" maxlength="1" />
			</td>
		</tr>
		

		<tr>
			<!---------------------------->
			<!--          NAME          -->
			<!---------------------------->
			<td>
				<label for="name"><?php echo $language->get('dl_name'); ?></label>
				<input type="text" id="name" />
			</td>
			
			<!---------------------------->
			<!--          LANG          -->
			<!---------------------------->
			<td>
				<label for="language"><?php echo $language->get('dl_lang'); ?></label>
				<input type="text" id="language" />
			</td>
			
			<!---------------------------->
			<!--        TABINDEX        -->
			<!---------------------------->
			<td>
				<label for="tabIndex"><?php echo $language->get('dl_tabindex'); ?></label>
				<input type="text" id="tabIndex" maxlength="5" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--          TITLE         -->
			<!---------------------------->
			<td>
				<label for="title"><?php echo $language->get('dl_title'); ?></label>
				<input type="text" id="title" />
			</td>
			
			<!---------------------------->
			<!--          TYPE          -->
			<!---------------------------->
			<td colspan="2">
				<label for="type"><?php echo $language->get('dl_type'); ?></label><br/>
				<input type="text" id="type" size="58" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--         CHARSET        -->
			<!---------------------------->
			<td>
				<label for="charset"><?php echo $language->get('dl_charset'); ?></label><br/>
				<input type="text" id="charset" />
			</td>
			
			<!---------------------------->
			<!--          CLASS         -->
			<!---------------------------->
			<td colspan="2">
				<label for="class"><?php echo $language->get('dl_class'); ?></label>
				<input type="text" id="class" size="58" />
			</td>
		</tr>
		
		<tr>
			<!---------------------------->
			<!--           REL          -->
			<!---------------------------->
			<td>
				<label for="rel"><?php echo $language->get('dl_rel'); ?></label>
				<input type="text" id="rel" />
			</td>
			
			<!---------------------------->
			<!--          STYLE         -->
			<!---------------------------->
			<td colspan="2">
				<label for="style"><?php echo $language->get('dl_style'); ?></label><br/>
				<input type="text" id="style" placeholder="example = width:50px;" size="58" />
			</td>
		</tr>
	</table>
</div>


<script>
	$(function() {
		$("#tabs a").tabs();
	});
</script>