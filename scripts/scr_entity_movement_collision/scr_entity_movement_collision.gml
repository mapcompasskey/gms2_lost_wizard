/// @scr_entity_movement_collision()

// test movemvent collisions
scr_entity_check_collision_with_tilemap();

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

