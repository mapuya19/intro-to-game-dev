/// @description Insert description here
// You can write your code in this editor

// Just a splash particle, customize it however you like
splash = part_type_create();
part_type_shape(splash, pt_shape_pixel);
part_type_size(splash, 1, 1, 0, 0);
part_type_scale(splash, 1, 1);
part_type_orientation(splash, 0, 0, 0, 0, 0);
part_type_color3(splash, 14932305, 14476625, 14673241);
part_type_blend(splash, 0);
part_type_life(splash, 20, 40);
part_type_speed(splash, 1, 5, 0, 0);
part_type_direction(splash, 45, 135, 0, 0);
part_type_gravity(splash, 0.30, 270);
