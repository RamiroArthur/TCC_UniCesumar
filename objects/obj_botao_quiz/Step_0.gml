/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _click = mouse_check_button_pressed(mb_left);

if (position_meeting(mouse_x, mouse_y, id))
{
	id.image_index = 3;
	if (_click && texto == resposta && obj_id.interagiu == false)
	{
		global.interacao ++;
		//show_message("parabens");
		obj_id.interagiu = true;
		id.image_index = 2;
		obj_id.image_index = 1;
		global.acertos ++;
		audio_play_sound(snd_ponto,2,0,2);
		audio_play_sound(obj_id.audio_de,3,0,3); //Executando som ao acertar
		
		
		//Teste
		instance_destroy(obj_botao_quiz);
		instance_destroy(obj_painel_quiz);
		instance_destroy(obj_botao_audio);
		
		
	}
	else if (_click && texto != resposta)
	{
		global.interacao ++;
		//global.vidas--;		//Diminuindo a vida coração
		//show_message("Errou");
		with (obj_player)
		{
			audio_play_sound(snd_erro,2,0,2);
			global.erros++;
			id_objeto.interagiu = true;
			estado = estado_parado;
			quiz_inicio = false;
			quiz_y = 10;
			id_objeto.image_index = 2;
			//Destruindo quiz Se errou
			instance_destroy(obj_botao_quiz);
			instance_destroy(obj_painel_quiz);
			instance_destroy(obj_botao_audio);
		}
	}
}
else 
{
	id.image_index = 0;
}




