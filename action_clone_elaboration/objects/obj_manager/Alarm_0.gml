/// @description Create new clouds

var minx = 100;
var miny = 400;

var maxx = room_width - 150;
var maxy = room_height - 300;

var posx = random_range(minx, maxx);
var posy = random_range(miny, maxy);

instance_create_layer(posx, posy, "Instances", obj_cloud);

alarm[0] = room_speed * 0.5;