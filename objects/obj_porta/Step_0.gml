/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (place_meeting(x,y,obj_player))
{
	image_index = 4;
	if (controla_som == false)
	{
		audio_play_sound(snd_door_open_interior,3,0,1);	
		controla_som = true;
	}
}
else
{
	image_index = 0;
	controla_som = false;	
}



