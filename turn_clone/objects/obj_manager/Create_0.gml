/// @description Create Deck
randomize();

global.numcards = 24;
global.deck_index = 0;

global.player_card = noone;
global.cpu_card = noone;

global.hover = false;

global.player_selected = false;
global.player_flipped = false;
global.cpu_choose = false;
global.cpu_flipped = false;
global.score_updated = false;

global.is_shuffled = false;

global.deck = ds_list_create();
global.discard = ds_list_create();

global.hand = ds_list_create();
global.cpu = ds_list_create();

global.reset_already = ds_list_create();
global.repos_already = ds_list_create();

enum state {
	setup_player,
	setup_cpu,
	play,
	flip_score,
	resolve,
	reset,
}

global.state = state.setup_cpu;

var spacing = 2;
var card_object = obj_card // name of object in assets

for (i = 0; i < global.numcards; i++) {
	var newcard = instance_create_layer(x, y, "Instances", card_object);

	newcard.card_type = choose(face_index.rock, face_index.paper, face_index.scissors)
	newcard.target_x = x;
	newcard.target_y = y + (spacing * i);
	newcard.depth = i;
	newcard.face_up = false;

	ds_list_add(global.deck, newcard);
}