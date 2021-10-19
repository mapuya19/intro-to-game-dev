/// @description Insert description here
// You can write your code in this editor

if (obj_player.has_key == true) {
	audio_play_sound(snd_open_door, 10, false);
	instance_destroy();
}