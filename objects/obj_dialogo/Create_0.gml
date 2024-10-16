/// @description Insert description here
// You can write your code in this editor

dialogo = noone;
indice	= 1;
page   =  0;
player = noone;

libera_player = function()
{
	if (player) //Se eu tenho um player
	{
		with(player) //Entro dentro desse player
		{
			estado = estado_parado;
		}
	}
	instance_destroy();
}

cria_dialogo = function(_dialogo)
{
	static _gui_w		 = display_get_gui_width();
	static _gui_h		 = display_get_gui_height();
	static _sprite_w	 = sprite_get_width(spr_caixa_dialogo);
	static _sprite_h	 = sprite_get_height(spr_caixa_dialogo);
	
	//Definindo a fonte
	draw_set_font(fnt_dialogo);
	
	//Convertendo a escala da sprite da caixa de dialogo de pixels para escala (porcentagem)
	var _escala_x		= _gui_w / _sprite_w;
	var _escala_y		= (_gui_h * .3) / _sprite_h;
	
	var _txt		= _dialogo.texto[page];
	var _txt_atual	= string_copy(_txt, 1, indice);
	var _txt_tam	= string_length(_txt);
	var _txt_vel	= _dialogo.txt_vel;
	var _yy			= _gui_h - (_escala_y * _sprite_h);
	var _margem		= string_height("I");
	var _retrato	= _dialogo.retrato[page];
	var _ret_escala	= (_gui_h * 0.16) / sprite_get_width(_retrato);
	var _ret_y		= _yy + ((sprite_get_height(_retrato) * _ret_escala) / 6);
	var _ret_larg	= _ret_escala * sprite_get_width(_retrato);
	var _qtd_page	= array_length(_dialogo.texto) - 1;
	
	//Sempre que eu apertar espaço eu pulo de página
	if (keyboard_check_pressed(vk_space)) 
	{
		//Eu ainda não terminei a página atual (as letras dela)
		// eu vou para o final da página atual
		if (indice < _txt_tam) 	indice = _txt_tam;
		//Caso contrário (já esta no final) então eu pulo de página SE eu aainda tenho página
		else if (page < _qtd_page)
		{
			indice = 0;
			page ++;
		}
		else //Acabei a pagina atual e nao tenho mais nenhuma pagina para ver
		{
			libera_player();
		}
	}
	
	//Aumentando o valor do índice se ele for menor que o tamanho da string inteira
	if (indice <= _txt_tam) indice += _txt_vel;
	
	//Desenhando a caixa de texto
	draw_sprite_ext(spr_caixa_dialogo, 0, 0, _yy, _escala_x, _escala_y, 0, c_white, 1);
	
	//Desenhando o retrato
	draw_sprite_ext(_retrato, 0, _margem, _ret_y, _ret_escala, _ret_escala, 0, c_white, 1);
	
	draw_text_ext(_margem * 2 + _ret_larg, _yy + _margem, _txt_atual, _margem, _gui_w - _margem * 2 - _ret_larg);
	draw_set_font(-1);
}

