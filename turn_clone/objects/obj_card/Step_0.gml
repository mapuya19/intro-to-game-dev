/// @description Move target pos

x = lerp(target_x, x, 0.9);
y = lerp(target_y, y, 0.9);

if (position_meeting(mouse_x, mouse_y, obj_card) && (mouse_y > 500)) {
	global.nearest_to_mouse = instance_nearest(mouse_x, mouse_y, obj_card);
} else {
	global.nearest_to_mouse = noone;
}
