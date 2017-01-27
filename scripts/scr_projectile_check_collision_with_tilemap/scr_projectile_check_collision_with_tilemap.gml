/// @descr scr_projectile_check_collision_with_tilemap()

//
// Test Movement Collision Against Tilemap
//

projectile_inside_tilemap = false;
projectile_hit_tilemap_x = false;
projectile_hit_tilemap_y = false;

var steps = 0;
var wd = 0;
var hg = 0;
var target_x = 0;
var target_y = 0;
var result_x = 0;
var result_y = 0;
var t1 = 0;
var t2 = 0;

// if moving vertically
if (my != 0)
{
	// if moving more than the height of the sprite or the size of a tile
	// check the path, in increments, for any collisions
	steps = 1;
	hg = min((bbox_bottom - bbox_top), TILE_SIZE);
	if (abs(my) > hg)
	{
		steps = ceil(abs(my) / hg);
	}
	
	for (var i = 0; i <= steps; i++)
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
			// if moving down
			if (my > 0)
			{
				// if colliding with solids or top-solids
				if (t1 == TILE_SOLID || t1 == TILE_SOLID_TOP || t2 == TILE_SOLID|| t2 == TILE_SOLID_TOP)
				{
					// if first step, spawned inside a tile
					if (i == 0)
					{
						my = 0;
						velcoity_y = 0;
						projectile_inside_tilemap = true;
						break;
					}
					
					// check the result won't push the instance up
					result_y = ((target_y & ~NOT_TILE_SIZE) - 1);
					if (result_y >= bbox_bottom)
					{
						my = result_y - sprite_bbox_bottom - y;
						velocity_y = 0;
						projectile_hit_tilemap_y = true;
						break;
					}
					
				}
			}
			
			// else, if moving up
			else if (my < 0)
			{
				// if colliding with solids or bottom-solids
				if (t1 == TILE_SOLID || t1 == TILE_SOLID_BOTTOM || t2 == TILE_SOLID || t2 == TILE_SOLID_BOTTOM)
				{
					if (i == 0)
					{
						my = 0;
						velcoity_y = 0;
						projectile_inside_tilemap = true;
						break;
					}
					
					// check the result won't push the instance down
					result_y = ((target_y + TILE_SIZE) & ~NOT_TILE_SIZE);
					if (result_y <= bbox_top)
					{
						my = result_y - sprite_bbox_top - y;
						velocity_y = 0;
						projectile_hit_tilemap_y = true;
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
	// if moving more than the width of the sprite or the size of a tile
	// check the path, in increments, for any collisions
	steps = 1;
	wd = min((bbox_right - bbox_left), TILE_SIZE);
	if (abs(mx) > wd)
	{
		steps = ceil(abs(mx) / wd);
	}
	
	for (var i = 0; i <= steps; i++)
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
				if (t1 == TILE_SOLID || t1 == TILE_SOLID_RIGHT || t2 == TILE_SOLID || t2 == TILE_SOLID_RIGHT)
				{
					/*
					// if first step, spawned inside a tile
					if (i == 0)
					{
						mx = 0
						velocity_x = 0;
						projectile_inside_tilemap = true;
						break;
					}
					
					// check the result won't push the instance to the left
					result_x = ((target_x & ~NOT_TILE_SIZE) - 1);
					if (result_x >= bbox_right)
					{
						mx = result_x - sprite_bbox_right - x;
						velocity_x = 0;
						projectile_hit_tilemap_x = true;
						break;
					}
					*/
					mx = ((target_x & ~NOT_TILE_SIZE) - 1) - sprite_bbox_right - x;
					velocity_x = 0;
					projectile_hit_tilemap_x = true;
					break;
				}
			}
			
			// else, if moving left
			else if (mx < 0)
			{
				// if colliding with solids or left-solids
				if (t1 == TILE_SOLID || t1 == TILE_SOLID_LEFT || t2 == TILE_SOLID|| t2 == TILE_SOLID_LEFT)
				{
					/*
					// if first step, spawned inside a tile
					if (i == 0)
					{
						mx = 0;
						velocity_x = 0;
						projectile_inside_tilemap = true;
						break;
					}
					
					// check the result won't push the instance to the right
					result_x = ((target_x + TILE_SIZE) & ~NOT_TILE_SIZE);
					if (result_x <= bbox_left)
					{
						mx = result_x - sprite_bbox_left - x;
						velocity_x = 0;
						projectile_hit_tilemap_x = true;
						break;
					}
					*/
					mx = ((target_x + TILE_SIZE) & ~NOT_TILE_SIZE) - sprite_bbox_left - x;
					velocity_x = 0;
					projectile_hit_tilemap_x = true;
					break;
				}
			}
			
		}
		
	}
	
}

