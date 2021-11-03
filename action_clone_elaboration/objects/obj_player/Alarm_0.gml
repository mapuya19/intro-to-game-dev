/// @description Respawn

_accelx = 0;
_accely = 0;

_velX = random_range(0, 1);
_velY = -40;

audio_play_sound(snd_start, 10, false);
first_start = false;

x = random(1.0) * room_width;
y = room_height;

score_done = false;
