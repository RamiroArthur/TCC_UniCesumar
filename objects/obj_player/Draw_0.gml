/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

/// @description Insert description here
// You can write your code in this editor

//Desenhar a minha Sprite
draw_sprite_ext(sprite ,image_ind, x, y, xscale * 2, image_yscale * 2, image_angle, image_blend, image_alpha);

//Debug do estado
if (global.debug)
{
	draw_set_valign(1);
	draw_set_halign(1);
	draw_text(x, y - sprite_height * 2, estado_txt);
	draw_set_valign(-1);
	draw_set_halign(-1);
}






