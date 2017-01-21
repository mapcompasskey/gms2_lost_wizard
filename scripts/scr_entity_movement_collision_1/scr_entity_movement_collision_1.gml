/// @scr_entity_movement_collision_1()

var pos_x = 0;
var pos_y = 0;

// if falling
if (my > 0)
{
	pos_y = round(y + sprite_bbox_bottom + my);

	pos_x = round(x + sprite_bbox_left);
	var t1 = tilemap_get_at_pixel(tilemap, pos_x, pos_y) & tile_index_mask;
	
	pos_x = round(x + sprite_bbox_right);
	var t2 = tilemap_get_at_pixel(tilemap, pos_x, pos_y) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0)
	{
		my = ((pos_y & ~not_tile_size) - 1) - sprite_bbox_bottom - y;
		velocity_y = 0;
		
		grounded = true;
	}
}

// else, if rising
else if (my < 0)
{
	pos_y = round(y + sprite_bbox_top + my);
	
	pos_x = round(x + sprite_bbox_left);
	var t1 = tilemap_get_at_pixel(tilemap, pos_x, pos_y) & tile_index_mask;
	
	pos_x = round(x + sprite_bbox_right);
	var t2 = tilemap_get_at_pixel(tilemap, pos_x, pos_y) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0)
	{
		my = ((pos_y + tile_size) & ~not_tile_size) - sprite_bbox_top - y;
		velocity_y = 0;
	}
}


// if moving right
if (mx > 0)
{
	pos_x = round(x + sprite_bbox_right + mx);
	
	pos_y = round(y + sprite_bbox_top + my);
	var t1 = tilemap_get_at_pixel(tilemap, pos_x, pos_y) & tile_index_mask;
	
	pos_y = round(y + sprite_bbox_bottom + my);
	var t2 = tilemap_get_at_pixel(tilemap, pos_x, pos_y) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0)
	{
		mx = ((pos_x & ~not_tile_size) - 1) - sprite_bbox_right - x;
		velocity_x = 0;
	}
}

// else, if moving left
else if (mx < 0)
{
	pos_x = round(x + sprite_bbox_left + mx);
	
	pos_y = round(y + sprite_bbox_top + my);
	var t1 = tilemap_get_at_pixel(tilemap, pos_x, pos_y) & tile_index_mask;
	
	pos_y = round(y + sprite_bbox_bottom + my);
	var t2 = tilemap_get_at_pixel(tilemap, pos_x, pos_y) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0)
	{
		mx = ((pos_x + tile_size) & ~not_tile_size) - sprite_bbox_left - x;
		velocity_x = 0;
	}
}

