/// @descr scr_player_attack_movement_collision()

//
// Player Attack Movement Collision Tests
//

// test collisions
scr_entity_check_collision_with_tilemap();

// if the entity was moving
if (last_velocity_x != 0)
{
	// if the entity struck the tilemap
    if (entity_hit_tilemap_x)
    {
		dying = true;
    }
}
