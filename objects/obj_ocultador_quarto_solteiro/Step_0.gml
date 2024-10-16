/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (global.interacao >= 15)
{
	image_alpha = lerp(image_alpha,0,.05)
	//instance_destroy(id);
	if (image_alpha <= 0)
	{
		instance_destroy(id);	
	}
}
