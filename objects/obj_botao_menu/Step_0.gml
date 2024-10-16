/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (instance_position(mouse_x,mouse_y,id))
{
	image_index = 2;
	if (mouse_check_button_pressed(mb_left) && funcao == "Iniciar")
	{
		room_goto(1);
	}
	else if(mouse_check_button_pressed(mb_left) && funcao == "Creditos")
	{
		room_goto(3);
	}
	else if(mouse_check_button_pressed(mb_left) && funcao == "Retornar")
	{
		room_goto(0);
	}
	else if(mouse_check_button_pressed(mb_left) && funcao == "Sair")
	{
		game_end();
	}
}
else
	image_index = 0;


