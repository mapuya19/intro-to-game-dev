/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(ord("R")))
	room_restart()
	
if (keyboard_check_pressed(ord("B")))
	global.simulation_speed /= 2

if (keyboard_check_pressed(ord("N")))
	global.simulation_speed *= 2