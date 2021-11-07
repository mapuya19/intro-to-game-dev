/// @description Create Deck
randomize(); 

global.numcards = 12;
global.deck = ds_list_create();
global.hand = ds_list_create();

enum state {
	setup,
	play,
	resolve
}

global.state = state.setup;

var spacing = 2;
var card_object = obj_card // name of object in assets

for (i = 0; i < global.numcards; i++) {
	var newcard = instance_create_layer(x, y, "Instances", card_object);

	newcard.card_type = choose(face_index.rock, face_index.paper, face_index.scissors)
	newcard.target_x = x;
	newcard.target_y = y - (spacing * i);
	newcard.face_up = false;

	ds_list_add(global.deck, newcard);
}