/// @description Wait for cpu choose

global.cpu_card = ds_list_find_value(global.cpu, irandom(2));
global.cpu_card.target_x = room_width / 2;
global.cpu_card.target_y = global.cpu_card.target_y + 150;

audio_play_sound(snd_flip, 5, false);
global.cpu_choose = true;
