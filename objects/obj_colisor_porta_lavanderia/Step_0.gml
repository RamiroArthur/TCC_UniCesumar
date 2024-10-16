/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (global.interacao >= 20)
{
	audio_play_sound(snd_door_unlock,3,0,3);
	instance_destroy(id);
}


