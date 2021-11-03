/// @description particle system

global.ps = part_system_create();
part_system_automatic_draw(global.ps, false);
part_system_depth(global.ps, -2000);

audio_play_sound(snd_rm, 10, false);