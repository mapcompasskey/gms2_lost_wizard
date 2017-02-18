/// @desc scr_update_globals_player_health()


//
// Update the Player Health Global
//
if (instance_exists(global.PLAYER))
{
    with (global.PLAYER)
    {
        global.PLAYER_HEALTH = current_health;
        global.PLAYER_MAX_HEALTH = max_health;
    }
}

// update the Player Health in the HUD
scr_update_hud_player_health();
