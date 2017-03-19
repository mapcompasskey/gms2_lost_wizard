/// @desc scr_enemy_slime_movement_collision()


//
// Enemy Movement Collision Tests
//

// test collisions
scr_entity_check_collision_with_tilemap();
scr_entity_check_edge_collision_with_tilemap();

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

// if the entity was moving
if (last_velocity_x != 0)
{
    // if the entity struck the tilemap or reached an edge
    if (entity_hit_tilemap_x || entity_at_edge_of_tilemap)
    {
        // turn around
        key_left = !key_left;
        key_right = !key_right;
    }
}
