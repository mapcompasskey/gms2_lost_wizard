/// @descr scr_entity_check_collision_with_blocks()


//
// Test Movement Collision Against Blocks
//

entity_hit_block_x = false;
entity_hit_block_y = false;

if (check_blocks_collision)
{
    var temp_my = 0 ;
    var temp_mx = 0 ;

    //
    // Vertical Collision Test
    //
    if (my != 0)
    {
        if (place_meeting(x, y + my, obj_block))
        {
            while ( ! place_meeting(x, y + temp_my + sign(my), obj_block))
            {
                temp_my += sign(my);
            }
        
            my = (round(y) + temp_my - y);
            velocity_y = 0;
            entity_hit_block_y = true;
        }
    }


    //
    // Horizontal Collision Test
    //
    if (mx != 0)
    {
        if (place_meeting(x + mx, y + my, obj_block))
        {
            while ( ! place_meeting(x + temp_mx + sign(mx), y + my, obj_block))
            {
                temp_mx += sign(mx);
            }
        
            mx = (round(x) + temp_mx - x);
            velocity_x = 0;
            entity_hit_block_x = true;
        }
    }
}
