/// @description Wait for cpu deal
//var cards_in_cpu = ds_list_size(global.cpu);

var card = ds_list_find_value(global.deck, global.deck_index);
ds_list_add(global.cpu, card);
global.deck_index++;

audio_play_sound(snd_flip, 5, false);
card.target_x = room_width / 3 + global.cards_in_cpu * 100;
card.target_y = 100;