/// @description Scoring

draw_set_font(fnt_main);

var window_width = window_get_width();

draw_set_halign(fa_left);
draw_text_transformed_colour(10, 10, score_one, 3, 3, 0, c_red, c_red, c_maroon, c_maroon, 1);
draw_text_transformed_colour(10, 50, obj_player_green.y, 3, 3, 0, c_red, c_red, c_maroon, c_maroon, 1);

draw_set_halign(fa_right);
draw_text_transformed_colour(window_width - 10, 10, score_two, 3, 3, 0, c_lime, c_lime, c_green, c_green, 1);
draw_text_transformed_colour(window_width - 10, 50, obj_player_orange.y, 3, 3, 0, c_red, c_red, c_maroon, c_maroon, 1);
