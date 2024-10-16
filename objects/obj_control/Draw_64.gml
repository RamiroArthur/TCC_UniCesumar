/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//draw_text(x,y,global.pontos);
draw_set_font(fnt_game);
draw_set_color(c_black);

draw_sprite_ext(spr_gui_pontos_fase,0,x,y,2.3,2,0,c_white,1);  //Tamanho original do quadro
//draw_sprite_ext(spr_gui_pontos_fase,0,x,y,2.9,2,0,c_white,1);	//Tamanho atualizado para caber os corações!
draw_sprite_ext(spr_retrato_player,0,x + 70,y + 10,-1.5,1.5,0,c_white,1);

/*///////////////////apresentando corações de vida/////////////////////////////////
var _espaco = 5;
repeat(global.vidas)
{
	draw_sprite(spr_vida,0, x + 65 + _espaco, y + 25);
	_espaco += 18;
}
*/////////////////////////////////////////////////////


draw_text(x + 15,y + 70,"Acertos: " + string(global.acertos));
draw_text(x + 15,y + 90,"Erros: " + string(global.erros));
//O [x] original é '+15' para os dois!


draw_set_font(-1);
draw_set_color(-1);

