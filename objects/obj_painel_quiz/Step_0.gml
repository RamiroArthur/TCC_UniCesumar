/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (quiz_inicio == false)
{
	for (var j = 1; j<array_length(id_obj.quiz); j++)
	{
		var _botao = instance_create_layer(room_width / 4 + 235, (room_height / 4) + quiz_y + 180, "Botoes", obj_botao_quiz);
		_botao.image_xscale = 4;
		quiz_y += 50;	
		_botao.texto = id_obj.quiz[j];
		_botao.resposta = id_obj.nome_de;
		_botao.obj_id = id_obj;
	}
	quiz_inicio = true;
}



