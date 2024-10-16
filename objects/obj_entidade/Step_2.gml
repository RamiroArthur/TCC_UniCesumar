/// @description Insert description here
// You can write your code in this editor

ajusta_depth();

//Usar as variáveis de movimento para mover e colidir
//Colisão horizontal
var _chao = instance_place(x + velh, y, obj_chao);
if (_chao)
{
	if (velh > 0)
	{
		//Estou indo para a direita
		//Eu vou grudar na esquerda do chao
		x = _chao.bbox_left + (x - bbox_right);
	}
	else if (velv < 0)  //Para a esquerda
	{
		x = _chao.bbox_right + (x - bbox_left);
	}
	
	//Zerar a minha velocidade horizontal
	velh = 0;
}

x += velh;

//Colisão vertical
_chao = instance_place(x, y + velv, obj_chao);
if (_chao) //Se eu colidi com o chao
{
	//Checando se estou descendo ou subindo
	if (velv > 0) //Descendo
	{
		//Eu vou grudar na parte de cima do chao
		y = _chao.bbox_top + (y - bbox_bottom); //Depende da origem da sprite
	}
	else if (velv < 0) //Subindo (se for 0 não quero que ele faça nada)
	{
		y = _chao.bbox_bottom + (y - bbox_top); //Depende da origem da sprite
	}
	
	//Zerar a minha velocidade horizontal depois que colidir
	velv = 0;
}
	
y += velv;



