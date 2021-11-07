/// @description FSM

var cards_in_hand = ds_list_size(global.hand);

switch(global.state) {
	case state.setup:
	    //deal three cards into 'hand' list and move to table
	    //var cards_in_hand = ds_list_size(global.hand);
	
	    if (cards_in_hand < 3) {
		    var card = global.deck[| cards_in_hand];
		    ds_list_add(global.hand, card);
		    card.target_x = room_width / 4 + cards_in_hand * 100;
		    card.target_y = room_height - 100;
			//Sleep(250);
	    } else {
			global.state = state.play;
	    }
	    break;

	case state.play:
		if (global.selected != noone && mouse_check_button_pressed(mb_left)) {
			//global.selected.face_up = true;
			global.selected.face_up = !global.selected.face_up;
			Sleep(250);
			break;
		}
		
		var cards_face_up = 0;
		
		//count face up cards first
		for (i = 0; i < cards_in_hand; i++) {
			var card = ds_list_find_value(global.hand, i);
			
			if (card.face_up) {
				cards_face_up++;
			}
		}
		
		//if there are two face up, flip them all back over
		if (cards_face_up >= 2) {
			show_debug_message(string(cards_face_up));
			//Sleep(250);
			
			for (i = 0; i < cards_in_hand; i++) {
				var card = ds_list_find_value(global.hand, i);
				card.face_up = false;
			}
		}
		
		// go to next state
		global.state = state.resolve;
		
		break;
	
	case state.resolve:
		//return all cards in 'hand' to deck
		//var cards_in_hand = ds_list_size(global.hand)
		
		for (i = 0; i < cards_in_hand; i++) {
			var card = ds_list_find_value(global.hand, i);
			card.face_up = false;
			ds_list_insert(global.deck, 0, card);
			card.target_x = x;
			card.target_y = y;
			//Sleep(250);
		}
		
		ds_list_clear(global.hand);
		global.state = state.setup;
		
		//if (cards_in_hand > 0) {
		//	var card = global.hand[| cards_in_hand - 1];
		//	//put on bottom
		//	ds_list_insert(global.deck, 0, card);
		//	card.target_x = x;
		//	card.target_y = y;
		//} else {
		//	//ds_list_clear(global.hand);
		//    global.state = state.setup
		//}
		break;
}