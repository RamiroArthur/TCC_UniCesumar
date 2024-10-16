/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_self();

draw_set_valign(1);
draw_set_halign(1);
draw_set_color(c_black);

draw_set_font(fnt_game_over);

draw_text(x,y,funcao);
draw_text_transformed(room_width/2, room_height/3 - 100, "Protótipo: Teste de Vocabulario de Alemão",1.3,1.3,0);

draw_set_color(-1);
draw_set_font(-1);
draw_set_valign(-1);
draw_set_halign(-1);

