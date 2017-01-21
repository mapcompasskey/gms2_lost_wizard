/// @scr_entity_movement_collision_2()

var steps = 0;
var wd = 0;
var hg = 0;
var pos_x = 0;
var pos_y = 0;
var t1 = 0;
var t2 = 0;

// if moving vertically
if (my != 0)
{
	// if moving more than the height of the sprite
	// check the path, in increments, for any collisions
	steps = 1;
	hg = (bbox_bottom - bbox_top);
	if (abs(my) > hg)
	{
		steps = ceil(abs(my) / hg);
	}
	
	for (var i = 1; i <= steps; i++)
	{
		// if falling
		if (my > 0)
		{
			pos_y = round(y + sprite_bbox_bottom + ((my / steps) * i));
		}
		// else, if rising
		else
		{
			pos_y = round(y + sprite_bbox_top + ((my / steps) * i));
		}
		
		// check left edge
		pos_x = round(x + sprite_bbox_left);
		t1 = tilemap_get_at_pixel(tilemap, pos_x, pos_y) & tile_index_mask;
		
		// check right edge
		pos_x = round(x + sprite_bbox_right);
		t2 = tilemap_get_at_pixel(tilemap, pos_x, pos_y) & tile_index_mask;
	
		if (t1 != 0 || t2 != 0)
		{
			// if falling
			if (my > 0)
			{
				my = ((pos_y & ~not_tile_size) - 1) - sprite_bbox_bottom - y;
				grounded = true;
			}
			// else, if rising
			else
			{
				my = ((pos_y + tile_size) & ~not_tile_size) - sprite_bbox_top - y;
			}
				
			velocity_y = 0;
			break;
		}
	}
}

// if moving horizontally
if (mx != 0)
{
	// if moving more than the width of the sprite
	// check the path, in increments, for any collisions
	steps = 1;
	wd = (bbox_right - bbox_left);
	if (abs(mx) > wd)
	{
		steps = ceil(abs(mx) / wd);
	}
	
	for (var i = 1; i <= steps; i++)
	{
		// if moving right
		if (mx > 0)
		{
			pos_x = round(x + ((mx / steps) * i) + sprite_bbox_right);
		}
		// else, if moving left
		else
		{
			pos_x = round(x + ((mx / steps) * i) + sprite_bbox_left);
		}
		
		// check top edge
		pos_y = round(y + sprite_bbox_top + my);
		t1 = tilemap_get_at_pixel(tilemap, pos_x, pos_y) & tile_index_mask;
		
		// check bottom edge
		pos_y = round(y + sprite_bbox_bottom + my);
		t2 = tilemap_get_at_pixel(tilemap, pos_x, pos_y) & tile_index_mask;
		
		if (t1 != 0 || t2 != 0)
		{
			// if moving right
			if (mx > 0)
			{
				mx = ((pos_x & ~not_tile_size) - 1) - sprite_bbox_right - x;
			}
			// else, if moving left
			else
			{
				mx = ((pos_x + tile_size) & ~not_tile_size) - sprite_bbox_left - x;
			}
			
			velocity_x = 0;
		}
	}
}
