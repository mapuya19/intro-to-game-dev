// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DebugMovement(i, object)
{
	var gravity_string = "g:" + string(object.gravity_custom)
	var velocity_string = "v: <" + string(object.x_vel) + ", " + string(object.y_vel) + ">"
	draw_text(20, 20 * i, object_get_name(object) + gravity_string + " " + velocity_string)
}