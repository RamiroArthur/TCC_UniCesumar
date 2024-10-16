/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

/// @description Insert description here
// You can write your code in this editor

//Herdando as informações do PAI
event_inherited();

//id_objeto = noone;


global.debug = false;

max_vel		= 3;
meu_acel	= .2;
acel		= meu_acel;
roll_vel	= 5;
somb_scale	= .7;
somb_alpha	= .2;

xscale		= 1
face		= 0;
sprite		= sprite_index;
estado		= noone;
estado_txt	= "parado";

debug		= false;

npc_dialogo = noone;

attack = false;
shield = false;
roll   = false;

//Imagem atual da animação
image_ind = 0;
//Velocidade da animação
image_spd = 6 / room_speed;
//Quantdade de imagens na minha sprite
image_numb = 1;

sprites = [
			//Sprites parado
			[spr_player_idle_right, spr_player_idle_up, spr_player_idle_right, spr_player_idle_down],
			//Sprites correndo
			[spr_player_run_right, spr_player_run_up, spr_player_run_right, spr_player_run_down],
		  ];
		  
sprites_index = 0;

//Mapeando as teclas
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("J"), ord("C"));
keyboard_set_map(ord("L"), ord("Z"));
keyboard_set_map(ord("K"), ord("X"));
keyboard_set_map(vk_enter, vk_space);

ajusta_sprite = function(_indice_array)
{
	//Checando se a sub-imagem que estou usando é a sub-imagem que eu deveria estar usando
	//sprite parado
	//sprite ataque
	//Isso quer dizer que eu acabei de chegar nesse estado (se a minha sprite esta errada)
	if (sprite != sprites[_indice_array][face])
	{
		//Acabei de entrar no estado
		//Garantindo que a animação começa do começo
		image_ind = 0;
	}
	
	sprite = sprites[_indice_array][face];
	
	//Descobrindo o image_number da sprite que eu estou usando
	image_numb = sprite_get_number(sprite);
	
	//Aumentando o valor do image_ind com base na image_spd
	image_ind += image_spd;
	
	//Zerando o image_ind depois que a animação acabar
	image_ind %= image_numb;
}

controla_player = function()
{
	var _up		= keyboard_check(vk_up);
	var _down	= keyboard_check(vk_down);
	var _left	= keyboard_check(vk_left);
	var _right	= keyboard_check(vk_right);

	//Ajustando a face
	if (_up) face = 1;
	if (_down) face = 3;
	if (_left) {face = 2; xscale = -1; }
	if (_right) {face = 0; xscale = 1; }
	
	//Só faço isso se estou apertando alguma tecla
	if ((_up xor _down) or (_left xor _right))
	{
		//Descobrindo a direção que o player está indo
		var _dir = point_direction(0, 0, (_right - _left), (_down - _up));
	
		//Pegando o valor do velh 
		var _max_velh = lengthdir_x(max_vel, _dir);
		velh = lerp(velh, _max_velh, acel);
		//Pegando o valor do velv
		var _max_velv = lengthdir_y(max_vel, _dir);
		velv = lerp(velv, _max_velv, acel); 
	}
	else //Não estou apertando nenhuma tecla de movimento
	{
		velh = lerp(velh, 0, acel);
		velv = lerp(velv, 0, acel);
	}
}

estado_parado = function()
{
	controla_player();
	
	sprites_index = 0;
	estado_txt = "parado";
	velh = 0;
	velv = 0;
	
	var _up		= keyboard_check(vk_up);
	var _down	= keyboard_check(vk_down);
	var _left	= keyboard_check(vk_left);
	var _right	= keyboard_check(vk_right);
	
	//Definindo a Sprite correta
	ajusta_sprite(sprites_index);
	
	//Saindo do estado de parado (Indo para o movendo)
	if ((_up xor _down) or (_left xor _right))
	{
		estado = estado_movendo;
	}
	
	//Saindo do estado de parado (indo para o QUIZ)
	if (place_meeting(x,y,obj_objetos_pai))
	{
		var _space = keyboard_check_pressed(vk_space);
		liberado = instance_place(x,y,obj_objetos_pai);
	
		//Colocando sinal visual para poder interagi
		if (liberado.interagiu == false)
		{
			liberado.image_index = 3; //Colocando brilho
		}
		
		if (liberado.interagiu == false && _space)
		{
			estado = estado_quiz;	
		}
	}
	else
	{
		with(obj_objetos_pai)
		{
			if (interagiu == false)
			{
				image_index = 0;
			}
		}
	}
	//Saindo do estado de parado (indo para o ESC)
	if (!instance_exists(obj_dialogo) && !instance_exists(obj_painel_quiz))
	{
		if (keyboard_check(vk_escape))
		{
			estado = estado_esc;		
		}
	}
}

