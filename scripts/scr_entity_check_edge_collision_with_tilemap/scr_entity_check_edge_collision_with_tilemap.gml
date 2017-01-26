/// @descr scr_entity_check_edge_collision_with_tilemap()

//
// Test Movement Collision Against Tile Edges
//

entity_at_edge_of_tilemap = false;

var steps = 0;
var wd = 0;
var target_x = 0;
var target_y = 0;
var result_x = 0;
var t1 = 0;

// if grounded, and moving horizontally
if (grounded && mx != 0)
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
	
		// check bottom edge
		target_y = round(y + sprite_bbox_bottom + 1);
		t1 = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
		
		// if wouldn't collide with any tile, except for bottom solids
		if (t1 == 0 || t1 == TILE_SOLID_BOTTOM)
		{
			// if moving right
			if (mx > 0)
			{
				result_x = ((target_x & ~NOT_TILE_SIZE) - 1);
				if (result_x >= bbox_right)
				{
					mx = result_x - sprite_bbox_right - x;
				}
			}
			
			// else, if moving left
			else if (mx < 0)
			{
				result_x = ((target_x + TILE_SIZE) & ~NOT_TILE_SIZE);
				if (result_x <= bbox_left)
				{
					mx = result_x - sprite_bbox_left - x;
				}
			}
		
			entity_at_edge_of_tilemap = true;
		}
		
	}
	
}
