/// @description Check timers

//if (delete_timer >= 0) {
//	delete_timer -= 1;
//}

//if (delete_timer == 0) {
//	instance_destroy();
//}

if (sprite_index == spr_cloud_1) {
	if (alarm[1] < 0) {
		alarm[1] = room_speed * 4;
	}
} else if (sprite_index == spr_cloud_2) {
	if (alarm[2] < 0) {
		alarm[2] = room_speed * 4;
	}
} else if (sprite_index == spr_cloud_3) {
	if (alarm[3] < 0) {
		alarm[3] = room_speed * 4;
	}
}
 