estado_movendo = function()
{
	controla_player();
	
	estado_txt = "movendo";
	sprites_index = 1;
	
	//Definindo a Sprite correta
	ajusta_sprite(sprites_index);
	
	//Ajustando a sombra
	//Checar se a imagem ta no chão
	if (clamp(image_ind, 1, 3) == image_ind)
	{
		//Estou no chão
		somb_scale = lerp(somb_scale, .7, .1);
	}
	else
		somb_scale = lerp(somb_scale, .4, .1);

	//Saindo do estado de movendo (indo para o Parado)
	if (abs(velv) <= 0.2 && abs(velh) <= 0.2)
	{
		estado = estado_parado;
		//Resetando sombra
		somb_scale = .7;
	}
	
	//Saindo do estado de movendo (indo para o QUIZ)
	if (place_meeting(x,y,obj_objetos_pai))
	{
		var _space = keyboard_check_pressed(vk_space);
		liberado = instance_place(x,y,obj_objetos_pai);
		
		//Colocando sinal visual para poder interagir
		if (liberado.interagiu == false)
		{
			liberado.image_index = 3; 
		} 
		
		if (liberado.interagiu == false && _space)
		{
			estado = estado_quiz;	
		}
	}
	else
	{
		with(obj_objetos_pai)
		{
			if (interagiu == false)
			image_index = 0;
		}
	}
}

estado_quiz = function()
{
	id_objeto = instance_place(x,y,obj_objetos_pai)
	//if (id_objeto.interagiu == false)
	//{
		estado_txt = "quiz"
		sprites_index = 0;
		velh = 0;
		velv = 0;
	
		//Definindo a Sprite correta
		ajusta_sprite(sprites_index);
	
		if (!instance_exists(obj_painel_quiz))
		{
			var _painel = instance_create_layer(room_width / 4, room_height / 4, "Quiz", obj_painel_quiz);
			_painel.image_xscale = 5;
			_painel.image_yscale = 5;
			_painel.id_obj = id_objeto;
		}
	//}
	
	//Saindo do estado de quiz
	if (id_objeto.interagiu == true)
	{
		//Destruindo paineis e botões
		instance_destroy(obj_botao_quiz);
		instance_destroy(obj_painel_quiz);
		instance_destroy(obj_botao_audio);
		//Liberando o acesso novamente
		quiz_inicio = false;
		//Resetando a margem "quiz_y"
		quiz_y = 10;
		estado = estado_parado;
	}
	
}


estado_dialogo = function()
{
	estado_txt = "Diálogo";
	velh = 0;
	velv = 0;
	face = 1;
	ajusta_sprite(0);
	
	//Criando o dialogo
	//Checando se ele ainda não existe!
	if (!instance_exists(obj_dialogo))
	{
		var _obj_dialogo = instance_create_depth(0, 0, 0, obj_dialogo);
		_obj_dialogo.player = id;
		
		//Passando o dialogo do NPC para o objeto dialogo
		with(npc_dialogo)
		{
			//Dialogo do objeto dialogo recebe o dialogo do NPC
			_obj_dialogo.dialogo = dialogo;
		}
	}
}


estado_game_over = function()
{
	
	//Temque ter um controle antes de instanciar os botoes para nao instanciar direto
	//Instanciar dois botoes, um para reiniciar outro para fexar o jogo!
	if (!instance_exists(obj_painel_game_over))
	{
		var _painel = instance_create_layer(room_width / 4, room_height / 4, "Quiz", obj_painel_game_over);
		_painel.image_xscale = 5;
		_painel.image_yscale = 4;
	}
	
}

estado_zerado = function()
{
	if (!instance_exists(obj_painel_fim))
	{
		var _painel = instance_create_layer(room_width / 4, room_height / 4, "Quiz", obj_painel_fim);
	}
}

estado_esc = function()
{
	//esc = true;
	estado_txt = "Esc";
	velh = 0;
	velv = 0;
	//face = 1;
	//ajusta_sprite(0);
	
	//Temque ter um controle antes de instanciar os botoes para nao instanciar direto
	//Instanciar dois botoes, um para reiniciar outro para fexar o jogo!
	if (!instance_exists(obj_painel_esc) && !instance_exists(obj_painel_quiz) && !instance_exists(obj_dialogo))
	{
		var _painel = instance_create_layer(room_width / 4, room_height / 4, "Quiz", obj_painel_esc);
		_painel.image_xscale = 5;
		_painel.image_yscale = 4;
	}
}

tempo = 0;

estado = estado_parado;





























