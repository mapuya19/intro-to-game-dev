/// @description Wait repositon

if (global.is_shuffled == false) {
	ds_list_shuffle(global.deck);
	global.is_shuffled = true;
} 
			
if (global.is_shuffled == true) {
	var card = ds_list_find_value(global.deck, global.deck_index);
				
	ds_list_add(global.repos_already, card);
	global.deck_index++;
	
	audio_play_sound(snd_flip, 5, false);
	card.target_x = x;
	card.target_y = y + (2 * global.cards_in_repos_already);
	card.depth = global.cards_in_repos_already;
} 