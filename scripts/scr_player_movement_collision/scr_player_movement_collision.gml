/// @desc scr_player_movement_collision()


//
// Player Movement Collision Tests
//

// test collisions
scr_entity_check_collision_with_tilemap();
scr_entity_check_collision_with_blocks();

// reset grounded
grounded = false;

// if the entity was falling
if (last_velocity_y > 0)
{
    // if the entity struck the tilemap
    if (entity_hit_tilemap_y)
    {
        grounded = true;
    }
}

