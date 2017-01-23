/// @descr scr_entity_check_collision_with_tilemap_1()

//
// Test Movement Collision Against Tilemap
//

entity_hit_tilemap_x = false;
entity_hit_tilemap_y = false;

var steps = 0;
var wd = 0;
var hg = 0;
var target_x = 0;
var target_y = 0;
var result_x = 0;
var result_y = 0;
var t1 = 0;
var t2 = 0;

var tile_solid = 1;
var tile_solid_top = 2;
var tile_solid_bottom = 3;
var tile_solid_right = 4;
var tile_solid_left = 5;

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
				// if colliding with solids or top solids
				if (t1 == tile_solid || t1 == tile_solid_top || t2 == tile_solid || t2 == tile_solid_top)
				{
					// check the result won't push the entity up
					result_y = ((target_y & ~not_tile_size) - 1);
					if (result_y >= bbox_bottom)
					{
						my = result_y - sprite_bbox_bottom - y;
						velocity_y = 0;
						entity_hit_tilemap_y = true;
						break;
					}
					
				}
			}
			
			// else, if rising
			else if (my < 0)
			{
				// if colliding with solids or bottom solids
				if (t1 == tile_solid || t1 == tile_solid_bottom || t2 == tile_solid || t2 == tile_solid_bottom)
				{
					// check the result won't push the entity down
					result_y = ((target_y + tile_size) & ~not_tile_size);
					if (result_y <= bbox_top)
					{
						my = result_y - sprite_bbox_top - y;
						velocity_y = 0;
						entity_hit_tilemap_y = true;
						break;
					}
					
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
		
			// if moving right
			if (mx > 0)
			{	
				// if colliding with solids or right-solids
				if (t1 == tile_solid || t1 == tile_solid_right || t2 == tile_solid || t2 == tile_solid_right)
				{
					result_x = ((target_x & ~not_tile_size) - 1);
					if (result_x >= bbox_right)
					{
						mx = result_x - sprite_bbox_right - x;
						velcoity_x = 0;
						entity_hit_tilemap_x = true;
						break;
					}
				}
			}
			
			// else, if moving left
			else if (mx < 0)
			{
				// if colliding with solids or left-solids
				if (t1 == tile_solid || t1 == tile_solid_left || t2 == tile_solid || t2 == tile_solid_left)
				{
					result_x = ((target_x + tile_size) & ~not_tile_size);
					if (result_x <= bbox_left)
					{
						mx = result_x - sprite_bbox_left - x;
						velocity_x = 0;
						entity_hit_tilemap_x = true;
						break;
					}
				}
			}
			
		}
	}
}
