/// @scr_entity_movement_collision_3()

var steps = 0;
var wd = 0;
var hg = 0;
var target_x = 0;
var target_y = 0;
var t1 = 0;
var t2 = 0;
var platform_tile = 2;

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
			target_y = round(y + sprite_bbox_bottom + ((my / steps) * i));
		}
		// else, if rising
		else
		{
			target_y = round(y + sprite_bbox_top + ((my / steps) * i));
		}
		
		// check left edge
		target_x = round(x + sprite_bbox_left);
		t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
		
		// check right edge
		target_x = round(x + sprite_bbox_right);
		t2 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
		
		if (t1 != 0 || t2 != 0)
		{
		
			// if falling
			if (my > 0)
			{
				// check the result won't push the entity up
				var result_y = ((target_y & ~not_tile_size) - 1) - sprite_bbox_bottom;
				if (result_y >= bbox_bottom)
				{
					my = result_y - y;
					velocity_y = 0;
					grounded = true;
					break;
				}
			}
			// else, if rising
			else
			{
				// if colliding with anything but one-way platforms
				if (t1 != platform_tile && t2 != platform_tile)
				{
					my = ((target_y + tile_size) & ~not_tile_size) - sprite_bbox_top - y;
					velocity_y = 0;
					break;
				}
			}
			
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
			target_x = round(x + ((mx / steps) * i) + sprite_bbox_right);
		}
		// else, if moving left
		else
		{
			target_x = round(x + ((mx / steps) * i) + sprite_bbox_left);
		}
		
		// check top edge
		target_y = round(y + sprite_bbox_top + my);
		t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
		
		// check bottom edge
		target_y = round(y + sprite_bbox_bottom + my);
		t2 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
		
		if (t1 != 0 || t2 != 0)
		{
			// if collision with anything but one-way platforms
			if (t1 != platform_tile && t2 != platform_tile)
			{
			
				// if moving right
				if (mx > 0)
				{
					mx = ((target_x & ~not_tile_size) - 1) - sprite_bbox_right - x;
					velcoity_x = 0;
					break;
				}
				// else, if moving left
				else
				{
					mx = ((target_x + tile_size) & ~not_tile_size) - sprite_bbox_left - x;
					velocity_x = 0
					break;
				}
				
			}
		}
	}
}
