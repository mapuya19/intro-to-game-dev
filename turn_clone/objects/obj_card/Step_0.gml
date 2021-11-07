/// @description Move target pos

x = lerp(target_x, x, 0.5);
y = lerp(target_y, y, 0.5);

if (position_meeting(mouse_x, mouse_y, obj_card)) {
	global.selected = instance_nearest(mouse_x, mouse_y, obj_card);
} else {
	global.selected = noone;
}