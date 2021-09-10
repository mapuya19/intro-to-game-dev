/// @description Insert description here
// You can write your code in this editor
var cwidth = camera_get_view_width(view_camera[0]);
var cheight = camera_get_view_height(view_camera[0]);

camera_set_view_pos(view_camera[0], x - (cwidth / 2), y - (cheight / 2));

if (place_meeting(x, y, obj_bush)) {
	x = 0;
	y = 0;
}