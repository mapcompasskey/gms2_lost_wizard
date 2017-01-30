/// @descr scr_entity_check_edge_collision_with_tilemap()

//
// Test Movement Collision Against Tile Edges
//

entity_at_edge_of_tilemap = false;

var steps = 0;
var step_size = 0;

var wd = 0;

var offset_x = 0;
var target_x = 0;
var target_y = 0;
var result_x = 0;

var collision = false;
var tile_at_point = 0;

// if grounded, and moving horizontally
if (grounded && mx != 0)
{
	// if moving more than the width of the sprite or the size of a tile,
	// check the path, using the smallest value, for any collisions
	steps = 1;
	wd = (bbox_right - bbox_left);
	if (abs(mx) > min(wd, TILE_SIZE))
	{
		steps = ceil(abs(mx) / min(wd, TILE_SIZE));
	}
	step_size = (mx / steps);
	
	for (var i = 1; i <= steps; i++)
	{
		// if moving right
		if (mx > 0)
		{
			offset_x = sprite_bbox_right;
		}
		// else, if moving left
		else
		{
			offset_x = sprite_bbox_left;
		}
		
		// get left or right position
		target_x = round(x + offset_x + (step_size * i));
	
		// check bottom edge
		target_y = round(y + sprite_bbox_bottom + 1);
		tile_at_point = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
		
		// if won't collide with any tile, except for bottom solids
		if (tile_at_point == 0 || tile_at_point == TILE_SOLID_BOTTOM)
		{
			// if moving right
			if (mx > 0)
			{
				result_x = ((target_x & ~NOT_TILE_SIZE) - 1);
				if (result_x >= bbox_right)
				{
					collision = true;
				}
			}
			
			// else, if moving left
			else if (mx < 0)
			{
				result_x = ((target_x + TILE_SIZE) & ~NOT_TILE_SIZE);
				if (result_x <= bbox_left)
				{
					collision = true;
				}
			}
		}
		
		if (collision)
		{
			mx = result_x - offset_x - x;
			velocity_x = 0;
			entity_at_edge_of_tilemap = true;
			break;
		}
		
	}
	
}
