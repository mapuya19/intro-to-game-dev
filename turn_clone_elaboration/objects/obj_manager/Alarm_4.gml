/// @description Wait before resolve

var card = ds_list_find_value(global.deck, global.cards_in_discard);
ds_list_add(global.discard, card);
//cards_in_discard++;

audio_play_sound(snd_flip, 5, false);
card.target_x = 520;
card.target_y = 325 - (2 * global.cards_in_discard);
card.depth = -global.cards_in_discard;
card.face_up = true;