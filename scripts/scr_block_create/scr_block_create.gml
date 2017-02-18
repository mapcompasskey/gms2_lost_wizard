/// @desc scr_block_create()


// states
is_active = global.BLOCKS_ACTIVE;
previous_is_active = !is_active;

// drawing
draw_sprite_index = sprite_index;
image_speed = 0;

// clear the sprite and mask so collision is ignored
sprite_index = noone;
mask_index = noone;
