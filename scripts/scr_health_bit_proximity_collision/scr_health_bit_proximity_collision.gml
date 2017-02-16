/// @descr scr_health_bit_proximity_collision()


//
// Health Bit Proximity Collision Tests
//

// update the player's health
if (instance_exists(global.PLAYER))
{
    with (global.PLAYER)
    {
        // increase the player's health
        current_health += other.points;
        if (current_health > max_health)
        {
            current_health = max_health;
        }
        
        // update the player health
        scr_update_globals_player_health();
    }
}

// kill the instance
dying = true;
instance_destroy();
