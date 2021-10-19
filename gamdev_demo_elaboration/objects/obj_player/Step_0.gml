/// @description Insert description here
// You can write your code in this editor
depth = -y

var cwidth = camera_get_view_width(view_camera[0]);
var cheight = camera_get_view_height(view_camera[0]);

camera_set_view_pos(view_camera[0], x - (cwidth / 2), y - (cheight / 2));

right = keyboard_check(vk_left) || keyboard_check(ord("A"))
left = keyboard_check(vk_right) || keyboard_check(ord("D"))
up = keyboard_check(vk_up) || keyboard_check(ord("W"))
down = keyboard_check(vk_down) || keyboard_check(ord("S"))

if has_pwr = true {
	my_speed = 3;
}

hMove = (left - right) * my_speed;
vMove = (down - up) * my_speed;

if(right) {
	image_speed = 0.5
	sprite_index = spr_player_left;
}

if(left) {
	image_speed = 0.5
	sprite_index = spr_player_right;
}

if(up) {
	image_speed = 0.5
	sprite_index = spr_player_up;
}

if(down) {
	image_speed = 0.5
	sprite_index = spr_player_default;
}

if (keyboard_check(vk_nokey)) {
	image_speed = 0;
	image_index = 0;
}

// Orange Dialogue
if(point_distance(x, y, obj_circle_orange.x, obj_circle_orange.y) < 30) {
	if (orange_textbox == noone && keyboard_check_pressed(vk_space)) {
		audio_play_sound(snd_interact, 10, false);
		orange_textbox = instance_create_layer(obj_player.x - 250, obj_player.y - 175, "Text", obj_textbox);
		if (has_key != true) {
			obj_textbox.text = "The key is some way to the east of here. I think there may be something useful to the west as well."
		}

		if (has_key == true) {
			obj_textbox.text = "Great, my friend will tell you how to escape this place. Maybe I'll come with you next time. Oh, be sure to grab the item in the west if you haven't already."
		}
	}
}

if (point_distance(x, y, obj_circle_orange.x, obj_circle_orange.y) > 30){
	if (orange_textbox != noone) {
		instance_destroy(orange_textbox);
		orange_textbox = noone;
	}
}

// Cyan Dialogue
if(point_distance(x, y, obj_circle_cyan.x, obj_circle_cyan.y) < 30) {
	if (blue_textbox == noone && keyboard_check_pressed(vk_space)) {
		audio_play_sound(snd_interact, 10, false);
		blue_textbox = instance_create_layer(obj_player.x - 250, obj_player.y - 175, "Text", obj_textbox);
		if (has_key == true) {
			obj_textbox.text = "The exit is north of here, hidden behind a bush. Go on ahead without me, I'll wait here for the next visitor."
		}
	}
}

if (point_distance(x, y, obj_circle_cyan.x, obj_circle_cyan.y) > 30){
	if (blue_textbox != noone) {
		instance_destroy(blue_textbox);
		blue_textbox = noone;
	}
}

// Horizontal Collision
if(place_meeting(x+hMove, y, obj_circle_orange)){
	while(!place_meeting(x+sign(hMove), y, obj_circle_orange)){
		x += sign(hMove);
	}
	hMove=0;
}

if(place_meeting(x+hMove, y, obj_circle_cyan)){
	while(!place_meeting(x+sign(hMove), y, obj_circle_cyan)){
		x += sign(hMove);
	}
	hMove=0;
}

if(place_meeting(x+hMove, y, obj_botwall_1)){
	while(!place_meeting(x+sign(hMove), y, obj_botwall_1)){
		x += sign(hMove);
	}
	hMove=0;
}

if(place_meeting(x+hMove, y, obj_botwall_2)){
	while(!place_meeting(x+sign(hMove), y, obj_botwall_2)){
		x += sign(hMove);
	}
	hMove=0;
}

if(place_meeting(x+hMove, y, obj_top_wall)){
	while(!place_meeting(x+sign(hMove), y, obj_top_wall)){
		x += sign(hMove);
	}
	hMove=0;
}

if(place_meeting(x+hMove, y, obj_left_wall)){
	while(!place_meeting(x+sign(hMove), y, obj_left_wall)){
		x += sign(hMove);
	}
	hMove=0;
}

if(place_meeting(x+hMove, y, obj_right_wall)){
	while(!place_meeting(x+sign(hMove), y, obj_right_wall)){
		x += sign(hMove);
	}
	hMove=0;
}


// Vertical Collision
if(place_meeting(x, y+vMove, obj_circle_orange)){
	while(!place_meeting(x, y+sign(vMove), obj_circle_orange)){
		y += sign(vMove);
	}
	vMove=0
}

if(place_meeting(x, y+vMove, obj_circle_cyan)){
	while(!place_meeting(x, y+sign(vMove), obj_circle_cyan)){
		y += sign(vMove);
	}
	vMove=0
}

if(place_meeting(x, y+vMove, obj_botwall_1)){
	while(!place_meeting(x, y+sign(vMove), obj_botwall_1)){
		y += sign(vMove);
	}
	vMove=0
}

if(place_meeting(x, y+vMove, obj_botwall_2)){
	while(!place_meeting(x, y+sign(vMove), obj_botwall_2)){
		y += sign(vMove);
	}
	vMove=0
}

if(place_meeting(x, y+vMove, obj_top_wall)){
	while(!place_meeting(x, y+sign(vMove), obj_top_wall)){
		y += sign(vMove);
	}
	vMove=0
}

if(place_meeting(x, y+vMove, obj_left_wall)){
	while(!place_meeting(x, y+sign(vMove), obj_left_wall)){
		y += sign(vMove);
	}
	vMove=0
}

if(place_meeting(x, y+vMove, obj_right_wall)){
	while(!place_meeting(x, y+sign(vMove), obj_right_wall)){
		y += sign(vMove);
	}
	vMove=0
}

if(place_meeting(x, y+vMove, obj_door) && (obj_player.has_key == false)){
	while(!place_meeting(x, y+sign(vMove), obj_door)){
		y += sign(vMove);
	}
	vMove=0
}

x += hMove;
y += vMove;
