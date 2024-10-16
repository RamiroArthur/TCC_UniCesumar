/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (global.interacao >= 11)
{
	image_index = 1;
	
	if (controle_som == false)
	{
		audio_play_sound(snd_door_open_exterior,3,0,2);
		controle_som = true;
	}
	
	
	if (place_meeting(x,y+20,obj_player))
	{
		audio_stop_all();
		room_goto_next()
		global.acertos = 0;
		global.erros = 0;
		global.interacao = 0;
		//global.vidas = 5;
	}
}





