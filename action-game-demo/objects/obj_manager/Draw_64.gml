/// @description Insert description here
// You can write your code in this editor
var players = instance_number(obj_player)

for (var i = 0; i < players; i++)
{
	DebugMovement(i, instance_find(obj_player, i))
}

draw_text(room_width - 150, 10, "SIM RATE: " + string(global.simulation_speed))
draw_text(room_width - 150, 30, "FPS: " + string(fps))