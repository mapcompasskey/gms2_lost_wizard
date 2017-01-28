/// @descr scr_entity_check_collision_with_tilemap()

//
// Test Movement Collision Against Tilemap
//

entity_hit_tilemap_x = false;
entity_hit_tilemap_y = false;

var steps = 0;
var step_size = 0;
var wd = (bbox_right - bbox_left);
var hg = (bbox_bottom - bbox_top);
var target_x = 0;
var target_y = 0;
var result_x = 0;
var result_y = 0;
var t1 = 0;
var t2 = 0;
var collision = false;

/*
// if moving vertically
if (my != 0)
{
	// if moving more than the height of the sprite or the size of a tile
	// check the path, in increments, for any collisions
	steps = 1;
	step_size = min(hg, TILE_SIZE);
	if (abs(my) > step_size)
	{
		steps = ceil(abs(my) / step_size);
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
				// if colliding with solids or top-solids
				if (t1 == TILE_SOLID || t1 == TILE_SOLID_TOP || t2 == TILE_SOLID || t2 == TILE_SOLID_TOP)
				{
					// check the result won't push the instance up
					result_y = ((target_y & ~NOT_TILE_SIZE) - 1);
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
				// if colliding with solids or bottom-solids
				if (t1 == TILE_SOLID || t1 == TILE_SOLID_BOTTOM || t2 == TILE_SOLID || t2 == TILE_SOLID_BOTTOM)
				{
					// check the result won't push the instance down
					result_y = ((target_y + TILE_SIZE) & ~NOT_TILE_SIZE);
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
*/

// if moving vertically
if (my != 0)
{
	collision = false;
	
	// if moving more than the height of the sprite or the size of a tile
	// check the path, in increments, for any collisions
	steps = 1;
	step_size = min(hg, TILE_SIZE);
	if (abs(my) > step_size)
	{
		steps = ceil(abs(my) / step_size);
	}
	
	for (var i = 1; i <= steps; i++)
	{
		// if falling
		if (my > 0)
		{
			target_y = round(y + sprite_bbox_bottom + ((my / steps) * i));
			
			// check left edge
			target_x = round(x + sprite_bbox_left);
			t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
			if (t1 == TILE_SOLID || t1 == TILE_SOLID_TOP)
			{
				collision = true;
			}
			
			// if the sprite is wider than a tile, check in increments along its edge
			if (wd > TILE_SIZE)
			{
				var steps2 = ceil(wd / TILE_SIZE);
				var step_size2 = (wd / steps2);
				
				for (var j = (steps2 - 1); j > 0; j--)
				{
					target_x = round(x + sprite_bbox_right - (step_size2 * j));
					t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
					if (t1 == TILE_SOLID || t1 == TILE_SOLID_TOP)
					{
						collision = true;
					}
				}
			}
			
			// check right edge
			target_x = round(x + sprite_bbox_right);
			t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
			if (t1 == TILE_SOLID || t1 == TILE_SOLID_TOP)
			{
				collision = true;
			}
			
			if (collision)
			{
				// check the result won't push the instance up
				result_y = ((target_y & ~NOT_TILE_SIZE) - 1);
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
			target_y = round(y + sprite_bbox_top + ((my / steps) * i));
			
			// check left edge
			target_x = round(x + sprite_bbox_left);
			t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
			if (t1 == TILE_SOLID || t1 == TILE_SOLID_BOTTOM)
			{
				collision = true;
			}
			
			// if the sprite is wider than a tile, check in increments along its edge
			if (wd > TILE_SIZE)
			{
				var steps2 = ceil(wd / TILE_SIZE);
				var step_size2 = (wd / steps2);
				
				for (var j = (steps2 - 1); j > 0; j--)
				{
					target_x = round(x + sprite_bbox_right - (step_size2 * j));
					t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
					if (t1 == TILE_SOLID || t1 == TILE_SOLID_BOTTOM)
					{
						collision = true;
					}
				}
			}
			
			// check right edge
			target_x = round(x + sprite_bbox_right);
			t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
			if (t1 == TILE_SOLID || t1 == TILE_SOLID_BOTTOM)
			{
				collision = true;
			}
			
			if (collision)
			{
				// check the result won't push the instance down
				result_y = ((target_y + TILE_SIZE) & ~NOT_TILE_SIZE);
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


// if moving horizontally
if (mx != 0)
{
	collision = false;
	
	// if moving more than the width of the sprite or the size of a tile
	// then check the path, in increments, for any collisions
	
	steps = 1;
	var step_size = min(wd, TILE_SIZE);
	if (abs(mx) > step_size)
	{
		steps = ceil(abs(mx) / step_size);
	}
	
	for (var i = 1; i <= steps; i++)
	{
		// if moving right
		if (mx > 0)
		{
			target_x = round(x + ((mx / steps) * i) + sprite_bbox_right);
			
			// check top edge
			target_y = round(y + sprite_bbox_top + my);
			t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
			if (t1 == TILE_SOLID || t1 == TILE_SOLID_RIGHT)
			{
				collision = true;
			}
			
			// if the sprite is taller than a tile, check in increments along its edge
			if (hg > TILE_SIZE)
			{
				var steps2 = ceil(hg / TILE_SIZE);
				var step_size2 = (hg / steps2);
				
				for (var j = (steps2 - 1); j > 0; j--)
				{
					target_y = round(y + sprite_bbox_bottom + my - (step_size2 * j));
					t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
					if (t1 == TILE_SOLID || t1 == TILE_SOLID_RIGHT)
					{
						collision = true;
						j = 0;
					}
				}
			}
			
			// chck bottom edge
			target_y = round(y + sprite_bbox_bottom + my);
			t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
			if (t1 == TILE_SOLID || t1 == TILE_SOLID_RIGHT)
			{
				collision = true;
			}
		
			if (collision)
			{
				// check the result won't push the instance to the left
				result_x = ((target_x & ~NOT_TILE_SIZE) - 1);
				if (result_x >= bbox_right)
				{
					mx = result_x - sprite_bbox_right - x;
					velocity_x = 0;
					entity_hit_tilemap_x = true;
					break;
				}
			}
		}
		
		// else, if moving left
		else if (mx < 0)
		{
			target_x = round(x + ((mx / steps) * i) + sprite_bbox_left);
			
			// check top edge
			target_y = round(y + sprite_bbox_top + my);
			t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
			if (t1 == TILE_SOLID || t1 == TILE_SOLID_LEFT)
			{
				collision = true;
			}
			
			// if the sprite is taller than a tile, check in increments along its edge
			if (hg > TILE_SIZE)
			{
				var steps2 = ceil(hg / TILE_SIZE);
				var step_size2 = (hg / steps2);
				
				for (var j = (steps2 - 1); j > 0; j--)
				{
					target_y = round(y + sprite_bbox_bottom + my - (step_size2 * j));
					t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
					if (t1 == TILE_SOLID || t1 == TILE_SOLID_LEFT)
					{
						collision = true;
						j = 0;
					}
				}
			}
			
			// chck bottom edge
			target_y = round(y + sprite_bbox_bottom + my);
			t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
			if (t1 == TILE_SOLID || t1 == TILE_SOLID_LEFT)
			{
				collision = true;
			}
		
			if (collision)
			{
				// check the result won't push the instance to the right
				result_x = ((target_x + TILE_SIZE) & ~NOT_TILE_SIZE);
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
