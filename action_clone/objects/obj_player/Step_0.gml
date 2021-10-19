/// @description Main player interactions

// One way collision
//if CollideY(obj_cloud, phy_position_y + phy_speed_y) {
//	phy_speed_y *= -1;
//}

//y += _gravity * delta_time / 1000000;
////y += gravity;

//var dX = DirX();
//var dY = DirY() + _gravity * delta_time / 1000000;

//var validX = CollideX(obj_solid, _speed * dX)
//var validY = y + dYl

//if (dY > 0) {
//	validY = CollideY(obj_cloud, _speed * dY);
//}

//x = validX;
//y = validY;

// Movement using positional derivatives and integration
var dt = delta_time / 1000000;

if (_playerNumber == 0) {
	_accelx = DirX(_keyLeft, _keyRight) * _inputForceX * dt;
} else {
	_accelx = OtherDirX(_keyLeft, _keyRight) * _inputForceX * dt;
}


_accely = _gravity * dt;

_velX += _accelx;
_velY += _accely;

// Wall bounce
if (x - sprite_width / 2 < 0 || x + sprite_width / 2 > room_width) {
	if (_velX > 0) {
		x = room_width - sprite_width;
	} else {
		x = sprite_width;
	}
	
	_velX = 0.3;
}
	
if (_topCollision && y - sprite_height / 2 < 0) {
	if (_velY > 0) {
		y = room_height - sprite_height;
	} else {
		y = sprite_height;
	}
	
	_velY *= -1 * _restitution;
}

var new_x = x + _velX;
var new_y = y + _velY;

if (_velY > 0) {
	if (place_meeting(new_x, new_y, obj_cloud)) {
		_velY *= -1;
		new_y = y + _velY;
		var instance = instance_nearest(new_x, new_y, obj_cloud);
		instance.image_index = 1;
		instance.alarm[0] = 30;
	}
}

x = new_x;
y = new_y;

if (y > room_height) {
	if(_playerNumber == 0) {
		obj_manager.score_one -= 1;
	} else {
		obj_manager.score_two -= 1;
	}
	
	//_velX = random_range(0, 1);
	//_velY = -15;

	//x = random(1.0) * room_width;
	//y = room_height;
}

if (y > room_height) {
	_accelx = 0;
	_accely = 0;

	_velX = random_range(0, 1);
	_velY = -30;

	x = random(1.0) * room_width;
	y = room_height;
}