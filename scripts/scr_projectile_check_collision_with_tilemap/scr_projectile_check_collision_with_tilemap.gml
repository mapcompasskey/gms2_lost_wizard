/// @desc scr_projectile_check_collision_with_tilemap()


//
// Test Movement Collision Against Tilemap
//

projectile_inside_tilemap = false;
projectile_hit_tilemap_x = false;
projectile_hit_tilemap_y = false;

if (bbox_width && bbox_height)
{
    var steps = 0;
    var step_size = 0;
    var steps_2 = 0;
    var step_size_2 = 0;
    
    var offset_x = 0;
    var offset_y = 0;
    var target_x = 0;
    var target_y = 0;
    var result_x = 0;
    var result_y = 0;
    
    var collision = false;
    var tile_1 = 0;
    var tile_2 = 0;
    var tile_at_point = 0;
    
    
    //
    // Vertical Collision Test
    //
    if (my != 0)
    {
        // if moving more than the height of the sprite or the size of a tile,
        // check the path, using the smallest value, for any collisions
        steps = 1;
        if (abs(my) > min(bbox_height, TILE_SIZE))
        {
            steps = ceil(abs(my) / min(bbox_height, TILE_SIZE));
        }
        step_size = (my / steps);
        
        // if the sprite is wider than a tile,
        // check in increments along its width
        steps_2 = 1;
        if (bbox_width > TILE_SIZE)
        {
            steps_2 = ceil(bbox_width / TILE_SIZE);
        }
        step_size_2 = (bbox_width / steps_2);
        
        for (var i = 0; i <= steps; i++)
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
            
            // get top or bottom position
            target_y = round(y + offset_y + (step_size * i));
            
            // check left edge and mid points
            if ( ! collision)
            {
                for (var j = 0; j < steps_2; j++)
                {
                    target_x = round(x + sprite_bbox_left + (step_size_2 * j));
                    tile_at_point = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
                    if (tile_at_point == tile_1 || tile_at_point == tile_2)
                    {
                        collision = true;
                        j = steps_2;
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
            
            if (collision)
            {
                collision = false;
                
                // if moving up
                if (my < 0)
                {
                    result_y = ((target_y + TILE_SIZE) & ~NOT_TILE_SIZE);
                    collision = true;
                }
                // else, if moving down
                else
                {
                    result_y = ((target_y & ~NOT_TILE_SIZE) - 1);
                    collision = true;
                }
                
                if (collision)
                {
                    velocity_y = 0;
                    
                    // if first step, spawned inside a tile
                    if (i == 0)
                    {
                        my = 0;
                        projectile_inside_tilemap = true;
                        
                        break; // end for()
                    }
                    
                    my = result_y - offset_y - y;
                    projectile_hit_tilemap_y = true;
                    
                    break; // end for()
                }
            }
            
        }
        
    }
    
    
    //
    // Horizontal Collision Test
    //
    if (mx != 0)
    {
        // if moving more than the width of the sprite or the size of a tile,
        // check the path, using the smallest value, for any collisions
        steps = 1;
        if (abs(mx) > min(bbox_width, TILE_SIZE))
        {
            steps = ceil(abs(mx) / min(bbox_width, TILE_SIZE));
        }
        step_size = (mx / steps);
        
        // if the sprite is taller than a tile,
        // check in increments along its height
        steps_2 = 1;
        if (bbox_height > TILE_SIZE)
        {
            steps_2 = ceil(bbox_height / TILE_SIZE);
        }
        step_size_2 = (bbox_height / steps_2);
        
        for (var i = 0; i <= steps; i++)
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
            
            // get left or right position
            target_x = round(x + offset_x + (step_size * i));
            
            // check bottom edge and mid points
            if ( ! collision)
            {
                for (var j = 0; j < steps_2; j++)
                {
                    target_y = round(y + sprite_bbox_bottom + my - (step_size_2 * j));
                    tile_at_point = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
                    if (tile_at_point == tile_1 || tile_at_point == tile_2)
                    {
                        collision = true;
                        j = steps_2;
                    }
                }
            }
            
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
            
            if (collision)
            {
                collision = false;
                
                // if moving right
                if (mx > 0)
                {
                    result_x = ((target_x & ~NOT_TILE_SIZE) - 1);
                    collision = true;
                }
                // else, if moving left
                else
                {
                    result_x = ((target_x + TILE_SIZE) & ~NOT_TILE_SIZE);
                    collision = true;
                }
                
                if (collision)
                {
                    velocity_x = 0;
                    
                    // if first step, spawned inside a tile
                    if (i == 0)
                    {
                        mx = 0;
                        projectile_inside_tilemap = true;
                        
                        break; // end for()
                    }
                    
                    mx = result_x - offset_x - x;
                    projectile_hit_tilemap_x = true;
                    
                    break; // end for()
                }
            }
        }
    
    }

}

