/// @description Draw Score

draw_set_font(fnt_main);

draw_set_halign(fa_left);
draw_text_transformed_colour(10, 10, score_cpu, 3, 3, 0, c_white, c_white, c_white, c_white, 1);

draw_set_halign(fa_left);
draw_text_transformed_colour(10, 650, score_player, 3, 3, 0, c_white, c_white, c_white, c_white, 1);

