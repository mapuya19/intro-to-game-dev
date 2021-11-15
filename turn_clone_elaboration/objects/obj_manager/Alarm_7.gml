/// @description Wait reset deal

var card = ds_list_find_value(global.deck, global.deck_index - 1);

ds_list_add(global.reset_already, card);
global.deck_index--;
			
audio_play_sound(snd_flip, 5, false);
card.target_x = x;
card.target_y = 325 - (2 * global.cards_in_reset_already);
card.depth = -global.cards_in_reset_already;
card.face_up = false;	