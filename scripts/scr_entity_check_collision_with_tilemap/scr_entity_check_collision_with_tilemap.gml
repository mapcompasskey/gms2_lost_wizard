/// @descr scr_entity_check_collision_with_tilemap()

//
// Test Movement Collision Against Tilemap
//

entity_hit_tilemap_x = false;
entity_hit_tilemap_y = false;

var steps = 0;
var step_size = 0;
var steps_2 = 0;
var step_size_2 = 0;
				
var wd = (bbox_right - bbox_left);
var hg = (bbox_bottom - bbox_top);

var target_x = 0;
var target_y = 0;
var result_x = 0;
var result_y = 0;
var offset_x = 0;
var offset_y = 0;

var collision = false;
var tile_1 = 0;
var tile_2 = 0;
var tile_at_point = 0;


//
// Vertical Collision Test
//
if (my != 0)
{
	steps = 1;
	
	// if moving more than the height of the sprite or the size of a tile,
	// check the path, using the smallest increments, for any collisions
	step_size = min(hg, TILE_SIZE);
	if (abs(my) > step_size)
	{
		steps = ceil(abs(my) / step_size);
	}
	
	// if the sprite is wider than a tile,
	// check in increments along its width
	steps_2 = 0;
	if (wd > TILE_SIZE)
	{
		steps_2 = ceil(wd / TILE_SIZE);
		step_size_2 = (wd / steps_2);
	}
	
	for (var i = 1; i <= steps; i++)
	{
		collision = false;
		tile_1 = TILE_SOLID;
		
		// if moving up
		if (my < 0)
		{
			offset_y = sprite_bbox_top;
			tile_2 = TILE_SOLID_BOTTOM;
		}
		// else, if moving down
		else
		{
			offset_y = sprite_bbox_bottom;
			tile_2 = TILE_SOLID_TOP;
		}
		
		target_y = round(y + offset_y + ((my / steps) * i));
		
		/**/
		// check left edge
		if ( ! collision)
		{
			target_x = round(x + sprite_bbox_left);
			tile_at_point = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
			if (tile_at_point == tile_1 || tile_at_point == tile_2)
			{
				collision = true;
			}
		}
		
		// check mid points
		if ( ! collision && steps_2 > 1)
		{
			for (var j = (steps_2 - 1); j > 0; j--)
			{
				target_x = round(x + sprite_bbox_right - (step_size_2 * j));
				tile_at_point = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
				if (tile_at_point == tile_1 || tile_at_point == tile_2)
				{
					collision = true;
					j = 0;
				}
			}
		}
		
		// check right edge
		if ( ! collision)
		{
			target_x = round(x + sprite_bbox_right);
			tile_at_point = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
			if (tile_at_point == tile_1 || tile_at_point == tile_2)
			{
				collision = true;
			}
		}
		/**/
		
		/*
		if ( ! collision)
		{
			// check left edge
			target_x = round(x + sprite_bbox_left);
			collision = scr_check_point_on_tilemap(tilemap, target_x, target_y, tile_1, tile_2);
		}
		
		if ( ! collision)
		{
			// if the sprite is wider than a tile,
			// check in increments along its edge
			if (wd > TILE_SIZE)
			{
				var steps2 = ceil(wd / TILE_SIZE);
				var step_size2 = (wd / steps2);
				
				for (var j = (steps2 - 1); j > 0; j--)
				{
					// check mid point
					target_x = round(x + sprite_bbox_right - (step_size2 * j));
					collision = scr_check_point_on_tilemap(tilemap, target_x, target_y, tile_1, tile_2);
					if (collision) j = 0;
				}
			}
		}
		
		if ( ! collision)
		{
			// check right edge
			target_x = round(x + sprite_bbox_right);
			collision = scr_check_point_on_tilemap(tilemap, target_x, target_y, tile_1, tile_2);
		}
		*/
		
		if (collision)
		{
			collision = false;
			
			// if moving up
			if (my < 0)
			{
				// check the result won't push the instance down
				result_y = ((target_y + TILE_SIZE) & ~NOT_TILE_SIZE);
				if (result_y <= bbox_top)
				{
					collision = true;
				}
			}
			// else, if moving down
			else
			{
				// check the result won't push the instance up
				result_y = ((target_y & ~NOT_TILE_SIZE) - 1);
				if (result_y >= bbox_bottom)
				{
					collision = true;
				}
			}
			
			if (collision)
			{
				my = result_y - offset_y - y;
				velocity_y = 0;
				entity_hit_tilemap_y = true;
				break;
			}
		}
		
	}
	
}


