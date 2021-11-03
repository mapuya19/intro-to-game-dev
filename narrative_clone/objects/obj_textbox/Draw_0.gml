/// @description Insert description here
// You can write your code in this editor

//draw textbox
draw_sprite(spr_textbox, 0, x, y);


//draw 
draw_set_font(fnt_gotham);
draw_text_ext(x, y, text, stringHeight, boxWidth);