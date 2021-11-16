/// @description FSM
var cards_in_hand = ds_list_size(global.hand);
var cards_in_cpu = ds_list_size(global.cpu);
var cards_in_discard = ds_list_size(global.discard);
var cards_in_reset_already = ds_list_size(global.reset_already);
var cards_in_repos_already = ds_list_size(global.repos_already);
var cpu_flip = global.cpu_flipped;

global.cards_in_hand = ds_list_size(global.hand);
global.cards_in_cpu = ds_list_size(global.cpu);
global.cards_in_discard = ds_list_size(global.discard);
global.cards_in_reset_already = ds_list_size(global.reset_already);
global.cards_in_repos_already = ds_list_size(global.repos_already);


switch(global.state) {
	case state.setup_cpu:
		// deal three cards to cpu and move to table
		
		if (cards_in_cpu < 3) {
			if (alarm[0] < 0) {
				alarm[0] = room_speed * 0.3;
			}
	    } else {
			global.state = state.setup_player;
	    }
	    break;
	
	case state.setup_player:
	    //deal three cards to player and move to table
	    if (cards_in_hand < 3) {
			if (alarm[1] < 0) {
				alarm[1] = room_speed * 0.3;
			}
	    } else {
			//global.state = state.play;
			if (alarm[6] < 0) {
				alarm[6] = room_speed * 1;
			}
	    }
	    break;

	case state.play:
		// turn player cards face up
		if (global.player_flipped == false) {
			for (i = 0; i < cards_in_hand; i++) {
				var card = ds_list_find_value(global.hand, i);
				card.face_up = true;
			}
			
			audio_play_sound(snd_flip, 5, false);
			global.player_flipped = true;
		}
		
		// cpu select and move card
		if (global.cpu_choose == false) {
			if (alarm[2] < 0) {
				alarm[2] = room_speed * 0.85;
			}
		}
		
		// player hover and move card
		if (global.player_selected == false && global.hover == false && global.cpu_choose == true && global.nearest_to_mouse != noone && position_meeting(mouse_x, mouse_y, global.nearest_to_mouse)) {
			global.hover = true;
			global.saved_hover = global.nearest_to_mouse.target_y;
			global.nearest_to_mouse.target_y = global.nearest_to_mouse.target_y - 15;
		}
		
		if (global.player_selected == false && global.hover == true && global.cpu_choose == true && global.nearest_to_mouse != noone && !position_meeting(mouse_x, mouse_y, global.nearest_to_mouse)) {
			global.nearest_to_mouse.target_y = global.saved_hover;
			global.hover = false;
		}
	
		// player select and move card
		if (global.player_selected == false && global.cpu_choose == true && global.nearest_to_mouse != noone && mouse_check_button_pressed(mb_left)) {
			global.player_card = global.nearest_to_mouse;
			global.nearest_to_mouse.target_x = room_width / 2;
			global.nearest_to_mouse.target_y = global.nearest_to_mouse.target_y - 150;
			
			audio_play_sound(snd_flip, 5, false);
			global.player_selected = true;
		}
		
		//flip cpu card and check who wins the round
		if (global.player_selected == true && global.cpu_choose == true && global.nearest_to_mouse != noone && global.cpu_card != noone) {
			global.state = state.flip_score;
		}
		
		break;
		
	case state.flip_score:
		if (cpu_flip == false) {
			// flip card
			if (alarm[3] < 0) {
				alarm[3] = room_speed * 2;
			} 
			
			// update score
			if (global.cpu_card.face_up == true) {
				var card_one = global.player_card;
				var card_two = global.cpu_card;
				
				if ((card_one.card_type == face_index.rock && card_two.card_type == face_index.paper)
			    || (card_one.card_type == face_index.rock && card_two.card_type == face_index.spock)
			    || (card_one.card_type == face_index.paper && card_two.card_type == face_index.scissors)
			    || (card_one.card_type == face_index.paper && card_two.card_type == face_index.lizard)
			    || (card_one.card_type == face_index.scissors && card_two.card_type == face_index.rock)
			    || (card_one.card_type == face_index.scissors && card_two.card_type == face_index.spock)
			    || (card_one.card_type == face_index.lizard && card_two.card_type == face_index.rock)
			    || (card_one.card_type == face_index.lizard && card_two.card_type == face_index.scissors)
			    || (card_one.card_type == face_index.spock && card_two.card_type == face_index.lizard)
			    || (card_one.card_type == face_index.spock && card_two.card_type == face_index.paper)) {
					// player lost round
					if (global.score_updated == false) {
						obj_score.score_cpu++;
						audio_play_sound(snd_lose, 5, false);
						global.score_updated = true;
					}
				} else {
					if ((card_two.card_type == face_index.rock && card_one.card_type == face_index.paper)
				    || (card_two.card_type == face_index.rock && card_one.card_type == face_index.spock)
				    || (card_two.card_type == face_index.paper && card_one.card_type == face_index.scissors)
				    || (card_two.card_type == face_index.paper && card_one.card_type == face_index.lizard)
				    || (card_two.card_type == face_index.scissors && card_one.card_type == face_index.rock)
				    || (card_two.card_type == face_index.scissors && card_one.card_type == face_index.spock)
				    || (card_two.card_type == face_index.lizard && card_one.card_type == face_index.rock)
				    || (card_two.card_type == face_index.lizard && card_one.card_type == face_index.scissors)
				    || (card_two.card_type == face_index.spock && card_one.card_type == face_index.lizard)
				    || (card_two.card_type == face_index.spock && card_one.card_type == face_index.paper)) {
						//player won round
						if (global.score_updated == false) {
							obj_score.score_player++;
							audio_play_sound(snd_win, 5, false);
							global.score_updated = true;
						}
					} else {
						global.state = state.tie;
					}
				}
				
				global.cpu_flipped = true;
			}
		} else {	
			if (alarm[5] < 0) {
				alarm[5] = room_speed * 2.5;
			} 
		}
				
		break;
	
	case state.tie:
		if (global.darken_created == false) {
			var darken = instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_darken);
			audio_play_sound(snd_tie_music, 5, true);
			global.darken = darken;
			darken.depth = -y
			global.darken_created = true;
		}
			
		if (global.even_created == false) {
			var even_card = instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_button);
			global.even = even_card;
			even_card.card_type = button_index.even;
			even_card.target_x = room_width / 3 + 0 * 100;
			even_card.target_y = room_height / 2;
			even_card.depth = darken.depth - 100;
			global.even_created = true;
		}
			
		if (global.odd_created == false) {
			var odd_card = instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_button);
			global.odd = odd_card;
			odd_card.card_type = button_index.odd;
			odd_card.target_x = room_width / 3 + 2 * 100;
			odd_card.target_y = room_height / 2;
			odd_card.depth = darken.depth - 100;
			global.odd_created = true;
		}
			
		// hover and move button
		if (global.button_hover == false && global.even_created == true && global.odd_created == true && global.nearest_button != noone && position_meeting(mouse_x, mouse_y, global.nearest_button)) {
			global.button_hover = true;
			global.saved_button_hover = global.nearest_button.target_y;
			global.nearest_button.target_y = global.nearest_button.target_y - 15;
		}
		
		if (global.button_hover == true && global.even_created == true && global.odd_created == true && global.nearest_button != noone && !position_meeting(mouse_x, mouse_y, global.nearest_button)) {
			global.nearest_button.target_y = global.saved_button_hover;
			global.button_hover = false;
		}
	
		// player select and update score
		if (global.button_selected == false && global.even_created == true && global.odd_created == true && global.nearest_button != noone && mouse_check_button_pressed(mb_left)) {
			global.the_button = global.nearest_button;
			
			var button_display = instance_create_layer(0, 0, "Instances", obj_button_display);
			global.button_display = button_display;
				
			var numberMatch = irandom_range(1, 9);
			button_display.generated_num = numberMatch;
			audio_stop_sound(snd_tie_music);
	
				
			if (((global.the_button.card_type == button_index.even) && (numberMatch % 2 == 0)) || ((global.the_button.card_type == button_index.odd) && (numberMatch % 2 == 1))) {
				//player won round
				if (global.score_updated == false) {
					obj_score.score_player++;
					audio_play_sound(snd_win, 5, false);
					global.score_updated = true;
				}
			} else {
				// cpu won round
				if (global.score_updated == false) {
					obj_score.score_cpu++;
					audio_play_sound(snd_lose, 5, false);
					global.score_updated = true;
				}
			}
			

			if (alarm[9] < 0) {
				alarm[9] = room_speed * 2.5;
			}
		}
		
		if (global.button_selected == true) {
			instance_destroy(global.darken);
			instance_destroy(global.even);
			instance_destroy(global.odd);
			instance_destroy(global.button_display);
			global.state = state.resolve;
		}
		
	
		break;
	
	case state.resolve:
		// move old cards to discard
		if (cards_in_discard < global.deck_index) {
			if (alarm[4] < 0) {
				alarm[4] = room_speed * 0.3;
			}
		} 
		
		// if no more in deck, reset
		else if (cards_in_discard == global.numcards) {
			global.state = state.reset;
		} 
		
		// clear table and start new round
		else {
			ds_list_clear(global.hand);
			ds_list_clear(global.cpu);
				
			alarm[0] = -1;
			alarm[1] = -1;
			alarm[2] = -1;
			alarm[3] = -1;
			alarm[4] = -1;
			alarm[5] = -1;
			alarm[9] = -1;
			
			global.player_card = noone;
			global.cpu_card = noone;
			global.nearest_to_mouse = noone;
			
			global.the_button = noone;
			global.button_hover = false;
			global.darken_created = false;
			global.even_created = false;
			global.odd_created = false;
			global.button_selected = false;
			
			global.player_selected = false;
			global.player_flipped = false;
			global.cpu_choose = false;
			global.cpu_flipped = false;
			global.score_updated = false;
		
			global.state = state.setup_cpu;
		}
			
		break;
		
	case state.reset:
		// move discard pile back to left side
		if (cards_in_reset_already < 24) {
			if (alarm[7] < 0) {
				alarm[7] = room_speed * 0.025;
			}
	    }
		
		// shuffle cards and update positions
		if (cards_in_reset_already == 24 && cards_in_repos_already < 24) {
			if (alarm[8] < 0) {
				alarm[8] = room_speed * 0.025;
			}
		} 
		
		// reset all values and start again
		if (cards_in_reset_already == 24 && cards_in_repos_already == 24)  {
			global.deck_index = 0;
				
			alarm[0] = -1;
			alarm[1] = -1;
			alarm[2] = -1;
			alarm[3] = -1;
			alarm[4] = -1;
			alarm[5] = -1;
			alarm[9] = -1;
			
			global.player_card = noone;
			global.cpu_card = noone;
			global.nearest_to_mouse = noone;
			
			global.the_button = noone;
			global.button_hover = false;
			global.darken_created = false;
			global.even_created = false;
			global.odd_created = false;
			global.button_selected = false;
			
			global.player_selected = false;
			global.player_flipped = false;
			global.cpu_choose = false;
			global.cpu_flipped = false;
			global.score_updated = false;
			global.is_shuffled = false;
				
			ds_list_clear(global.discard);
			ds_list_clear(global.hand);
			ds_list_clear(global.cpu);
			ds_list_clear(global.reset_already);
			ds_list_clear(global.repos_already);

			cards_in_cpu = 0;
			cards_in_hand = 0;
			cards_in_discard = 0;
			cards_in_reset_already = 0;
			cards_in_repos_already = 0;
			
			global.state = state.setup_cpu;
		}
			
		break;
}