//
// Test Horizontal Collision
//
if (mx != 0)
{
	steps = 1;
	
	// if moving more than the width of the sprite or the size of a tile,
	// then check the path, in increments, for any collisions
	var step_size = min(wd, TILE_SIZE);
	if (abs(mx) > step_size)
	{
		steps = ceil(abs(mx) / step_size);
	}
	
	// if the sprite is taller than a tile,
	// check in increments along its height
	steps_2 = 0;
	if (hg > TILE_SIZE)
	{
		steps_2 = ceil(hg / TILE_SIZE);
		step_size_2 = (hg / steps_2);
	}
	
	for (var i = 1; i <= steps; i++)
	{
		collision = false;
		tile_1 = TILE_SOLID;
		
		// if moving right
		if (mx > 0)
		{
			offset_x = sprite_bbox_right;
			tile_2 = TILE_SOLID_RIGHT;
		}
		// else, if moving left
		else
		{
			offset_x = sprite_bbox_left;
			tile_2 = TILE_SOLID_LEFT;
		}
		
		target_x = round(x + offset_x + ((mx / steps) * i));
		
		/**/
		// check top edge
		if ( ! collision)
		{
			target_y = round(y + sprite_bbox_top + my);
			tile_at_point = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
			if (tile_at_point == tile_1 || tile_at_point == tile_2)
			{
				collision = true;
			}
		}
		
		// check mid points
		if ( ! collision && steps_2 > 1)
		{
			for (var j = (steps_2 - 1); j > 0; j--)
			{
				target_y = round(y + sprite_bbox_bottom + my - (step_size_2 * j));
				tile_at_point = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
				if (tile_at_point == tile_1 || tile_at_point == tile_2)
				{
					collision = true;
					j = 0;
				}
			}
		}
		
		// check bottom edge
		if ( ! collision)
		{
			target_y = round(y + sprite_bbox_bottom + my);
			tile_at_point = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
			if (tile_at_point == tile_1 || tile_at_point == tile_2)
			{
				collision = true;
			}
		}
		/**/
		
		/*
		if ( ! collision)
		{
			// check top edge
			target_y = round(y + sprite_bbox_top + my);
			collision = scr_check_point_on_tilemap(tilemap, target_x, target_y, tile_1, tile_2);
		}
		
		if ( ! collision)
		{
			// if the sprite is taller than a tile,
			// check in increments along its edge
			if (hg > TILE_SIZE)
			{
				var steps2 = ceil(hg / TILE_SIZE);
				var step_size2 = (hg / steps2);
				
				for (var j = (steps2 - 1); j > 0; j--)
				{
					target_y = round(y + sprite_bbox_bottom + my - (step_size2 * j));
					collision = scr_check_point_on_tilemap(tilemap, target_x, target_y, tile_1, tile_2);
					if (collision) j = 0;
				}
			}
		}
		
		if ( ! collision)
		{
			// chck bottom edge
			target_y = round(y + sprite_bbox_bottom + my);
			collision = scr_check_point_on_tilemap(tilemap, target_x, target_y, tile_1, tile_2);
		}
		*/
		
		if (collision)
		{
			collision = false;
			
			// if moving right
			if (mx > 0)
			{
				// check the result won't push the instance to the left
				result_x = ((target_x & ~NOT_TILE_SIZE) - 1);
				if (result_x >= bbox_right)
				{
					collision = true;
				}
			}
			// else, if moving left
			else
			{
				// check the result won't push the instance to the right
				result_x = ((target_x + TILE_SIZE) & ~NOT_TILE_SIZE);
				if (result_x <= bbox_left)
				{
					collision = true;
				}
			}
			
			if (collision)
			{
				mx = result_x - offset_x - x;
				velocity_x = 0;
				entity_hit_tilemap_x = true;
				break;
			}
		}
		
	}
	
}
