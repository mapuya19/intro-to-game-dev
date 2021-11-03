/// @description Insert description here
// You can write your code in this editor

// This just spawns 20 raindrops every step.
repeat(10) {
    part_particles_create(global.ps, random_range(-100, room_width+100), random_range(-100, 0), rain, 1);
}