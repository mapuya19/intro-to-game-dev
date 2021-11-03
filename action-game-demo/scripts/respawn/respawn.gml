// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function respawn()
{
	var dt = delta_time / 1000000
	x_vel = random_range(-1, 1) * 50 * dt
	y_vel = -1 * random_range(20, 30) * dt

	x = random(1.0) * room_width
	y = 780
	can_jump = true
}