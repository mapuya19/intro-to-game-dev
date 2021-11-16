/// @description Move target pos

x = lerp(target_x, x, 0.9);
y = lerp(target_y, y, 0.9);

if (position_meeting(mouse_x, mouse_y, obj_button)) {
	global.nearest_button = instance_nearest(mouse_x, mouse_y, obj_button);
} else {
	global.nearest_button = noone;
}
