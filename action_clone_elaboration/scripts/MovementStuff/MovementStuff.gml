// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DirX(left, right) {
	var value = 0;
	
	if (keyboard_check(ord(left))) {
		value = -1;
	}
	
	if (keyboard_check(ord(right))) {
		value = 1;
	}
	
	return value;
}

function OtherDirX(left, right) {
	var value = 0;
	
	if (keyboard_check(vk_left)) {
		value = -1;
	}
	
	if (keyboard_check(vk_right)) {
		value = 1;
	}
	
	return value;
}