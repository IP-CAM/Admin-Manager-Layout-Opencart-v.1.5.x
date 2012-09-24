-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.8-log
-- Versão do PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Banco de Dados: `opencartnew`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `layouts`
--

DROP TABLE IF EXISTS `layouts`;
CREATE TABLE IF NOT EXISTS `layouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameTemplate` varchar(100) NOT NULL,
  `descriptionTemplate` varchar(1000) NOT NULL,
  `slideshow_module` varchar(1000) NOT NULL DEFAULT 'a:0:{}',
  `banner_module` varchar(1000) NOT NULL DEFAULT 'a:0:{}',
  `module_bestseller` varchar(1000) NOT NULL DEFAULT 'a:0:{}',
  `featured_module` varchar(1000) NOT NULL DEFAULT 'a:0:{}',
  `featured_product` varchar(1000) NOT NULL,
  `latest_module` varchar(1000) NOT NULL DEFAULT 'a:0:{}',
  `account_module` varchar(1000) NOT NULL DEFAULT 'a:0:{}',
  `affiliate_module` varchar(1000) NOT NULL DEFAULT 'a:0:{}',
  `carousel_module` varchar(1000) NOT NULL DEFAULT 'a:0:{}',
  `category_module` varchar(1000) NOT NULL DEFAULT 'a:0:{}',
  `special_module` varchar(1000) NOT NULL DEFAULT 'a:0:{}',
  `config_image_category_width` int(11) NOT NULL DEFAULT '0',
  `config_image_category_height` int(11) NOT NULL DEFAULT '0',
  `config_image_thumb_width` int(11) NOT NULL DEFAULT '0',
  `config_image_thumb_height` int(11) NOT NULL DEFAULT '0',
  `config_image_popup_width` int(11) NOT NULL DEFAULT '0',
  `config_image_popup_height` int(11) NOT NULL DEFAULT '0',
  `config_image_product_width` int(11) NOT NULL DEFAULT '0',
  `config_image_product_height` int(11) NOT NULL DEFAULT '0',
  `config_image_additional_width` int(11) NOT NULL DEFAULT '0',
  `config_image_additional_height` int(11) NOT NULL DEFAULT '0',
  `config_image_related_width` int(11) NOT NULL DEFAULT '0',
  `config_image_related_height` int(11) NOT NULL DEFAULT '0',
  `config_image_compare_width` int(11) NOT NULL DEFAULT '0',
  `config_image_compare_height` int(11) NOT NULL DEFAULT '0',
  `config_image_wishlist_width` int(11) NOT NULL DEFAULT '0',
  `config_image_wishlist_height` int(11) NOT NULL DEFAULT '0',
  `config_image_cart_width` int(11) NOT NULL DEFAULT '0',
  `config_image_cart_height` int(11) NOT NULL DEFAULT '0',
  `activated` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;
