/// @description Insert description here
// You can write your code in this editor

// we will draw particles on this surface
surf = surface_create(room_width, room_height);

// create a raindrop particle
rain = part_type_create();
// optional angle, this will create some kind of wind effect
rain_angle = -10

// Raindrop
rain = part_type_create();
part_type_shape(rain , pt_shape_pixel);
part_type_size(rain, 2, 2, 0, 0);
part_type_scale(rain, 1, 8);
part_type_orientation(rain, rain_angle, rain_angle, 0, 0, 0);
part_type_color1(rain, c_aqua);
part_type_alpha3(rain, 1, 1, 1);
part_type_blend(rain, 0);
part_type_life(rain, 120, 120);
part_type_speed(rain, 20, 20, 0, 0);
part_type_direction(rain, 270+rain_angle, 270+rain_angle, 0, 0);