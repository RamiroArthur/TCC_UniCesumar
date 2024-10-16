/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//if colisao com mouse (acende) então se click E variavel texto == "Resetar" entao room_reset
//senao se click e variavel texto == "Sair" então "funcao de sair do jogo"

var _click = mouse_check_button_pressed(mb_left);

image_index = 0;

if (position_meeting(mouse_x, mouse_y,id) && texto == "Resetar")
{
	image_index = 2;
	if (_click)
	{
		audio_stop_all();
		room_goto(1);
		global.acertos = 0;
		global.erros = 0;
		global.interacao = 0;
	
		//instance_destroy(obj_painel_game_over);
		//instance_destroy(obj_botao_opcao);
	}
}
else if (position_meeting(mouse_x, mouse_y,id) && texto == "Sair")
{
	image_index = 1;
	if (_click)
	{
		audio_stop_all();
		room_goto(0);
		global.acertos = 0;
		global.erros = 0;
		global.interacao = 0;
		//instance_destroy(obj_painel_game_over);
		//instance_destroy(obj_botao_opcao);
	}
}
else if (position_meeting(mouse_x, mouse_y,id) && texto == "Continuar")
{
	image_index = 2;
	if (_click)
	{
		instance_destroy(obj_painel_esc);
		instance_destroy(obj_botao_opcao);
		with (obj_player)
		{
			estado = estado_parado;	
		}
	}
}




