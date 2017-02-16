/// @descr scr_soul_bit_create()


event_inherited();

// object tracking
proximity_collision_script = scr_soul_bit_proximity_collision;

// settings
points = 1;

// drawing
image_speed = 0;
image_index = irandom_range(0, 2);
points += image_index;

