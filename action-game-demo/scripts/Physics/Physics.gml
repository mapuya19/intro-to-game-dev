// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BounceX(restitution)
{
	x_vel *= restitution * -1
}

function BounceY(restitution)
{
	y_vel *= restitution * -1
}

function Jump()
{
	y_vel += -jump_vel
}