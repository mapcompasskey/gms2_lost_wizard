/// @desc scr_entity_check_collision_with_tilemap()


//
// Test Movement Collision Against Tilemap
//

entity_hit_tilemap_x = false;
entity_hit_tilemap_y = false;

if (bbox_width && bbox_height)
{
    if (mx != 0 || my != 0)
    {
        var tile_at_point = 0;
        var target_x = 0;
        var target_y = 0;
        var temp_mx = 0;
        var temp_my = 0;
        var collision_x = false;
        var collision_y = false;
        var result_x = 0;
        var result_y = 0;
        
        var offset_y = sprite_bbox_bottom;
        if (my < 0)
        {
            offset_y = sprite_bbox_top;
        }
        
        var offset_x = sprite_bbox_right;
        if (mx < 0)
        {
            offset_x = sprite_bbox_left;
        }
        
        var pt;
        var pt_x = 0;
        var pt_y = 0;
        var points = ds_list_create();
        var pt_steps = 0;
        var pt_step_size = 0;
        
        // if moving horizontally
        if (mx != 0)
        {
            // if the sprite is taller than a tile
            pt_steps = 1;
            //if (bbox_height > (TILE_SIZE/2))
            if (bbox_height > TILE_SIZE)
            {
                //pt_steps = ceil(bbox_height / (TILE_SIZE/2));
                pt_steps = ceil(bbox_height / TILE_SIZE);
            }
            pt_step_size = (bbox_height / pt_steps);
            
            // top most vertical point along with any mid-points
            for (var i = 0; i < pt_steps; i++)
            {
                pt = ds_list_create();
                ds_list_add(pt, (x + offset_x), (y + sprite_bbox_top + (pt_step_size * i)));
                ds_list_add(points, pt);
            }
            
            // bottom most vertical point
            pt = ds_list_create();
            ds_list_add(pt, (x + offset_x), (y + sprite_bbox_bottom));
            ds_list_add(points, pt);
        }
        
        // if moving vertically
        if (my != 0)
        {
            // if the sprite is wider than a tile
            pt_steps = 1;
            //if (bbox_width > (TILE_SIZE/2))
            if (bbox_width > TILE_SIZE)
            {
                //pt_steps = ceil(bbox_width / (TILE_SIZE/2));
                pt_steps = ceil(bbox_width / TILE_SIZE);
            }
            pt_step_size = (bbox_width / pt_steps);
            
            // left most horizontal point along with any mid-points
            for (var i = 0; i < pt_steps; i++)
            {
                pt = ds_list_create();
                ds_list_add(pt, (x + sprite_bbox_left + (pt_step_size * i)), (y + offset_y));
                ds_list_add(points, pt);
            }
            
            // right most horizontal point
            pt = ds_list_create();
            ds_list_add(pt, (x + sprite_bbox_right), (y + offset_y));
            ds_list_add(points, pt);
        }
        
        // get the movement distance and angle
        var move_distance = point_distance(0, 0, mx, my);
        var move_angle = point_direction(0, 0, mx, my);
        var angle_cos = dcos(move_angle);
        var angle_sin = dsin(move_angle) * -1;
        
        // if moving farther than the size of a tile, check collisions in smaller increments
        // *can use (TILE_SIZE / 2) to further increase the accuracy
        var steps = 1;
        //if (move_distance > (TILE_SIZE/2))
        if (move_distance > TILE_SIZE)
        {
            //steps = ceil(move_distance / (TILE_SIZE/2));
            steps = ceil(move_distance / TILE_SIZE);
        }
        var step_size = (move_distance / steps);
        
        // loop through each movement increment
        for (var i = 1; i <= steps; i++)
        {
            // if no horizontal collision (yet)
            if ( ! collision_x)
            {
                // test the next x-axis
                temp_mx = (angle_cos * step_size * i);
            }
            
            // if no vertical collision (yet)
            if ( ! collision_y)
            {
                // test the next y-axis
                temp_my = (angle_sin * step_size * i);
            }
            
            // loop through each point
            for (var j = 0; j < ds_list_size(points); j++)
            {
                pt = ds_list_find_value(points, j);
                pt_x = ds_list_find_value(pt, 0);
                pt_y = ds_list_find_value(pt, 1);
                
                // check horizontal collision
                // *start with the x-axis to give preference to horizontal movement
                if ( ! collision_x)
                {
                    target_x = pt_x + temp_mx;
                    if (mx > 0) target_x = ceil(target_x);
                    else if (mx < 0) target_x = floor(target_x);
                    
                    target_y = pt_y;
                    if (my > 0) target_y = ceil(target_y);
                    else if (my < 0) target_y = floor(target_y);
                    
                    tile_at_point = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
                    if (tile_at_point == TILE_SOLID)
                    {
                        // if moving right
                        if (mx > 0)
                        {
                            // check the result won't push the instance to the left
                            result_x = ((target_x & ~NOT_TILE_SIZE) - 1);
                            if (result_x >= bbox_right)
                            {
                                collision_x = true;
                            }
                        }
                        // else, if moving left
                        else
                        {
                            // check the result won't push the instance to the right
                            result_x = ((target_x + TILE_SIZE) & ~NOT_TILE_SIZE);
                            if (result_x <= bbox_left)
                            {
                                collision_x = true;
                            }
                        }
                        
                        if (collision_x)
                        {
                            temp_mx = result_x - offset_x - x;
                            mx = temp_mx;
                            velocity_x = 0;
                            entity_hit_tilemap_x = true;
                        }
                        
                    }
                }
                
                // check vertical collision
                if ( ! collision_y)
                {
                    target_x = pt_x + temp_mx;
                    if (mx > 0) target_x = ceil(target_x);
                    else if (mx < 0) target_x = floor(target_x);
                    
                    target_y = pt_y + temp_my;
                    if (my > 0) target_y = ceil(target_y);
                    else if (my < 0) target_y = floor(target_y);
                    
                    tile_at_point = tilemap_get_at_pixel(tilemap, target_x, target_y) & tile_index_mask;
                    if (tile_at_point == TILE_SOLID)
                    {
                        // if moving up
                        if (my < 0)
                        {
                            // check the result won't push the instance down
                            result_y = ((target_y + TILE_SIZE) & ~NOT_TILE_SIZE);
                            if (result_y <= bbox_top)
                            {
                                collision_y = true;
                            }
                        }
                        // else, if moving down
                        else
                        {
                            // check the result won't push the instance up
                            result_y = ((target_y & ~NOT_TILE_SIZE) - 1);
                            if (result_y >= bbox_bottom)
                            {
                                collision_y = true;
                            }
                        }
                        
                        if (collision_y)
                        {
                            temp_my = result_y - offset_y - y;
                            my = temp_my;
                            velocity_y = 0;
                            entity_hit_tilemap_y = true;
                        }
                    
                    }
                }
                
                if (collision_x && collision_y)
                {
                    break; // end for()
                }
                
            }
            
            if (collision_x && collision_y)
            {
                break; // end for()
            }
            
        }
    
    }
}


