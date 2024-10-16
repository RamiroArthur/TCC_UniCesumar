/// @description Iniciando variáveis
// You can write your code in this editor

seque_dialogo = 0;

//Criando a base do meu dialogo
dialogo = 
{
	texto   : ["Bem vindo ao protótipo do Game, para desenvolver seu vocabulário em Alemão! Fico feliz em te ver!", "O que eu preciso fazer??", "Basta se aproximar dos itens do cenário que estão preto e branco, e quando aparecer uma estrela sobre ele, pressione [ESPAÇO] ou [EMTER] para abrir o QUIZ de cada um...!", "Entendido...",  "Lembre-se, você precisa interagir com todos os itens descoloridos do cenário para que a porta da casa se abra e voce possa avançar para o próximo nível!!", "Certo!", "E atenção!!! Se você cometer 5 erros terá que recomeçar. Caso quiser sair do jogo a qualquer momento podera pressionar [ESC] e selecionar a opção 'Sair' Boa sorte!!"],
	retrato : [spr_retrato_npc, spr_retrato_player,spr_retrato_npc, spr_retrato_player, spr_retrato_npc, spr_retrato_player, spr_retrato_npc],
	txt_vel : .3
}

larg	= 30	
alt		= 20;
margem	= 5;

//Area do dialogo
dialogo_area = function()
{
	var _y = bbox_bottom + margem;
	var _player = obj_player;
	
	//image_blend = c_white; //debug
	//Se o player esta colidindo na área

	
		//image_blend = c_red; //debug
		//Se eu apertar [ESPAÇO] ou [EMTER] o player vai entrar no estado de dialogo
			if (global.acertos == 0 && seque_dialogo == 0)
			{
			
				with(_player)
				{
					//Vai para o estado de dialogo
					estado = estado_dialogo;
				
					//Passando quem é o NPC desse diálogo
					npc_dialogo = other.id;
				}
				seque_dialogo = 1;
			}
		
		if (keyboard_check_pressed(vk_escape))
		{
			_player.estado = _player.estado_parado;
		}
	
}


