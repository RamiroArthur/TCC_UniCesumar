/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Instanciar 2 botoes_opcao um para reiniciar outro para sair do jogo
//Lembrar de controlar para nao instanciar vários

if (controla_botao == false)
{
	var cont = 0;
	repeat(2)
	{
		var _botao = instance_create_layer(room_width/2 - 100, room_height/2 + espaco, "Botoes", obj_botao_opcao);
		_botao.image_xscale = 3;
		espaco += 40;
		_botao.texto = texto_botao[cont];
		cont ++;
	}
	controla_botao = true;
}


//No obj_botao_opcao configurar o texto do primeiro e do segundo botao
//Configurar a função de cada botao por instancia


