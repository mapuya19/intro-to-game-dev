/// @description Insert description here
// You can write your code in this editor

var dt = delta_time / 1000000 * global.simulation_speed

//gravity = 10 * dt

y_vel += gravity_custom * dt

if (up_is_jump && keyboard_check_pressed(ord(up_key)))
{
	if (jump_check && can_jump)
		Jump()
	else
		Jump()
	can_jump = false
}
else
{
	if (keyboard_check(ord(up_key)))
		y_vel -= jump_vel
	if (keyboard_check(ord(down_key)))
		y_vel += jump_vel
}

if (keyboard_check(ord(left_key)))
	x_vel -= horizontal_input_vel
	
if (keyboard_check(ord(right_key)))
	x_vel += horizontal_input_vel
	
// apply drag to velocity
x_vel *= (1 - linear_drag_x)
y_vel *= (1 - linear_drag_y)


x += x_vel * dt
y += y_vel * dt

// VERY LAZY BOUNCNG CODE
if (x > room_width - sprite_width || x < 0)
{
	// make sure obj doesn't go past "wall"
	if (x < 0) x = 1
	if (x > room_width) x = room_width - sprite_width - 1
	BounceX(restitution_x)
}

if (bottom_respawns && y > room_height)
{
	respawn()
}
else if (y > room_height - sprite_height)
{
	y = room_height - sprite_height - 1 // make sure obj doesn't go past "wall"
	BounceY(restitution_y)
	can_jump = true
}
else if (top_stops && y < 0)
{
	y = 1
	BounceY(restitution_y)
}