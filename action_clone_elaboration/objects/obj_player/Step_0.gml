/// @description Main player interactions

// Depth updates
depth = -y;

// Movement
var dt = delta_time / 1000000;

if (_playerNumber == 0) {
	_accelx = DirX(_keyLeft, _keyRight) * _inputForceX * dt;
} else {
	_accelx = OtherDirX(_keyLeft, _keyRight) * _inputForceX * dt;
}

_accely = _gravity * dt;

_velX += _accelx;
_velY += _accely;

// Update sprites based on velocity
if (_playerNumber == 0) {
	if (_velY < 0) {
		sprite_index = spr_player_orange_pop;
	} else if (is_hit == true) {
		sprite_index = spr_player_orange_hit;
	} else {
		sprite_index = spr_player_orange_fall;
	}
} else {
	if (_velY < 0) {
		sprite_index = spr_player_green_pop;
	} else if (is_hit == true) {
		sprite_index = spr_player_green_hit;
	} else {
		sprite_index = spr_player_green_fall;
	}
}

// Wall bounce
if ((((x - sprite_width) / 2) < (0 - (sprite_width / 2))) || (x > room_width)) {
	if (_velX < 0) {
		x = x + (sprite_width / 3);
	} else {
		x = x - (sprite_width / 3);
	}
	
	if (!(y > room_height)) {
		audio_play_sound(snd_border, 9, false);
	}
	
	_velX *= -0.7;
}

// Cloud Interaction
var new_x = x + _velX;
var new_y = y + _velY;

if (_velY > 0 && is_hit == false) {
	if (place_meeting(new_x, new_y, obj_cloud)) {
		var instance = instance_place(new_x, new_y, obj_cloud);
		
		if ((bbox_top < instance.bbox_top) && (instance.image_index != 1)) {
			audio_play_sound(snd_cloud_bounce, 10, false);
			_velY = -22;
			new_y = y + _velY;
			instance.image_index = 1;
		}
		
		instance.alarm[0] = 30;
	}
}

//x = new_x;
//y = new_y;

// Player Collision
//var new_x = x + _velX;
//var new_y = y + _velY;

if (_velY > 0) {
	if(_playerNumber == 0) {
		if (place_meeting(x, y, obj_player_green) && obj_player_green.is_hit == false && is_hit == false) {
			if (bbox_top > obj_player_green.bbox_top) {
				obj_player_green.is_hit = true;
				obj_manager.score_one += 1;
				audio_play_sound(snd_hit, 10, false);
				
				_velY = -15;
				new_y = y + _velY;
				
				var instance = instance_create_layer(x, y, "Instances", obj_sparks);
				instance.alarm[0] = room_speed * 0.5
			} 
		}
	} else {
		if (place_meeting(x, y, obj_player_orange) && obj_player_orange.is_hit == false && is_hit == false) {
			if (bbox_top > obj_player_orange.bbox_top) {
				obj_player_orange.is_hit = true;
				obj_manager.score_two += 1;
				audio_play_sound(snd_hit, 10, false);
				
				_velY = -15;
				new_y = y + _velY;
				
				var instance = instance_create_layer(x, y, "Instances", obj_sparks);
				instance.alarm[0] = room_speed * 0.5;
			} 
		}
	}
}


x = new_x;
y = new_y;

// Draw Sparks
if (y > room_height) {
	var instance = instance_create_layer(x, y, "Instances", obj_sparks);
	instance.alarm[0] = room_speed * 0.5;
}

// Respawn
if (y > room_height + sprite_height / 2) {
	
	if (alarm[0] < 0) {
		alarm[0] = room_speed * 3;
	}
}

// Update Score
if (y > room_height && score_done == false) {
	if (first_start != true) {
		audio_play_sound(snd_minus, 10, false);
	}
	
	if(_playerNumber == 0) {
		obj_manager.score_one -= 1;
		score_done = true;
		is_hit = false;
	} else {
		obj_manager.score_two -= 1;
		score_done = true;
		is_hit = false;
	}
}
