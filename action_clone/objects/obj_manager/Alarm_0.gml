/// @description Create new clouds

var border = 100;
var minx = border;
var miny = border;

var maxx = room_width - border;
var maxy = room_height - border;

var posx = random_range (minx, maxx);
var posy = random_range (miny, maxy);

instance_create_layer(posx, posy, "Instances", obj_cloud);

alarm[0] = room_speed * 1;