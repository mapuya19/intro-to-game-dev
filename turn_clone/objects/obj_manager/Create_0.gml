/// @description Create Deck

global.numcards = 12;
global.deck = ds_list_create();

var spacing = 10;
var card_object = obj_card // name of object in assets

for (i = 0; i < global.numcards; i++) {
	var newcard = instance_create_layer(x, y, "Instances", card_object);

	//newcard.face_index = floor(3 * i / global.numcards);// this will need some explaining
	newcard.card_type = choose(face_index.blue, face_index.purple, face_index.red)
	newcard.target_x = x;
	newcard.target_y = y - spacing * i;
	newcard.face_up = true;

	ds_list_add(global.deck, newcard);
}