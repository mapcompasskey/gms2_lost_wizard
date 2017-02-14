/// @descr scr_update_players_health()


//
// Update the Player's Health
//

// update the player's current health
if (instance_exists(global.PLAYER))
{
    with (global.PLAYER)
    {
        global.PLAYER_HEALTH = current_health;
        global.PLAYER_MAX_HEALTH = max_health;
    }
}

// update the player's health in the HUD
if (instance_exists(global.HUD))
{
    with (global.HUD)
    {
        player_health = global.PLAYER_HEALTH;
        player_max_health = global.PLAYER_MAX_HEALTH;
        player_health_updated = true;
    }
}
