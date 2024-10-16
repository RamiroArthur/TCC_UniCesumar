///@function desenha_sombra(sprite, escala, [cor], [alpha])
function desenha_sombra(_sprite, _escala, _cor = c_white, _alpha = .2)
{
	//Desenhando a minha sombra
	draw_sprite_ext(_sprite, 0, x, y, _escala, _escala, 0, _cor, _alpha);
}

function ajusta_depth()
{
	depth = -y;
}

//Variaveis globais
global.acertos = 0;
global.qtd_objetos_fase1 = 11;
global.qtd_objetos_fase2 = 0;
global.erros = 0;
global.interacao = 0;
