/// @description Check for restart and camera stuff

if (keyboard_check(ord("R"))) {
	room_restart();
}

// Camera Stuff -> Players can go out of frame
mean_x = round((obj_player_orange.x + obj_player_green.x) / 2);
mean_y = round((obj_player_orange.y + obj_player_green.y) / 2);


_vx = mean_x - (camera_get_view_width(view_camera[0]) / 2);
_vy = mean_y - (camera_get_view_height(view_camera[0]) / 2);


_vx = clamp(_vx, 0, room_width - camera_get_view_width(view_camera[0]));
_vy = clamp(_vy, 0, room_height - camera_get_view_height(view_camera[0]));

camera_set_view_pos(view_camera[0], _vx, _vy);