<?php echo $header; ?>
<style>
	.theme {
		border: 1px solid black;
		width: 250px;
		height: 180px;
		position: relative;
		overflow:hidden;
		display:inline-block;
	}
	.theme_image {
		position: absolute;
		top: 0;
		left: 0;
		width: 250px;
		height: 180px;
	}
	.theme_overlay {
		width: 250px;
		height: 180px;
		background: rgba(0, 0, 0, 0.8);
		position:absolute;
		display:none;
	}
	.theme_name {
		width: 100%;
		height: 30px;
		background: rgba(0, 0, 0, 0.5);
		position: absolute;
		left: 0;
		color: white;
		font-size: 15px;
		text-align: center;
		line-height: 30px;
		font-weight: bold;
		top: -30px;
	}
	.theme_options {
		position: absolute;
		background: rgba(0, 0, 0, 0.5);
		width: 240px;
		height: 30px;
		padding: 5px;
		bottom: -40px;
	}
	.theme_option:first-child {
		margin-left:0;
	}
	.theme_option {
		background: rgba(50, 50, 50, 1);
		cursor:pointer;
		display:none;
		height: 24px;
		width: 24px;
		margin: 0 0 0 75px;
		float: left;
		padding: 3px;
		border-radius: 3px;
		box-shadow: 0 0 6px rgba(122, 120, 120, 0.77);
	}
	
</style>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
    <?php if (isset($this->session->data['notDelete'])) { ?>
    <div class="warning"><?php echo $this->session->data['notDelete']; ?></div>
    <?php unset($this->session->data['notDelete']); } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/order.png" alt="" />Layout</h1>
      <div class="buttons">
          <a href="<?php echo $linkInsert; ?>" class="button">Inserir</a>
      </div>
    </div>
    <div class="content">
		<?php foreach ($templates as $template){ ?>
		<div class="theme">
			<img src="http://localhost/opencartnew/image/templates/<?php echo $template['nameTemplate'] ?>.png" class="theme_image" />
			<div class="theme_overlay"></div>
			<div class="theme_name"><?php echo ucwords(preg_replace('/[^a-zA-Z]/', ' ', $template['nameTemplate'])) ?></div>
			<div class="theme_options">
				<?php if ($template['activated'] == 0): ?>
				<div class="theme_option">
					<a href="<?php echo $linkActivate ?>&id_template=<?php echo $template['id']; ?>"><img src="view/image/success-icon.png" /></a>
				</div>
				<?php endif ?>
				
				<div class="theme_option">
					<a href="<?php echo $linkEdit ?>&id_template=<?php echo $template['id']; ?>"><img src="view/image/edit-icon.png" /></a>
				</div>
				
				<?php if ($template['activated'] == 0): ?>
				<div class="theme_option">
					<a href="<?php echo $linkDelete ?>&id_template=<?php echo $template['id']; ?>"><img src="view/image/trash-icon.png" /></a>
				</div>
				<?php endif; ?>
			</div>
		</div>
		 <?php } ?>
    </div>
      <small>Desenvolvido por: <a href="mailto:valdeirpsr@hotmail.com.br">Valdeir Santana</a></small>
  </div>
</div>
<script><!--

	$('.theme').hover(function(){
		$(this).find('.theme_overlay').fadeIn('slow');
		$(this).find('.theme_name').animate({
				top:0
			});
		$(this).find('.theme_options').animate({
			bottom:0
		});
		$(this).find('.theme_option').showdelay('fadeIn');
	}, function (){
		$(this).find('.theme_option').showdelay('fadeOut');
		$(this).find('.theme_options').animate({
			bottom:-40
		});
		$(this).find('.theme_name').animate({
			top:-30
		});
		$(this).find('.theme_overlay').fadeOut('slow');
	});
	
	
	(function($){
	  $.fn.showdelay = function(fade){
		var delay = 0;
		return this.each(function(){
			if (fade == 'fadeIn'){
				$(this).delay(delay).fadeIn(100);
			}else{
				$(this).delay(delay).fadeOut(100);
			}
			delay += 200;
		});
	  };
	})(jQuery);
	
//--></script>
<?php echo $footer; ?>