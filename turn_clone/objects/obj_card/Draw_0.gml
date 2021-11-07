/// @description Draw Cards

if (face_up) {
	switch card_type {
		case face_index.rock:
			sprite_index = spr_rock;
			break;
	
		case face_index.paper:
			sprite_index = spr_paper;
			break;
	
		case face_index.scissors:
			sprite_index = spr_scissors;
			break;

	}
} else {
	sprite_index = spr_back;
}
	
draw_sprite(sprite_index, image_index, x, y)
