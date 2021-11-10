/// @description Wait for player deal
//var cards_in_hand = ds_list_size(global.hand);

var card = ds_list_find_value(global.deck, global.deck_index);
ds_list_add(global.hand, card);
global.deck_index++;

audio_play_sound(snd_flip, 5, false);
card.target_x = room_width / 3 + global.cards_in_hand * 100;
card.target_y = room_height - 100;
