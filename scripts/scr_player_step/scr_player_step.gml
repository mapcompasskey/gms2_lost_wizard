/// @descr scr_player_step()

/*
var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom + 1) & tile_index_mask;
var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom + 1) & tile_index_mask;
if (t1 != 0 || t2 != 0)
{
	if (keyboard_check_pressed(vk_up))
	{
		v_speed = -jump_impulse;
	}
}
*/
if (keyboard_check_pressed(vk_up))
{
	v_speed = -jump_impulse;
}

var dx = move_speed * (keyboard_check(vk_right) - keyboard_check(vk_left));
var dy = v_speed;
v_speed += grav;

// do vertical movement
y += dy;

// moving down
if (dy > 0)
{
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0)
	{
		y = ((bbox_bottom & ~15) - 1) - sprite_bbox_bottom;
		v_speed = 0;
	}
}
// moving up
else
{
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0)
	{
		//show_debug_message("bbox_top: " + string(bbox_top));
		//show_debug_message("bbox_top + 16: " + string(bbox_top + 16));
		//show_debug_message("~15: " + string(~15));
		//show_debug_message("(bbox_top + 15) & ~15: " + string((bbox_top + 16) & ~15) );
		//show_debug_message("tileamp: " + string(tilemap_get_at_pixel(tilemap, bbox_left, bbox_top)));
		//show_debug_message("index_mask: " + string(t1));
		
		//y = ((bbox_top + 16) & ~15) - sprite_bbox_top;
		y = ((bbox_top + tile_size) & ~not_tile_size) - sprite_bbox_top;
		v_speed = 0;
	}
}

// do horizontal movement
x += dx;

// moving right
if (dx > 0)
{
	var t1 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0)
	{
		//x = ((bbox_right & ~15) - 1) - sprite_bbox_right;
		x = ((bbox_right & ~not_tile_size) - 1) - sprite_bbox_right;
	}
}

// moving left
else
{
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0)
	{
		//x = ((bbox_left + 16) & ~15) - sprite_bbox_left;
		x = ((bbox_left + tile_size) & ~not_tile_size) - sprite_bbox_left;
	}
}
