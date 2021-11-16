/// @description Draw card

if (face_up) {
	switch card_type {
		case button_index.even:
			sprite_index = spr_even;
			break;
	
		case button_index.odd:
			sprite_index = spr_odd;
			break;
	}
} else {
	sprite_index = spr_back;
}

draw_sprite(sprite_index, image_index, x, y);
