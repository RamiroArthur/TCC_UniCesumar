/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Precisa identificar qual room que está para fazer o calculo com a variavel global correta da quantidade de itens

//SE ERRO 5 PONTOS aparecerá um menu par reiniciar ou sair do jogo!
if (global.erros >= 5) //Aqui colocar um valor calculado com base na quantidade de itens do level
{
	//Acessar o player e coloca-lo em estado de parado!
	with(obj_player)
	{
		estado = estado_game_over;	
	}	
}

if (global.interacao == 35)
{
	with(obj_player)
	{
		estado = estado_zerado;	
	}
}


